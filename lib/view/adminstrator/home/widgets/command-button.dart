import 'package:flutter/material.dart';

class CommandButton extends StatelessWidget {
  const CommandButton({
    required this.title,
    required this.icon,
    required this.primary,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final bool primary;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: ElevatedButton.icon(
        onPressed: onTap,

        icon: Icon(
          icon,
          size: 16,
        ),

        label: Text(
          title,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),

        style: ElevatedButton.styleFrom(
          backgroundColor: primary
              ? const Color(0xff102A43)
              : Colors.white,

          foregroundColor: primary
              ? Colors.white
              : const Color(0xff102A43),

          elevation: 0,

          side: primary
              ? BorderSide.none
              : const BorderSide(
            color: Color(0xffDCE3EA),
          ),

          shape:
          RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}