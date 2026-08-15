import 'package:flutter/material.dart';

class SwitchTile extends StatelessWidget {
  const SwitchTile({
    required this.title,
    required this.value,
    required this.onChanged,
  });

  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xff202B36),
                ),
              ),
            ),

            Switch.adaptive(
              value: value,
              onChanged: onChanged,
              activeTrackColor:
              const Color(0xff20B486),
              inactiveTrackColor:
              const Color(0xffDDE4EC),
              thumbColor:
              WidgetStateProperty.all(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}