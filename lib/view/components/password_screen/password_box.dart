import 'package:flutter/material.dart';

class PasswordBox extends StatelessWidget {
  final int pointer;
  final int index;
  final int? value;
  final bool showPassword;
  const PasswordBox({Key? key, required this.index, required this.pointer, required this.value, required this.showPassword}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return value == null
        ? Container(
            width: 48,
            height: 2,
            color: index == pointer ? Colors.black : Colors.grey,
          )
        : SizedBox(
            height: 48,
            width: 48,
            child: Center(
              child: showPassword
                  ? Text(
                      value.toString(),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                    )
                  : const CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 5,
                    ),
            ),
          );
  }
}
