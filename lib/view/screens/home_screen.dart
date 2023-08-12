import 'package:flutter/material.dart';
import '/view/screens/payment_screen.dart';
import '../../values/app_strings.dart';

class HomeScreen extends StatelessWidget {
  static const id = '/';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.homeScreen),
        automaticallyImplyLeading: false,
      ),
      body: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(PaymentScreen.id);
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              AppStrings.tapAnywhere,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
