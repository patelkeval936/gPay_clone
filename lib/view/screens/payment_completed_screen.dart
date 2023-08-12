import 'package:flutter/material.dart';
import '/model/transaction.dart';
import '/values/app_assets.dart';
import '/view/components/payment_completed/payment_done_animation.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../values/app_values.dart';
import '../components/payment_completed/done_button.dart';
import '../components/payment_completed/payee_detail_card.dart';
import '../components/payment_completed/transaction_amount_card.dart';
import '../components/payment_completed/transaction_detail_card.dart';

class PaymentCompletedScreen extends StatelessWidget {
  static const id = '/payment_completed_screen';
  final Transaction transaction;
  const PaymentCompletedScreen({Key? key, required this.transaction}) : super(key: key);

  void playPaymentDoneSound() {
    AudioPlayer().play(AssetSource(AppAssets.paymentDoneAudio));
  }

  @override
  Widget build(BuildContext context) {
    playPaymentDoneSound();

    return Scaffold(
      body: SizedBox(
        height: height,
        width: width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                top: height * 0.1,
                child: SizedBox(
                  height: height * 0.4,
                  width: width,
                  child: const PaymentDoneAnimation(),
                )),
            Positioned(
              top: height * 0.4,
              left: 0,
              right: 0,
              child: SizedBox(
                height: height * 0.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TransactionAmountCard(transaction: transaction),
                    const PayeeDetailCard(),
                    TransactionDetailCard(transaction: transaction),
                    const Spacer(),
                    const DoneButton()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
