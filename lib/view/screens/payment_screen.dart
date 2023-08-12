import 'package:flutter/material.dart';
import '/values/app_values.dart';
import '/view/components/payment_screen/payment_text_field.dart';
import '../components/payment_screen/move_forward_floating_button.dart';
import '../components/payment_screen/payment_bank_selection.dart';
import '../components/payment_screen/payment_detail_header.dart';

class PaymentScreen extends StatefulWidget {
  static const id = '/payment_screen';
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  FocusNode textFieldFocus = FocusNode();
  TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textFieldFocus.dispose();
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).maybePop();
            },
            icon: const Icon(Icons.arrow_back_ios_rounded)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.report_gmailerrorred_rounded)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_rounded))
        ],
      ),
      body: SizedBox(
        height: height,
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const PaymentDetailHeader(),
                PaymentTextField(textEditingController: textEditingController, textFieldFocus: textFieldFocus)
              ],
            ),
            const PaymentBankSelection()
          ],
        ),
      ),
      floatingActionButton: MoveForwardFloatingButton(textFieldFocus: textFieldFocus),
    );
  }

}




