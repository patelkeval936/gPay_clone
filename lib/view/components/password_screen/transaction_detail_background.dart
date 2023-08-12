import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/bloc/password_cubit.dart';
import '/bloc/password_state.dart';
import '/values/app_values.dart';

class TransactionDetailBackground extends StatelessWidget {
  const TransactionDetailBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 100,
      left: 0,
      right: 0,
      child: InkWell(
        onTap: () {
          context.read<PasswordBloc>().changeShowPaymentInfoTo(false);
        },
        child: BlocSelector<PasswordBloc, PasswordState, bool>(
          selector: (state) => state.showPaymentInfo,
          builder: (context, state) {
            return Container(
              color: state ? Colors.grey.withOpacity(0.8) : Colors.transparent,
              height: state ? height : 0,
              width: width,
            );
          },
        ),
      ),
    );
  }
}
