
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/values/app_strings.dart';
import '/view/components/payment_screen/payment_button.dart';
import '/view/components/payment_screen/powered_by_container.dart';
import '../../../bloc/payment_cubit.dart';
import '../../../bloc/payment_state.dart';
import '../../../values/app_data.dart';
import 'bank_detail_card.dart';


class BankSelectionCard extends StatelessWidget {
  const BankSelectionCard({super.key, required this.parentContext});

  final BuildContext parentContext;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocSelector<PaymentBloc, PaymentState, bool>(
          selector: (state) => state.chooseAccount,
          builder: (context, chooseAccount) {
            if (chooseAccount) {
              return Padding(
                padding: const EdgeInsets.only(top: 20,bottom: 0),
                child: Column(
                  children: [
                    ...AppData.accounts.map(
                          (e) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                              onTap: () {
                                context.read<PaymentBloc>().changeChooseAccountTo(false);
                                context.read<PaymentBloc>().changeSelectedAccountIndexTo(AppData.accounts.indexOf(e));
                              },
                              child: BlocSelector<PaymentBloc, PaymentState, int>(
                                selector: (state) => state.selectedAccountIndex,
                                builder: (context, selectedAccountIndex) {
                                  return BankDetailCard(
                                    cardIndex: AppData.accounts.indexOf(e),
                                    selectedIndex: selectedAccountIndex,
                                    bankAccount: e,
                                    chooseAccount: chooseAccount,
                                  );
                                },
                              )),
                        );
                      },
                    ).toList(),
                  ],
                ),
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30,bottom: 20,left: 20,right: 20),
                    child: Text(
                      AppStrings.chooseBankAccount,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 18),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.read<PaymentBloc>().changeChooseAccountTo(true);
                    },
                    child: BlocSelector<PaymentBloc, PaymentState, int>(
                      selector: (state) => state.selectedAccountIndex,
                      builder: (context, selectedAccountIndex) {
                        return BankDetailCard(
                          cardIndex: 0,
                          selectedIndex: selectedAccountIndex,
                          bankAccount: AppData.accounts[selectedAccountIndex],
                          chooseAccount: true,
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10,bottom: 4),
          child: PaymentButton(
            parentContext: parentContext,
          ),
        ),
        const PoweredByContainer(),
      ],
    );
  }
}