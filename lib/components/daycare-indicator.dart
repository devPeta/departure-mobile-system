import 'package:flutter/material.dart';

class DayCareLoadingIndicator extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final double strokeWidth;

  const DayCareLoadingIndicator({
    super.key,
    this.width = 15,
    this.height = 15,
    this.color = const Color(0xff102A43),
    this.strokeWidth = 5,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CircularProgressIndicator(
        color: color,
        strokeWidth: strokeWidth,
        strokeCap: StrokeCap.round,
      ),
    );
  }
}
