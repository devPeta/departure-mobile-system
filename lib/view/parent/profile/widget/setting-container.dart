import 'package:flutter/material.dart';

class SettingsContainer extends StatelessWidget {
  const SettingsContainer({
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xffDCE3EA),
        ),
      ),
      child: Column(
        children: children,
      ),
    );
  }
}