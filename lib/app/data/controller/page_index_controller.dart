import 'package:get/get.dart';
import '../../routes/app_pages.dart';

class PageIndexController extends GetxController {
  RxInt pageIndex = 0.obs;

  void changePage(int index) async {
    pageIndex.value = index;
    switch (index) {
      case 0:
        Get.offAllNamed(Routes.HOME);
        break;
      case 1:
        Get.offAllNamed(Routes.REGISTER);
        break;
      case 2:
        Get.offAllNamed(Routes.FORGOT_PASSWORD);
        break;
      default:
        Get.offAllNamed(Routes.HOME);
        break;
    }
  }
}
