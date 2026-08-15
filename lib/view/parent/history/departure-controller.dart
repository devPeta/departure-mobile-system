import 'package:daycare_management_system_mobile/view/parent/history/parent-departure-history-model.dart';
import 'package:get/get.dart';


class ParentDepartureController extends GetxController {
  // ==========================================
  // SELECTED FILTER
  // ==========================================

  final selectedFilter = 'All Logs'.obs;

  // ==========================================
  // SEARCH
  // ==========================================

  final searchText = ''.obs;

  // ==========================================
  // ALL LOGS
  // ==========================================

  final departureLogs = <DepartureLogModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    loadDepartureLogs();
  }

  // ==========================================
  // LOAD LOGS
  // ==========================================

  void loadDepartureLogs() {
    departureLogs.assignAll([
      DepartureLogModel(
        childName: 'Leo Miller',
        guardian: 'Elena Miller (Grandmother)',
        time: '4:35 PM',
        date: '',
        status: 'VERIFIED',
        image: 'assets/images/leo.jpg',
        isVerified: true,
      ),

      DepartureLogModel(
        childName: 'Maya Miller',
        guardian: 'Jordan Miller (Father)',
        time: '4:10 PM',
        date: '',
        status: 'VERIFIED',
        image: 'assets/images/maya.jpg',
        isVerified: true,
      ),

      DepartureLogModel(
        childName: 'Leo Miller',
        guardian: 'Sarah Miller (Mother)',
        time: '4:05 PM',
        date: 'Oct 11',
        status: 'VERIFIED',
        image: 'assets/images/leo.jpg',
        isVerified: true,
      ),

      DepartureLogModel(
        childName: 'Maya Miller',
        guardian: 'Unassigned Contact',
        time: '3:55 PM',
        date: 'Oct 09',
        status: 'BLOCKED',
        image: 'assets/images/maya.jpg',
        isVerified: false,
      ),
    ]);
  }

  // ==========================================
  // CHANGE FILTER
  // ==========================================

  void changeFilter(String filter) {
    selectedFilter.value = filter;
  }

  // ==========================================
  // SEARCH
  // ==========================================

  void search(String value) {
    searchText.value = value;
  }

  // ==========================================
  // FILTERED LOGS
  // ==========================================

  List<DepartureLogModel> get filteredLogs {
    List<DepartureLogModel> result =
    List.from(departureLogs);

    // SEARCH
    if (searchText.value.trim().isNotEmpty) {
      final query =
      searchText.value.trim().toLowerCase();

      result = result.where((log) {
        return log.childName
            .toLowerCase()
            .contains(query) ||
            log.guardian
                .toLowerCase()
                .contains(query);
      }).toList();
    }

    // DATE FILTER
    switch (selectedFilter.value) {
      case 'Today':
        result = result.where((log) {
          return log.date.isEmpty;
        }).toList();
        break;

      case 'This Week':
      // Replace with actual date filtering
      // when API/database dates are available.
        break;

      case 'This Month':
      // Replace with actual date filtering
      // when API/database dates are available.
        break;

      case 'All Logs':
      default:
        break;
    }

    return result;
  }
}