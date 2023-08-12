import 'package:flutter/material.dart';
import '/values/app_strings.dart';
import '/view/screens/home_screen.dart';
import '../../../values/app_values.dart';

class DoneButton extends StatelessWidget {
  const DoneButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: SizedBox(
        width: width * 0.6,
        height: 46,
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(HomeScreen.id);
            },
            child: Text(AppStrings.done)),
      ),
    );
  }
}
