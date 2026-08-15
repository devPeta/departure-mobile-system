import 'package:get/get.dart';

class ParentNavigationController extends GetxController {
  final currentIndex = 0.obs;

  void changeTab(int index) {
    currentIndex.value = index;
  }

  void goToHome() {
    currentIndex.value = 0;
  }

  void goToChildren() {
    currentIndex.value = 1;
  }

  void goToHistory() {
    currentIndex.value = 2;
  }

  void goToAlerts() {
    currentIndex.value = 3;
  }

  void goToProfile() {
    currentIndex.value = 4;
  }
}