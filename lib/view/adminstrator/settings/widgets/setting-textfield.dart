import 'package:flutter/material.dart';

class SettingsTextField
    extends StatelessWidget {
  const SettingsTextField({
    required this.label,
    required this.controller,
  });

  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        14,
        10,
        14,
        8,
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: Color(0xff52606D),
            ),
          ),

          const SizedBox(height: 3),

          TextField(
            controller: controller,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xff182B3C),
            ),
            decoration:
            const InputDecoration(
              border: InputBorder.none,
              isDense: true,
              contentPadding:
              EdgeInsets.zero,
            ),
          ),
        ],
      ),
    );
  }
}