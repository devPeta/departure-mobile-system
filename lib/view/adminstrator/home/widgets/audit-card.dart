import 'package:flutter/material.dart';

class AuditCard extends StatelessWidget {
  const AuditCard({
    required this.icon,
    required this.iconColor,
    required this.text,
  });

  final IconData icon;
  final Color iconColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,

      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(12),
      ),

      child: Row(
        children: [
          Icon(
            icon,
            size: 19,
            color: iconColor,
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Text(
              text,
              maxLines: 1,
              overflow:
              TextOverflow.ellipsis,

              style: const TextStyle(
                fontSize: 11,
                color: Color(0xff66717E),
              ),
            ),
          ),
        ],
      ),
    );
  }
}