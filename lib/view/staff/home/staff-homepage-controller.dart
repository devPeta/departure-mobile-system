import 'package:daycare_management_system_mobile/view/staff/home/dispatch-model.dart';
import 'package:get/get.dart';



class StaffHomeController extends GetxController {


  final campusName = 'CAMPUS EAST'.obs;

  final staffName = 'Marcus Vance'.obs;

  final staffRole = 'STAFF LEADER'.obs;


  final presentChildren = 34.obs;

  final expectedDepartures = 28.obs;

  final completedHandovers = 12.obs;

  final pendingRequests = 4.obs;



  final dispatchFeed = <StaffDispatchModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    loadDispatchFeed();
  }

  // ==========================================
  // LOAD DISPATCH DATA
  // ==========================================

  void loadDispatchFeed() {
    dispatchFeed.assignAll([
      StaffDispatchModel(
        childName: 'Maya Miller',
        guardian: 'Handed to Sarah Miller (Mother)',
        time: '4:10 PM',
        isCompleted: true,
      ),

      StaffDispatchModel(
        childName: 'Leo Miller',
        guardian: 'Authorized Guardian Sarah Mill...',
        time: '3:55 PM',
        isCompleted: false,
      ),
    ]);
  }

  // ==========================================
  // SCAN QR CODE
  // ==========================================

  void scanParentQrCode() {
    // Navigate to QR scanner later.
    Get.snackbar(
      'QR Scanner',
      'Opening parent QR scanner...',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // ==========================================
  // VIEW ALL DISPATCHES
  // ==========================================

  void viewAllDispatches() {
    // Navigate to complete dispatch history later.
    Get.snackbar(
      'Dispatch Feed',
      'Opening all dispatch records...',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}