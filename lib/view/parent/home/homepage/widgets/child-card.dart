import 'package:flutter/material.dart';

class ChildCard extends StatelessWidget {
  const ChildCard({
    required this.child,
  });

  final Map<String, dynamic> child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to child's details
      },
      child: Container(
        height: 96,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: const Color(0xffDCE3EA),
          ),
        ),
        child: Row(
          children: [
            // ==========================================
            // CHILD IMAGE
            // ==========================================

            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                borderRadius:
                BorderRadius.circular(14),
                color: const Color(0xffE2E8F0),
              ),
              child: ClipRRect(
                borderRadius:
                BorderRadius.circular(14),
                child: Image.asset(
                  child['image'],
                  fit: BoxFit.cover,
                  errorBuilder:
                      (context, error, stackTrace) {
                    return const Icon(
                      Icons.person,
                      color: Color(0xff52667A),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(width: 14),

            // ==========================================
            // INFORMATION
            // ==========================================

            Expanded(
              child: Column(
                mainAxisAlignment:
                MainAxisAlignment.center,
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    child['name'],
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff10243E),
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    '${child['age']}  •  ${child['room']}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xff52667A),
                    ),
                  ),

                  const SizedBox(height: 3),

                  Text(
                    child['status'],
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: child['statusColor'],
                    ),
                  ),
                ],
              ),
            ),

            // ==========================================
            // ARROW
            // ==========================================

            const Icon(
              Icons.chevron_right_rounded,
              size: 26,
              color: Color(0xff9AA7B5),
            ),
          ],
        ),
      ),
    );
  }
}