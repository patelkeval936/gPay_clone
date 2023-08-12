import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/bloc/password_cubit.dart';
import '/bloc/password_state.dart';
import '/model/transaction.dart';
import '/values/app_colors.dart';
import '/values/app_values.dart';
import '/values/app_strings.dart';


class TransactionDetailHeader extends StatelessWidget {
  const TransactionDetailHeader({
    super.key,
    required this.transaction,
  });

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<PasswordBloc>().toggleShowPaymentInfo();
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
                    '${AppStrings.rupeeSymbol} ${transaction.amount.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    width: 40,
                    child: BlocSelector<PasswordBloc, PasswordState, bool>(
                      selector: (state) {
                        return state.showPaymentInfo;
                      },
                      builder: (context, state) {
                        return AnimatedRotation(
                          turns: state ? 0.5 : 0,
                          duration: const Duration(milliseconds: 200),
                          child: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}