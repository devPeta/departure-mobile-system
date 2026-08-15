import 'package:daycare_management_system_mobile/view/parent/history/parent-departure-history-model.dart';
import 'package:daycare_management_system_mobile/view/parent/history/widget/status-badge.dart';
import 'package:flutter/material.dart';

class DepartureCard extends StatelessWidget {
  const DepartureCard({
    required this.log,
  });

  final DepartureLogModel log;

  @override
  Widget build(BuildContext context) {
    final bool verified = log.isVerified;

    return Container(
      constraints: const BoxConstraints(
        minHeight: 76,
      ),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
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
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              borderRadius:
              BorderRadius.circular(10),
              color: const Color(0xffE5EDF5),
            ),
            child: ClipRRect(
              borderRadius:
              BorderRadius.circular(10),
              child: Image.asset(
                log.image,
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

          const SizedBox(width: 12),

          // ==========================================
          // DETAILS
          // ==========================================

          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  log.childName,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff10243E),
                  ),
                ),

                const SizedBox(height: 3),

                RichText(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xff52667A),
                    ),
                    children: [
                      TextSpan(
                        text: log.guardian,
                      ),

                      const TextSpan(
                        text: '  •  ',
                      ),

                      TextSpan(
                        text: log.date.isEmpty
                            ? log.time
                            : '${log.date}, ${log.time}',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          // ==========================================
          // STATUS
          // ==========================================

          StatusBadge(
            status: log.status,
            isVerified: verified,
          ),
        ],
      ),
    );
  }
}