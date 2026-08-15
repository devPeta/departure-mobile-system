import 'package:daycare_management_system_mobile/view/parent/history/widget/status-badge.dart' show StatusBadge;
import 'package:daycare_management_system_mobile/view/staff/children/public-model.dart';
import 'package:daycare_management_system_mobile/view/staff/children/widgets/status-badge.dart';
import 'package:flutter/material.dart';

class PupilCard extends StatelessWidget {
  const PupilCard({
    required this.pupil,
    required this.onTap,
  });

  final PupilModel pupil;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 72,
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
          BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xffDCE3EA),
          ),
        ),
        child: Row(
          children: [
            // ==========================================
            // PUPIL IMAGE
            // ==========================================

            ClipRRect(
              borderRadius:
              BorderRadius.circular(10),
              child: Image.asset(
                pupil.image,
                width: 46,
                height: 46,
                fit: BoxFit.cover,
                errorBuilder:
                    (context, error, stackTrace) {
                  return Container(
                    width: 46,
                    height: 46,
                    color: const Color(0xffE7EEF5),
                    child: const Icon(
                      Icons.person,
                      color:
                      Color(0xff718096),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(width: 12),

            // ==========================================
            // PUPIL INFORMATION
            // ==========================================

            Expanded(
              child: Column(
                mainAxisAlignment:
                MainAxisAlignment.center,
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    pupil.name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff102A43),
                    ),
                  ),

                  const SizedBox(height: 3),

                  Text(
                    '${pupil.age} • ${pupil.room}',
                    style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xff66717E),
                    ),
                  ),
                ],
              ),
            ),

            // ==========================================
            // STATUS
            // ==========================================

            StatusBadgeA(
              status: pupil.status,
            ),
          ],
        ),
      ),
    );
  }
}