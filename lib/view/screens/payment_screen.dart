import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gpay_clone_for_curie/values/app_assets.dart';
import 'package:gpay_clone_for_curie/values/app_colors.dart';
import 'package:gpay_clone_for_curie/values/app_values.dart';
import 'package:gpay_clone_for_curie/values/app_strings.dart';
import 'package:gpay_clone_for_curie/view/screens/password_screen.dart';

import '../../model/transaction.dart';
import '../components/payment_screen/bank_detail_card.dart';

import 'dart:math' as math;

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int selectedIndex = 0;
  FocusNode textFieldFocus = FocusNode();
  TextEditingController textEditingController = TextEditingController();
  double amount = 0.0;
  bool chooseAccount = false;
  bool processingPayment = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back_ios_rounded),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.report_gmailerrorred_rounded)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_rounded))
          ],
        ),
        body: SizedBox(
          height: height,
          // width: width,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.lightBlueAccent,
                      radius: 30,
                      child: Center(
                          child: Image.asset(
                        AppAssets.icici,
                        height: 40,
                      )),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(AppStrings.paying(AppStrings.payeeName),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500)),
                  Text("(${AppStrings.payeeUpiId})", style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500)),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: SizedBox(
                              width: 20,
                              child: Text(AppStrings.rupeeSymbol,
                                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w500)),
                            ),
                          ),
                          Flexible(
                            fit: FlexFit.loose,
                            child: Container(
                              // color: Colors.red,
                              constraints:
                                  BoxConstraints(minWidth: 0, maxWidth: amount == 0.0 ? 30 : (30 * (amount.toString().length - 2)).toDouble()),
                              child: TextField(
                                controller: textEditingController,
                                focusNode: textFieldFocus,
                                autofocus: true,
                                minLines: 1,
                                maxLines: 1,
                                onChanged: (value) {
                                  if(double.parse(value)>maxAmountToSend){
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(AppStrings.canNotSend),
                                        )
                                    );
                                    textEditingController.text = amount.toString();
                                  }else{
                                    setState(() {
                                      amount = double.parse(value == '' ? '0.0' : value);
                                    });
                                  }


                                },
                                onTap: () {
                                  setState(() {
                                    textFieldFocus.hasFocus;
                                  });
                                },
                                onTapOutside: (event) {
                                  setState(() {
                                    textFieldFocus.unfocus();
                                  });
                                },
                                maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
                                style: const TextStyle(fontSize: 50, height: 1.25),
                                keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: false),
                                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))],
                                cursorColor: Colors.black,
                                cursorHeight: 60,
                                decoration: const InputDecoration.collapsed(
                                  hintText: '0',
                                  hintStyle: TextStyle(fontSize: 50, color: Colors.black),
                                  // border: InputBorder.none
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              !textFieldFocus.hasFocus && !(amount == 0.0)
                  ? Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child:  Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [BoxShadow(color: Colors.grey.shade300, spreadRadius: 2, blurRadius: 2)]),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white,
                          ),
                          child: AnimatedSize(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.decelerate,
                            child: processingPayment ? Padding(
                              padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      height: 30,
                                      width: 30,
                                      child: CircularProgressIndicator(color: AppColors.blue,)),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                                    child: Text(AppStrings.paying(AppStrings.payeeName),style: Theme.of(context).textTheme.titleMedium),
                                  )
                                ],
                              ),
                            ) :Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                chooseAccount
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 8),
                                        child: Column(
                                          children: [
                                            ...accounts
                                                .map(
                                                  (e) => Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            chooseAccount = false;
                                                            selectedIndex = accounts.indexOf(e);
                                                          });
                                                          print(selectedIndex);
                                                        },
                                                        child: BankDetailCard(
                                                          cardIndex: accounts.indexOf(e),
                                                          selectedIndex: selectedIndex,
                                                          bankAccount: e,
                                                          chooseAccount: chooseAccount,
                                                        )),
                                                  ),
                                                )
                                                .toList(),
                                          ],
                                        ),
                                      )
                                    : Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                                            child: Text(
                                              AppStrings.chooseBankAccount,
                                              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 18),
                                            ),
                                          ),
                                          InkWell(
                                              onTap: () {
                                                setState(() {
                                                  chooseAccount = true;
                                                });
                                              },
                                              child: BankDetailCard(
                                                cardIndex: 0,
                                                selectedIndex: selectedIndex,
                                                bankAccount: accounts[selectedIndex],
                                                chooseAccount: chooseAccount,
                                              )),
                                        ],
                                      ),
                                SizedBox(
                                  width: width,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                    child: ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all(AppColors.buttonColor),
                                          foregroundColor: MaterialStateProperty.all(Colors.white),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            processingPayment = true;
                                            Future.delayed(Duration(seconds: 3)).then((value){
                                              processingPayment = false;
                                              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                                return PasswordScreen(bankAccount: accounts[selectedIndex],
                                                transaction: Transaction(amount,AppStrings.payeeName,AppStrings.payeeUpiId,DateTime.now(),
                                                     math.Random().nextInt(99999999).toString()
                                                ),
                                                );
                                              },));
                                            });
                                          });
                                        },
                                        child: Text(AppStrings.pay(amount))),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    AppStrings.poweredBy,
                                    style: Theme.of(context).textTheme.titleSmall,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 4),
                                  child: Center(
                                      child: Image.asset(
                                    AppAssets.upiLogo,
                                    height: 20,
                                  )),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
        ),
        floatingActionButton: textFieldFocus.hasFocus
            ? FloatingActionButton(
                onPressed: () {
                  setState(() {
                    textFieldFocus.unfocus();
                  });
                },
                backgroundColor: AppColors.buttonColor,
                child: const Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white,
                ),
              )
            : Container(),
      ),
    );
  }
}
