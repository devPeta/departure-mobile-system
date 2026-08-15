import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: const Color(0xff203D58),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 19,
          color: Colors.white,
        ),
      ),
    );
  }
}