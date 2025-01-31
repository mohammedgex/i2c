import 'package:get/get.dart';

class SlidableController extends GetxController {
  var dragExtent = 0.0.obs; // Track how far it's dragged
  final double maxSlide = 100.0; // Max slide distance

  void updateDragExtent(double delta) {
    dragExtent.value -= delta;

    // Prevent dragging beyond limits
    if (dragExtent.value < 0) dragExtent.value = 0;
    if (dragExtent.value > maxSlide) dragExtent.value = maxSlide;
  }

  void handleDragEnd() {
    // If swiped more than half, open it fully
    if (dragExtent.value > maxSlide / 2) {
      dragExtent.value = maxSlide;
    } else {
      dragExtent.value = 0; // Otherwise, close it
    }
  }

  void close() {
    dragExtent.value = 0; // Closes the slide
  }
}
