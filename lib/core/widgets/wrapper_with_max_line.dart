import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_grow/features/mulit_langual_data/controller/multi_langual_data_controller.dart';

class WrapWithMaxLines extends StatelessWidget {
  final List<Widget> children;
  final int maxLines;
  final double spacing;
  final double runSpacing;
  final double itemWidth;

  const WrapWithMaxLines({
    super.key,
    required this.children,
    required this.maxLines,
    required this.spacing,
    required this.runSpacing,
    required this.itemWidth,
  });

  @override
  Widget build(BuildContext context) {
    MultiLangualDataController multiLangualDataController =
        Get.put(MultiLangualDataController());
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate the available width for the items
        double availableWidth = constraints.maxWidth;

        // Calculate the number of items that can fit per row
        int itemsPerRow = (availableWidth / (itemWidth + spacing)).floor();

        // Recalculate spacing to ensure equal gaps between items
        double adjustedSpacing =
            (availableWidth - (itemsPerRow * itemWidth)) / (itemsPerRow - 1);

        // Limit the number of items to fit within maxLines
        int maxItems = maxLines * itemsPerRow;

        // Create a list of children limited to the maximum number of items
        List<Widget> limitedChildren = children.take(maxItems).toList();

        return Wrap(
          // crossAxisAlignment: CrossAxisAlignment.,
          alignment: WrapAlignment.spaceEvenly,
          runAlignment: WrapAlignment.start,
          textDirection: multiLangualDataController.isLTR.value
              ? TextDirection.ltr
              : TextDirection.rtl,
          spacing: adjustedSpacing, // Adjusted spacing for equal gaps
          runSpacing: runSpacing,
          children: limitedChildren,
        );
      },
    );
  }
}
