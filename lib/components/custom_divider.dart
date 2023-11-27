import 'package:flutter/material.dart';

class CustomDividerWithText extends StatelessWidget {
  final String label;

  const CustomDividerWithText({Key? key, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: Colors.redAccent,
            thickness: 0.5,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        const Expanded(
          child: Divider(
            color: Colors.redAccent,
            thickness: 0.5,
          ),
        ),
      ],
    );
  }
}
