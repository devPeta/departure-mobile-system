import 'package:flutter/material.dart';

class SettingTile extends StatelessWidget {
  const SettingTile({
    required this.title,
    required this.trailing,
    required this.onTap,
  });

  final String title;
  final Widget trailing;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        height: 46,
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
              trailing,
            ],
          ),
        ),
      ),
    );
  }
}