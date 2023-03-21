import 'dart:ffi';

import 'package:color_quest/application/provider/game_provider.dart';
import 'package:color_quest/presentation/presentation.dart';
import 'package:color_quest/presentation/screens/finish_screen.dart';
import 'package:color_quest/presentation/ui/circle_button.dart';
import 'package:color_quest/presentation/ui/color_gesture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ColorScreen extends ConsumerStatefulWidget {
  const ColorScreen({super.key});

  @override
  ConsumerState<ColorScreen> createState() => _ColorScreenState();
}

class _ColorScreenState extends ConsumerState<ColorScreen> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    final provider = ref.read(gameProvider);
    _controller = AnimationController(
      vsync: this,
      duration: provider.time,
    );

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      provider.buildColors();
      _controller
        ..reverse(from: provider.time.inSeconds.toDouble())
        ..addStatusListener((status) {
          if (status == AnimationStatus.completed || status == AnimationStatus.dismissed) {
            matchColors();
          }
        });
    });
  }

  void buildTimer() {
    final provider = ref.read(gameProvider);
    _controller.reverse(from: provider.time.inSeconds.toDouble());
  }

  void matchColors() {
    final provider = ref.read(gameProvider);
    bool passed = provider.calculateSimilitude((_controller.duration! * _controller.value).inSeconds);
    int lives = provider.lives;

    if (!passed) {
      provider.removeLive();
      lives--;
      if (lives <= 0) {
        return finishGame();
      }
    }

    provider.buildColors();
    buildTimer();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String get timerDisplayString {
    final duration = _controller.duration! * _controller.value;
    return duration.inSeconds.toString();
  }

  void finishGame() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, __) => const FinishScreen(),
        transitionsBuilder: (context, animation, __, child) {
          return ScaleTransition(
            scale: animation,
            alignment: Alignment.center,
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    final circlesSizes = size.width * 0.45;

    final score = ref.watch(gameProvider.select((value) => value.points));

    final lives = ref.watch(gameProvider.select((value) => value.lives));

    final colors = ref.watch(gameProvider).colors;

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
              style: textTheme.titleLarge?.copyWith(
                fontSize: size.width * 0.15,
                fontWeight: FontWeight.bold,
                height: .8,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (_, child) => Text(
                timerDisplayString,
                textAlign: TextAlign.center,
                style: textTheme.titleLarge?.copyWith(
                  fontSize: size.width * 0.35,
                  fontWeight: FontWeight.bold,
                  height: .8,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            if (colors.isNotEmpty)
              SizedBox(
                width: size.width,
                height: circlesSizes + 20,
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Center(
                      child: ColorGesture(
                        width: circlesSizes,
                        height: circlesSizes,
                        color: colors[1],
                        onColorChanged: (color) {
                          ref.read(gameProvider.notifier).changeColor(color);
                        },
                      ),
                    ),
                    Center(
                      child: AnimatedBuilder(
                          animation: _controller,
                          builder: (context, Widget? child) {
                            return Transform.scale(
                              scale: _controller.value.clamp(0.4, 1),
                              child: child,
                            );
                          },
                          child: ColorGesture(
                            width: circlesSizes,
                            height: circlesSizes,
                            color: colors[0],
                            isDraggable: false,
                          )),
                    ),
                  ],
                ),
              ),
            const SizedBox(
              height: 20,
            ),
            CircleButton(
              onPressed: () {
                _controller.reverse(from: ref.read(gameProvider).time.inSeconds.toDouble());
              },
              text: "GO",
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Score $score | Lives $lives",
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
