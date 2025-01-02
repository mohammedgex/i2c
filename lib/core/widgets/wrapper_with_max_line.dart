import 'package:flutter/material.dart';

class WrapWithMaxLines extends StatelessWidget {
  final List<Widget> children;
  final int maxLines;
  final double spacing;
  final double runSpacing;
  final double itemWidth; // Accept item width as a parameter

  const WrapWithMaxLines({
    super.key,
    required this.children,
    required this.maxLines,
    required this.spacing,
    required this.runSpacing,
    required this.itemWidth, // Add itemWidth to the constructor
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate the available width for the items
        double availableWidth = constraints.maxWidth;

        // Calculate how many items can fit per row based on the available width
        int maxItemsPerRow = (availableWidth / (itemWidth + spacing)).floor();

        // Limit the number of items to fit within maxLines and maxItemsPerRow
        int maxItems = maxLines * maxItemsPerRow;

        // Create a list of children limited to the maximum number of items
        List<Widget> limitedChildren = children.take(maxItems).toList();

        return Wrap(
          spacing: spacing, // space between items
          runSpacing: runSpacing, // space between rows
          children: limitedChildren,
        );
      },
    );
  }
}
