import 'package:flutter/material.dart';

class HelpWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  const HelpWidget({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: size.width * 0.1,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.start,
              softWrap: true,
              maxLines: 2,
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
