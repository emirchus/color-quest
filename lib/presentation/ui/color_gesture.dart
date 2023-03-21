import 'package:flutter/material.dart';

typedef ColorCallback = void Function(Color color);

class ColorGesture extends StatefulWidget {
  final double width;
  final double height;
  final Color color;
  final ColorCallback? onColorChanged;
  final bool isDraggable;

  const ColorGesture({
    Key? key,
    required this.width,
    required this.height,
    required this.color,
    this.onColorChanged,
    this.isDraggable = true,
  }) : super(key: key);

  @override
  State<ColorGesture> createState() => _ColorGestureState();
}

class _ColorGestureState extends State<ColorGesture> {
  double initialYPosition = 0;
  double initialXPosition = 0;


  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !widget.isDraggable,
      child: GestureDetector(
        onVerticalDragStart: (details) => setState(() {
          initialYPosition = details.globalPosition.dy;
        }),
        onVerticalDragUpdate: (details) {
          final delta = details.globalPosition.dy - initialYPosition;
          final hsl = HSLColor.fromColor(widget.color);
          final newHsl = hsl.withLightness((hsl.lightness - delta / 10000).clamp(0, 1));

          widget.onColorChanged?.call(newHsl.toColor());
        },
        onHorizontalDragStart: (details) => setState(() {
          initialXPosition = details.globalPosition.dx;
        }),
        onHorizontalDragUpdate: (details) {
          final delta = details.globalPosition.dx - initialXPosition;

          final hsl = HSLColor.fromColor(widget.color);
          final newHsl = hsl.withHue((hsl.hue + delta / 100).abs());

          widget.onColorChanged?.call(newHsl.toColor());
        },
        onHorizontalDragEnd: (_) {},
        onVerticalDragEnd: (_) {},
        child: Container(
          width: widget.width,
          height: widget.width,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.color,
          ),
        ),
      ),
    );
  }
}
