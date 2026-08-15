import 'package:flutter/material.dart';

class SwitchSetting
    extends StatelessWidget {
  const SwitchSetting({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.fromLTRB(
        14,
        10,
        10,
        10,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight:
                    FontWeight.w700,
                    color:
                    Color(0xff182B3C),
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 10,
                    color:
                    Color(0xff66717E),
                  ),
                ),
              ],
            ),
          ),

          Switch(
            value: value,
            onChanged: onChanged,
            activeColor:
            const Color(0xff20B486),
            activeTrackColor:
            const Color(0xffBCEFD9),
            inactiveThumbColor:
            Colors.white,
            inactiveTrackColor:
            const Color(0xffDCE3EA),
          ),
        ],
      ),
    );
  }
}