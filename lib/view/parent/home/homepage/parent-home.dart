import 'package:daycare_management_system_mobile/view/parent/home/homepage/widgets/child-card.dart';
import 'package:daycare_management_system_mobile/view/parent/home/homepage/widgets/statics-card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ParentHome extends StatelessWidget {
  ParentHome({super.key});

  final List<Map<String, dynamic>> children = [
    {
      'name': 'Leo Miller',
      'age': 'Age 4',
      'room': 'Room B (Pre-K)',
      'status': 'Status: In Class',
      'statusColor': const Color(0xff20A878),
      'image': 'assets/images/leo.jpg',
    },
    {
      'name': 'Maya Miller',
      'age': 'Age 2',
      'room': 'Room A (Toddlers)',
      'status': 'Status: Signed Out (4:10 PM)',
      'statusColor': const Color(0xff52667A),
      'image': 'assets/images/maya.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(
          20,
          18,
          20,
          30,
        ),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            // ==========================================
            // HEADER
            // ==========================================

            _buildHeader(),

            const SizedBox(height: 22),

            // ==========================================
            // STATISTICS
            // ==========================================

            _buildStatistics(),

            const SizedBox(height: 30),

            // ==========================================
            // REGISTERED CHILDREN
            // ==========================================

            const Text(
              'Registered Children',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xff10243E),
              ),
            ),

            const SizedBox(height: 2),

            const Text(
              'Current Daycare enrollment',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xff52667A),
              ),
            ),

            const SizedBox(height: 10),

            // ==========================================
            // CHILDREN
            // ==========================================

            ListView.separated(
              shrinkWrap: true,
              physics:
              const NeverScrollableScrollPhysics(),
              itemCount: children.length,
              separatorBuilder: (_, __) =>
              const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return ChildCard(
                  child: children[index],
                );
              },
            ),

            const SizedBox(height: 20),

            // ==========================================
            // QUICK PICKUP
            // ==========================================

            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: () {
                  _requestQuickPickup();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                  const Color(0xff102A43),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(16),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      size: 22,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Request Quick Pickup',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight:
                        FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ==============================================
  // HEADER
  // ==============================================

  Widget _buildHeader() {
    return Row(
      crossAxisAlignment:
      CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: const [
              Text(
                'Welcome back,',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff52667A),
                ),
              ),

              SizedBox(height: 3),

              Text(
                'Sarah Miller',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff102A43),
                ),
              ),
            ],
          ),
        ),

        // PROFILE IMAGE

        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xffE2E8F0),
            border: Border.all(
              color: const Color(0xffD4DCE5),
            ),
          ),
          child: ClipOval(
            child: Image.asset(
              'assets/images/profile.jpg',
              fit: BoxFit.cover,
              errorBuilder:
                  (context, error, stackTrace) {
                return const Icon(
                  Icons.person,
                  color: Color(0xff52667A),
                  size: 28,
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  // ==============================================
  // STATISTICS
  // ==============================================

  Widget _buildStatistics() {
    return Row(
      children: [
        Expanded(
          child: StatCard(
            value: '2',
            label: 'Children',
            valueColor:
            const Color(0xff102A43),
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: StatCard(
            value: '1',
            label: "Today's\nDepartures",
            valueColor:
            const Color(0xff20A878),
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: StatCard(
            value: '0',
            label: 'Pending Pickups',
            valueColor:
            const Color(0xffE5A300),
          ),
        ),
      ],
    );
  }

  // ==============================================
  // QUICK PICKUP
  // ==============================================

  void _requestQuickPickup() {
    Get.snackbar(
      'Quick Pickup',
      'Pickup request feature coming soon.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}