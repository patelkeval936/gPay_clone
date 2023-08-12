import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/password_cubit.dart';
import '../../../model/bank_account.dart';
import '../../../values/app_colors.dart';
import '../../../values/app_values.dart';

class NumberKeyboard extends StatelessWidget {
  const NumberKeyboard({
    super.key,
    required this.bankAccount,
  });

  final BankAccount bankAccount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  int pointerIndex = context.read<PasswordBloc>().state.currentPointer;

                  if (pointerIndex < 0) {
                    context.read<PasswordBloc>().incrementCurrentPointer();
                    pointerIndex = context.read<PasswordBloc>().state.currentPointer;
                  }

                  if (pointerIndex < bankAccount.digitPassword) {
                    context.read<PasswordBloc>().updatePasswordValue(pointerIndex, index == 10 ? 0 : index + 1);
                    context.read<PasswordBloc>().incrementCurrentPointer();
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
                    int pointerIndex = context.read<PasswordBloc>().state.currentPointer;

                    if (pointerIndex >= bankAccount.digitPassword) {
                      context.read<PasswordBloc>().decrementCurrentPointer();
                      pointerIndex = context.read<PasswordBloc>().state.currentPointer;
                    }

                    if (pointerIndex > -1) {
                      context.read<PasswordBloc>().decrementCurrentPointer();
                      context.read<PasswordBloc>().updatePasswordValue(pointerIndex, null);
                    }
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
                    int pointerIndex = context.read<PasswordBloc>().state.currentPointer;

                    if (pointerIndex != bankAccount.digitPassword) {
                      context.read<PasswordBloc>().changeShowErrorTo(true);

                      Future.delayed(const Duration(seconds: 3)).then((value) {
                        context.read<PasswordBloc>().changeShowErrorTo(false);
                      });
                    }else{
                      Navigator.of(context).pop(['from_password_page']);
                    }
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
    );
  }
}
