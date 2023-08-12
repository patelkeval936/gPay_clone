import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/password_cubit.dart';
import '../bloc/payment_cubit.dart';
import '../model/screen_arguments.dart';
import '../model/transaction.dart';
import '../view/screens/password_screen.dart';
import '../view/screens/payment_completed_screen.dart';
import '../view/screens/payment_screen.dart';
import '../view/screens/home_screen.dart';

class AppRouter {
  static Route generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.id:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );

      case PaymentScreen.id:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<PaymentBloc>(
            create: (context) => PaymentBloc(),
            child: const PaymentScreen(),
          ),
        );

      case PasswordScreen.id:
        final args = settings.arguments as ScreenArguments;
        return MaterialPageRoute(
          builder: (context) => BlocProvider<PasswordBloc>(
            create: (context) => PasswordBloc(args.bankAccount.digitPassword),
            child: PasswordScreen(
              bankAccount: args.bankAccount,
              transaction: args.transaction,
            ),
          ),
        );

      case PaymentCompletedScreen.id:
        final transaction = settings.arguments as Transaction;
        return MaterialPageRoute(
          builder: (context) => PaymentCompletedScreen(
            transaction: transaction,
          ),
        );

      default:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
    }
  }
}
