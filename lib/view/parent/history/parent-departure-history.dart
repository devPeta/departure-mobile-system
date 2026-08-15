import 'package:daycare_management_system_mobile/view/parent/history/departure-controller.dart';
import 'package:daycare_management_system_mobile/view/parent/history/widget/departure-card.dart';
import 'package:daycare_management_system_mobile/view/parent/history/widget/empty-log.dart';
import 'package:daycare_management_system_mobile/view/parent/history/widget/filter-button.dart';
import 'package:daycare_management_system_mobile/view/parent/history/widget/search-field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class ParentDepartureLogs extends StatelessWidget {
  ParentDepartureLogs({super.key});

  final ParentDepartureController controller =
  Get.put(ParentDepartureController());

  final List<String> filters = const [
    'All Logs',
    'Today',
    'This Week',
    'This Month',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 4,
          ),
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              // ==========================================
              // HEADER
              // ==========================================

              const Padding(
                padding: EdgeInsets.only(
                  top: 8,
                  bottom: 4,
                ),
                child: Text(
                  'Departure Logs',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff10243E),
                  ),
                ),
              ),

              const Text(
                'Permanent ledger of daycare handovers',
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xff52667A),
                ),
              ),

              const SizedBox(height: 18),

              // ==========================================
              // FILTERS
              // ==========================================

              SizedBox(
                height: 38,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: filters.length,
                  separatorBuilder: (_, __) =>
                  const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    final filter = filters[index];

                    return Obx(
                          () => FilterButton(
                        title: filter,
                        isSelected:
                        controller.selectedFilter.value ==
                            filter,
                        onTap: () {
                          controller.changeFilter(
                            filter,
                          );
                        },
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 38),

              // ==========================================
              // SEARCH
              // ==========================================

              SearchField(
                onChanged: controller.search,
              ),

              const SizedBox(height: 18),

              // ==========================================
              // LOGS
              // ==========================================

              Expanded(
                child: Obx(
                      () {
                    final logs =
                        controller.filteredLogs;

                    if (logs.isEmpty) {
                      return const EmptyLogs();
                    }

                    return ListView.separated(
                      padding: const EdgeInsets.only(
                        bottom: 20,
                      ),
                      itemCount: logs.length,
                      separatorBuilder: (_, __) =>
                      const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        return DepartureCard(
                          log: logs[index],
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}