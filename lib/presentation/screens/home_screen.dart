import 'package:color_quest/presentation/presentation.dart';
import 'package:color_quest/presentation/ui/circle_button.dart';
import 'package:color_quest/presentation/ui/color_gesture.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color baseColor = Colors.blueAccent;

  void changeColor(Color color) {
    setState(() {
      baseColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox.fromSize(
        size: size,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Match\nthe colors!",
              textAlign: TextAlign.center,
              style: textTheme.titleLarge?.copyWith(fontSize: size.width * 0.15, fontWeight: FontWeight.bold, height: .8),
            ),
            const SizedBox(
              height: 20,
            ),
            ColorGesture(
              width: size.width * 0.3,
              height: size.width * 0.3,
              color: baseColor,
              onColorChanged: changeColor,
            ),
            const SizedBox(
              height: 20,
            ),
            const HelpWidget(icon: Icons.swipe_vertical_rounded, text: "Swipe up/down to change Brightness"),
            const SizedBox(
              height: 20,
            ),
            const HelpWidget(icon: Icons.swipe_rounded, text: "Swipe left/right to change Hue"),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "You have 3 lives\nGuest faster to get more points.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 20,
            ),
            CircleButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/game");
              },
              text: "Start",
            )
          ],
        ),
      ),
    );
  }
}
