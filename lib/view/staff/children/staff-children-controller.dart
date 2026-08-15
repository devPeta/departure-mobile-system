import 'package:daycare_management_system_mobile/view/staff/children/public-model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class StaffChildrenController extends GetxController {
  // ==========================================
  // SEARCH
  // ==========================================

  final searchController = TextEditingController();

  final searchQuery = ''.obs;

  // ==========================================
  // FILTER
  // ==========================================

  final selectedFilter = 'All'.obs;

  final filters = const [
    'All',
    'Present',
    'Departed',
    'Pending Pickup',
  ];

  // ==========================================
  // PUPILS
  // ==========================================

  final pupils = <PupilModel>[
    PupilModel(
      name: 'Leo Miller',
      age: 'Age 4',
      room: 'Room B',
      image: 'assets/images/leo.jpg',
      status: PupilStatus.present,
    ),

    PupilModel(
      name: 'Maya Miller',
      age: 'Age 2',
      room: 'Room A',
      image: 'assets/images/maya.jpg',
      status: PupilStatus.departed,
    ),

    PupilModel(
      name: 'Sloane Vance',
      age: 'Age 3',
      room: 'Room A',
      image: 'assets/images/sloane.jpg',
      status: PupilStatus.pendingPickup,
    ),

    PupilModel(
      name: 'Lucas Chen',
      age: 'Age 5',
      room: 'Room C',
      image: 'assets/images/lucas.jpg',
      status: PupilStatus.present,
    ),
  ].obs;

  // ==========================================
  // FILTERED PUPILS
  // ==========================================

  final filteredPupils = <PupilModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    filteredPupils.assignAll(pupils);

    searchController.addListener(() {
      searchQuery.value = searchController.text;
      filterPupils();
    });
  }

  // ==========================================
  // SELECT FILTER
  // ==========================================

  void selectFilter(String filter) {
    selectedFilter.value = filter;

    filterPupils();
  }

  // ==========================================
  // FILTER LOGIC
  // ==========================================

  void filterPupils() {
    final query =
    searchController.text.toLowerCase().trim();

    final filter = selectedFilter.value;

    filteredPupils.assignAll(
      pupils.where((pupil) {
        final matchesSearch =
            pupil.name.toLowerCase().contains(query) ||
                pupil.room.toLowerCase().contains(query);

        bool matchesFilter = true;

        switch (filter) {
          case 'Present':
            matchesFilter =
                pupil.status == PupilStatus.present;
            break;

          case 'Departed':
            matchesFilter =
                pupil.status == PupilStatus.departed;
            break;

          case 'Pending Pickup':
            matchesFilter =
                pupil.status ==
                    PupilStatus.pendingPickup;
            break;

          case 'All':
            matchesFilter = true;
            break;
        }

        return matchesSearch && matchesFilter;
      }),
    );
  }

  // ==========================================
  // STATUS COUNTS
  // ==========================================

  int get totalPupils => pupils.length;

  int get presentCount => pupils
      .where(
        (pupil) =>
    pupil.status == PupilStatus.present,
  )
      .length;

  int get departedCount => pupils
      .where(
        (pupil) =>
    pupil.status == PupilStatus.departed,
  )
      .length;

  int get pendingPickupCount => pupils
      .where(
        (pupil) =>
    pupil.status ==
        PupilStatus.pendingPickup,
  )
      .length;

  // ==========================================
  // PUPIL DETAILS
  // ==========================================

  void openPupil(PupilModel pupil) {
    debugPrint(
      'Selected pupil: ${pupil.name}',
    );

    // Navigate to pupil details later.
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}