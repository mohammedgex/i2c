
import 'package:get/get.dart';

class MultiLangualDataController extends GetxController{
  RxMap<String, dynamic>? multiLangualData = <String, dynamic>{
    
  }.obs;
  RxBool isLoading = false.obs;
  RxBool isLTR = true.obs;

}