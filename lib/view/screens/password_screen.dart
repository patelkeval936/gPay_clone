import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpay_clone_for_curie/model/bank_account.dart';
import 'package:gpay_clone_for_curie/model/transaction.dart';
import 'package:gpay_clone_for_curie/values/app_assets.dart';
import 'package:gpay_clone_for_curie/values/app_colors.dart';
import 'package:gpay_clone_for_curie/values/app_values.dart';
import 'package:gpay_clone_for_curie/values/app_strings.dart';
import 'package:gpay_clone_for_curie/view/components/password_screen//password_box.dart';
import 'package:bloc/bloc.dart';
import '../components/password_screen/bank_detail_card.dart';

class PasswordScreen extends StatefulWidget {
  final BankAccount bankAccount;
  final Transaction transaction;
  const PasswordScreen({Key? key, required this.bankAccount, required this.transaction}) : super(key: key);

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}


class _PasswordScreenState extends State<PasswordScreen> {

  bool showPassword = false;
  bool showError = false;
  bool showPaymentInfo = false;

  int currentPointer = 0;
  late List<int?> passwordValues;

  @override
  void initState() {
    passwordValues = List.generate(widget.bankAccount.digitPassword, (index) => null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: height,
          width: width,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      width: width,
                      height: 60,
                      child: Padding(
                        padding: horizontal16,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppStrings.bankName,
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 30, child: Image.asset(AppAssets.upiLogo))
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          showPaymentInfo = !showPaymentInfo;
                        });
                      },
                      child: Container(
                        color: AppColors.blue,
                        width: width,
                        height: 40,
                        child: Padding(
                          padding: horizontal16,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppStrings.payeeName,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${AppStrings.rupeeSymbol} ${widget.transaction.amount.toStringAsFixed(2)}',
                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    width: 40,
                                    child: AnimatedRotation(
                                      turns: showPaymentInfo ? 0.5 : 0,
                                      duration: const Duration(milliseconds: 500),
                                      child: const Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: widget.bankAccount.digitPassword == 4 ? width * 0.7 : width * 0.8,
                      child: Column(
                        children: [
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppStrings.enterUpiPin,
                                  style:
                                      Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, color: Colors.grey.shade700),
                                ),
                                Builder(builder: (context) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        showPassword = !showPassword;
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Icon(
                                            showPassword ? Icons.visibility_off : Icons.visibility,
                                            color: AppColors.blue,
                                          ),
                                          Padding(
                                            padding: horizontal8,
                                            child: Text(
                                              showPassword ? AppStrings.hide : AppStrings.show,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge
                                                  ?.copyWith(color: AppColors.blue, fontWeight: FontWeight.bold),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                })
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 80,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ...List.generate(
                                    widget.bankAccount.digitPassword,
                                    (index) => PasswordBox(
                                          index: index,
                                          pointer: currentPointer,
                                          value: passwordValues[index],
                                          showPassword: showPassword,
                                        )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    Container(
                      width: width * 0.8,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(14), color: Colors.orangeAccent.withOpacity(0.3)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Icon(
                              Icons.info,
                              color: Colors.orange,
                              size: 30,
                            ),
                            SizedBox(
                              width: width * 0.6,
                              child: Text(
                                AppStrings.youAreTransferringMoneyTo(AppStrings.payeeName),
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                    // Image.asset(AppAssets.password),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    AnimatedContainer(
                      color: Colors.grey.shade300,
                      width: width,
                      height: !showError ? 0 : 60,
                      curve: Curves.linear,
                      duration: const Duration(milliseconds: 500),
                      child: Padding(
                        padding: horizontal16,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppStrings.pleaseEnterPassword(widget.bankAccount.digitPassword),
                              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.red),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 60,
                              child: Material(
                                color: Colors.grey.shade300,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      showError = false;
                                    });
                                  },
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        AppStrings.dismiss,
                                        style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.blue, fontWeight: FontWeight.w500),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.32,
                      width: width,
                      child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 12,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisExtent: height * 0.08,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            if (index >= 0 && index < 9 || index == 10) {
                              return InkWell(
                                splashColor: Colors.red,
                                onTap: () {
                                  if (currentPointer < widget.bankAccount.digitPassword) {
                                    setState(() {
                                      passwordValues[currentPointer] = index == 10 ? 0 : index + 1;
                                      currentPointer++;
                                    });
                                  }
                                },
                                child: Container(
                                  height: height * 0.1,
                                  color: Colors.grey.shade200,
                                  child: Center(
                                      child: Text(
                                    (index == 10 ? 0 : index + 1).toString(),
                                    style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500, color: AppColors.blue),
                                  )),
                                ),
                              );
                            } else {
                              if (index == 9) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (currentPointer > 0) {
                                        currentPointer--;
                                        passwordValues[currentPointer] = null;
                                      }
                                    });
                                  },
                                  child: Container(
                                    height: height * 0.1,
                                    color: Colors.grey.shade200,
                                    child: Center(
                                        child: Icon(
                                      Icons.backspace,
                                      color: AppColors.blue,
                                    )),
                                  ),
                                );
                              } else if (index == 11) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (currentPointer != 4) {
                                        setState(() {
                                          showError = true;
                                        });
                                        Future.delayed(const Duration(seconds: 3)).then((value) {
                                          setState(() {
                                            showError = false;
                                          });
                                        });
                                      }
                                    });
                                  },
                                  child: Container(
                                    height: height * 0.1,
                                    color: Colors.grey.shade200,
                                    child: Center(
                                        child: Icon(
                                      CupertinoIcons.check_mark_circled_solid,
                                      color: AppColors.blue,
                                      size: 40,
                                    )),
                                  ),
                                );
                              }
                            }
                            return Container();
                          }),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 100,
                left: 0,
                right: 0,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      showPaymentInfo = false;
                    });
                  },
                  child: Container(
                    color: showPaymentInfo ? Colors.grey.withOpacity(0.8) : Colors.transparent,
                    height: showPaymentInfo ? height : 0,
                    width: width,
                  ),
                ),
              ),
              Positioned(
                top: 100,
                left: 0,
                right: 0,
                child: BankDetailCard(
                  showPaymentInfo: showPaymentInfo,
                  bankAccount: widget.bankAccount,
                  transaction: widget.transaction,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
