import 'package:daycare_management_system_mobile/view/daycarestaff/home/dispatch-model.dart';
import 'package:flutter/material.dart';

class DispatchCard extends StatelessWidget {
  const DispatchCard({
    required this.dispatch,
  });

  final StaffDispatchModel dispatch;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(15),
        border: Border.all(
          color: const Color(0xffDCE3EA),
        ),
      ),
      child: Row(
        children: [
          // ==========================================
          // STATUS INDICATOR
          // ==========================================

          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: dispatch.isCompleted
                  ? const Color(0xffD4F7E8)
                  : const Color(0xffE5EDF5),
            ),
          ),

          const SizedBox(width: 12),

          // ==========================================
          // CHILD + GUARDIAN
          // ==========================================

          Expanded(
            child: Column(
              mainAxisAlignment:
              MainAxisAlignment.center,
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  dispatch.childName,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff10243E),
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  dispatch.guardian,
                  maxLines: 1,
                  overflow:
                  TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xff66717E),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          // ==========================================
          // TIME
          // ==========================================

          Text(
            dispatch.time,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: Color(0xff52606D),
            ),
          ),
        ],
      ),
    );
  }
}