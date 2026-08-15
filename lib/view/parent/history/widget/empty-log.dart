import 'package:flutter/material.dart';

class EmptyLogs extends StatelessWidget {
  const EmptyLogs();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment:
        MainAxisAlignment.center,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: const BoxDecoration(
              color: Color(0xffE8EEF5),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.history_rounded,
              size: 32,
              color: Color(0xff52667A),
            ),
          ),

          const SizedBox(height: 16),

          const Text(
            'No departure logs found',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xff10243E),
            ),
          ),

          const SizedBox(height: 5),

          const Text(
            'Try changing your filter or search.',
            style: TextStyle(
              fontSize: 13,
              color: Color(0xff52667A),
            ),
          ),
        ],
      ),
    );
  }
}