import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/bloc/password_cubit.dart';
import '/bloc/password_state.dart';
import '/model/bank_account.dart';
import '/values/app_colors.dart';
import '/values/app_values.dart';
import '/values/app_strings.dart';
import '/view/components/password_screen/password_box.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    required this.bankAccount,
  });

  final BankAccount bankAccount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: bankAccount.digitPassword == 4 ? width * 0.7 : width * 0.8,
      child: Column(
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.enterUpiPin,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, color: Colors.grey.shade700),
                ),
                InkWell(
                  onTap: () {
                    context.read<PasswordBloc>().toggleShowPassword();
                  },
                  child: BlocSelector<PasswordBloc, PasswordState, bool>(
                    selector: (state) => state.showPassword,
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              state ? Icons.visibility_off : Icons.visibility,
                              color: AppColors.blue,
                            ),
                            Padding(
                              padding: horizontal8,
                              child: Text(
                                state ? AppStrings.hide : AppStrings.show,
                                style: Theme.of(context).textTheme.labelLarge?.copyWith(color: AppColors.blue, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(
                  bankAccount.digitPassword,
                      (index) => BlocBuilder<PasswordBloc, PasswordState>(
                    builder: (context, state) {
                      return PasswordBox(
                        index: index,
                        pointer: state.currentPointer,
                        value: state.passwordValues[index],
                        showPassword: state.showPassword,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}