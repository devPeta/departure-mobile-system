import 'package:daycare_management_system_mobile/view/daycarestaff/home/staff-homepage-controller.dart';
import 'package:daycare_management_system_mobile/view/daycarestaff/home/widgets/dispatch-grid.dart';
import 'package:daycare_management_system_mobile/view/daycarestaff/home/widgets/dispatch-header.dart';
import 'package:daycare_management_system_mobile/view/daycarestaff/home/widgets/scanqr.dart';
import 'package:daycare_management_system_mobile/view/daycarestaff/home/widgets/staff-header.dart';
import 'package:daycare_management_system_mobile/view/daycarestaff/home/widgets/summarygrid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StaffHome extends StatelessWidget {
  StaffHome({super.key});

  final StaffHomeController controller =
  Get.put(StaffHomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            8,
            4,
            8,
            24,
          ),
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              // ==========================================
              // HEADER
              // ==========================================

              StaffHeader(
                controller: controller,
              ),

              const SizedBox(height: 22),

              // ==========================================
              // QR SCANNER CARD
              // ==========================================

              ScanParentQrCard(
                onTap: controller.scanParentQrCode,
              ),

              const SizedBox(height: 22),

              // ==========================================
              // TODAY'S SUMMARY
              // ==========================================

              const Text(
                'Today’s Summary',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff102A43),
                ),
              ),

              const SizedBox(height: 10),

              SummaryGrid(
                controller: controller,
              ),

              const SizedBox(height: 22),

              // ==========================================
              // LIVE DISPATCH FEED
              // ==========================================

              DispatchHeader(
                onViewAll:
                controller.viewAllDispatches,
              ),

              const SizedBox(height: 10),

              Obx(
                    () => Column(
                  children: controller.dispatchFeed
                      .map(
                        (dispatch) => Padding(
                      padding:
                      const EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: DispatchCard(
                        dispatch: dispatch,
                      ),
                    ),
                  )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}