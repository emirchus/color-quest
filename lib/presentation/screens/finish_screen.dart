import 'package:color_quest/application/provider/game_provider.dart';
import 'package:color_quest/presentation/ui/circle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FinishScreen extends ConsumerWidget {
  const FinishScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final score = ref.read(gameProvider.select((value) => value.points));
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Yeeeey\nYour final score is!",
              textAlign: TextAlign.center,
              style: textTheme.titleLarge?.copyWith(fontSize: size.width * 0.15, fontWeight: FontWeight.w500, height: .8),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              score.toString(),
              style: textTheme.titleLarge?.copyWith(fontSize: size.width * 0.3, fontWeight: FontWeight.w500, height: .8),
            ),
            const SizedBox(
              height: 50,
            ),
            CircleButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              text: "Reset",
            )
          ],
        ),
      ),
    );
  }
}
