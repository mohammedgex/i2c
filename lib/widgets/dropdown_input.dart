import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skill_grow/features/mulit_langual_data/controller/multi_langual_data_controller.dart';
import 'package:skill_grow/widgets/controller/dropdwon_input_cntroller.dart';

class CustomDropDownField extends StatelessWidget {
  final DropdownController controller = Get.put(DropdownController());

  CustomDropDownField({super.key});

  @override
  Widget build(BuildContext context) {
    MultiLangualDataController multiLangualDataController =
        Get.put(MultiLangualDataController());
    // String translatedText =
    //     multiLangualDataController.multiLangualData?[hint] ?? hint;
    return Obx(() => Directionality(
          textDirection: multiLangualDataController.isLTR.value
              ? TextDirection.ltr
              : TextDirection.rtl,
          child: DropdownSearch<String>(
            // asyncItems: (String? filter) async => controller.fetchItems(),
            items: (filter, loadProps) => controller.fetchItems(),
            itemAsString: (item) {
              return item;
            },
            selectedItem: controller.selectedValue.value.isEmpty
                ? null
                : controller.selectedValue.value,
            onChanged: (String? newValue) {
              controller.updateValue(newValue);
            },
            // decoratorProps: DropDownDecoratorProps(

            //   decoration: InputDecoration(
            //     hintText: "Search or select an option",
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.all(Radius.circular(12.r)),
            //     ),
            //   ),
            // ),
            popupProps: PopupProps.menu(
              showSearchBox: true,
              searchFieldProps: TextFieldProps(
                decoration: InputDecoration(
                  labelText: "Search",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            dropdownBuilder: (context, selectedItem) {
              return Directionality(
                textDirection: multiLangualDataController.isLTR.value
                    ? TextDirection.ltr
                    : TextDirection.rtl,
                child: Text(
                  selectedItem ?? "Search or select an option",
                  style: TextStyle(fontSize: 14.sp),
                ),
              );
            },
          ),
        ));
  }
}
