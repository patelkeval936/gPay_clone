import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/payment_cubit.dart';
import '../../../bloc/payment_state.dart';
import '../../../values/app_colors.dart';

class MoveForwardFloatingButton extends StatelessWidget {
  const MoveForwardFloatingButton({
    super.key,
    required this.textFieldFocus,
  });

  final FocusNode textFieldFocus;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PaymentBloc, PaymentState, (bool, bool)>(
      selector: (state) => (state.showBanksCard, state.processingPayment),
      builder: (context, state) {
        if (!(state.$1 || state.$2)) {
          return FloatingActionButton(
            onPressed: () {
              textFieldFocus.unfocus();
              context.read<PaymentBloc>().changeBankShowCardTo(true);
            },
            backgroundColor: AppColors.buttonColor,
            child: const Icon(
              Icons.arrow_forward_rounded,
              color: Colors.white,
            ),
          );
        }
        return Container();
      },
    );
  }
}
