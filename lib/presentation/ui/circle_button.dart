import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const CircleButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        side: BorderSide(
          color: Theme.of(context).colorScheme.onSurface,
          width: 2,
        ),
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(30),
        surfaceTintColor: Colors.white30,
      ),
      onPressed: onPressed,
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),
        ),
      ),
    );
  }
}
