import 'package:fitness_app/utils/colours.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const CustomButton({super.key,
    required this.buttonText,
    required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed.call();
      },
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 12.0),
          margin: const EdgeInsets.only(bottom: 10.0),
          decoration: BoxDecoration(
            color: Colours.primary,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            buttonText,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white, fontSize: 15.0
            ),
            textAlign: TextAlign.center,
          ),),
    );
  }
}
