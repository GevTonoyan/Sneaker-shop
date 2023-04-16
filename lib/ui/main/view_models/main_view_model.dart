import 'package:get/get.dart';

class MainViewModel extends GetxController {
  var selectedPage = 0.obs;

  void setSelectedPage(int index) {
    selectedPage.value = index;
  }
}
