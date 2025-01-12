import 'package:get/get.dart';

class CheckboxController extends GetxController {
  RxBool isSelected = false.obs;
  toggleCheck(value){
    isSelected(!isSelected.value);
  }
}