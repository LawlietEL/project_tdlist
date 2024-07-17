import 'package:get/get.dart';

class TodaysController extends GetxController {
  // Reactive variable to track the current page index
  var pageIndex = 0.obs;

  // Method to change the page
  void changePage(int index) {
    pageIndex.value = index;
  }
}
