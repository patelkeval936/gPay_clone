import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/values/app_values.dart';
import '/values/app_strings.dart';

import '../../../bloc/payment_cubit.dart';
import '../../../bloc/payment_state.dart';


class PaymentTextField extends StatelessWidget {
  const PaymentTextField({Key? key, required this.textEditingController, required this.textFieldFocus}) : super(key: key);

  final TextEditingController textEditingController;
  final FocusNode textFieldFocus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: SizedBox(
                width: 20,
                child: Text(AppStrings.rupeeSymbol, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w500)),
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: BlocSelector<PaymentBloc, PaymentState, double>(
                selector: (state) => state.amount,
                builder: (context, state) {
                  return Container(
                    constraints: BoxConstraints(
                      minWidth: 0,
                      maxWidth: state == 0.0 ? 30 : (32 * (state.toString().length - 2)).toDouble(),
                    ),
                    child: TextField(
                      controller: textEditingController,
                      focusNode: textFieldFocus,
                      autofocus: true,
                      minLines: 1,
                      maxLines: 1,
                      onChanged: (value) {
                        if (double.parse(value == "" ? '0.0' : value) > maxAmountToSend) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(AppStrings.canNotSend),
                            ),
                          );
                          textEditingController.text = state.toString();
                        } else {
                          context.read<PaymentBloc>().changeAmountTo(double.parse(value == '' ? '0.0' : value));
                        }
                      },
                      onTap: () {
                        context.read<PaymentBloc>().changeBankShowCardTo(false);
                      },
                      onTapOutside: (event) {
                        textFieldFocus.unfocus();
                        if (!context.read<PaymentBloc>().state.processingPayment) {
                          context.read<PaymentBloc>().changeBankShowCardTo(true);
                        }
                      },
                      onSubmitted: (value) {
                        textFieldFocus.unfocus();
                        context.read<PaymentBloc>().changeBankShowCardTo(true);
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
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
