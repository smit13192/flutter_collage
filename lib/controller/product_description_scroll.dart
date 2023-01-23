import 'package:get/get.dart';

class ProductDescriptionScroll extends GetxController {
  RxInt count = 0.obs;
  scroll(int value) {
    count.value = value;
  }
}