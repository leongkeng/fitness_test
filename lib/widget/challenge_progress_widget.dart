import 'package:flutter/material.dart';

class ChallengeProgressWidget extends StatelessWidget {
  final Color valueColour;
  final double progress;

  const ChallengeProgressWidget({super.key,
    this.valueColour = Colors.green,
    required this.progress});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 12.0),
        margin: const EdgeInsets.only(bottom: 10.0),
        height: 30.0,
        width: 200.0,
        child: LinearProgressIndicator(
          borderRadius: BorderRadius.circular(100.0),
          value: progress/100.0,
          backgroundColor: Colors.grey[500],
          valueColor: AlwaysStoppedAnimation<Color>(valueColour),
        ),
      );
  }
}
