import 'package:flutter/material.dart';
import '../../../values/app_values.dart';

class PaymentInfo extends StatelessWidget {
  final String title;
  final String description;
  const PaymentInfo({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: width * 0.3,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black87),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                width:  width * 0.6,
                child: Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black87),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
