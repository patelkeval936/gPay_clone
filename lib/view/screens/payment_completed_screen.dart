import 'package:flutter/material.dart';
import 'package:gpay_clone_for_curie/main.dart';
import 'package:gpay_clone_for_curie/model/transaction.dart';
import 'package:gpay_clone_for_curie/values/app_assets.dart';
import 'package:gpay_clone_for_curie/values/app_colors.dart';
import 'package:gpay_clone_for_curie/values/app_strings.dart';
import 'package:gpay_clone_for_curie/view/components/payment_completed/payment_done_animation.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:gpay_clone_for_curie/view/screens/home_screen.dart';
import 'package:gpay_clone_for_curie/view/screens/payment_screen.dart';
import '../../values/app_values.dart';


class PaymentCompletedScreen extends StatefulWidget {
  final Transaction transaction;
  const PaymentCompletedScreen({Key? key,required this.transaction}) : super(key: key);

  @override
  State<PaymentCompletedScreen> createState() => _PaymentCompletedScreenState();
}

class _PaymentCompletedScreenState extends State<PaymentCompletedScreen> {


  void playPaymentDoneSound() {
    AudioPlayer().play(AssetSource(AppAssets.paymentDoneAudio));
  }

  @override
  void initState() {
    super.initState();
    playPaymentDoneSound();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: height,
        width: width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                top: height * 0.1,
                child: SizedBox(height: height * 0.4,width: width, child: const PaymentDoneAnimation())),
            Positioned(top: height * 0.4, left: 0, right: 0,
              child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 26,bottom: 10),
                  child: Text("${AppStrings.rupeeSymbol} ${transaction.amount.toStringAsFixed(2)}",
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w500)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(AppStrings.paidTo(AppStrings.payeeName),
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20)),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(AppStrings.payeeUpiId, style: Theme.of(context).textTheme.bodyLarge),
                      ),

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 26),
                  child: Column(
                    children: [
                      Text(AppStrings.getFormattedDate(transaction.time), style: Theme.of(context).textTheme.titleMedium),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(AppStrings.upiTransactionId(transaction.payeeUpiId), style: Theme.of(context).textTheme.bodyLarge),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: SizedBox(
                    width: width * 0.6,
                    height: 46,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(AppColors.buttonColor),
                          foregroundColor: MaterialStateProperty.all(Colors.white),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentScreen(),));
                        },
                        child: Text(AppStrings.done)),
                  ),
                )
              ],
            ),
            ),

          ],
        ),
      ),
    );
  }
}
