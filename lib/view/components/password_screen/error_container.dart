import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/password_cubit.dart';
import '/bloc/password_state.dart';
import '/model/bank_account.dart';
import '/values/app_colors.dart';
import '/values/app_values.dart';
import '/values/app_strings.dart';


class ErrorContainer extends StatelessWidget {
  const ErrorContainer({
    super.key,
    required this.bankAccount,
  });

  final BankAccount bankAccount;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PasswordBloc, PasswordState, bool>(
      selector: (state) => state.showError,
      builder: (context, state) {
        return AnimatedContainer(
          color: Colors.grey.shade300,
          width: width,
          height: !state ? 0 : 60,
          curve: Curves.linear,
          duration: const Duration(milliseconds: 200),
          child: Padding(
            padding: horizontal16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.pleaseEnterPassword(bankAccount.digitPassword),
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.red),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 60,
                  child: Material(
                    color: Colors.grey.shade300,
                    child: InkWell(
                      onTap: () {
                        context.read<PasswordBloc>().changeShowErrorTo(false);
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
        );
      },
    );
  }
}
