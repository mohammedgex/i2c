import 'package:get/get.dart';
import '../../../core/icons/app_icon.dart';

class CategoryItemController extends GetxController {
  // Loading state
  RxBool isLoading = true.obs;

  // Category list
  RxList categoryList = [
    {
      "id": 1,
      "name": "Development",
      "image": AppIcon.developmentIcon,
    },
    {
      "id": 2,
      "name": "Game Dev",
      "image": AppIcon.gameIcon,
    },
    {
      "id": 3,
      "name": "UX Design",
      "image": AppIcon.uxIcon,
    },
    {
      "id": 5,
      "name": "Deployment",
      "image": AppIcon.deploymentIcon,
    },
    {
      "id": 6,
      "name": "Customization",
      "image": AppIcon.customizeIcon,
    },
    {
      "id": 7,
      "name": "UI Design",
      "image": AppIcon.uiIcon,
    },
    {
      "id": 8,
      "name": "Music Dev",
      "image": AppIcon.musicIcon,
    },
    {
      "id": 9,
      "name": "Communication",
      "image": AppIcon.communicationIcon,
    },
    {
      "id": 10,
      "name": "Photography",
      "image": AppIcon.photographyIcon,
    },
    {
      "id": 11,
      "name": "Film Making",
      "image": AppIcon.filmMakingIcon,
    },
  ].obs;

  @override
  void onInit() {
    super.onInit();

    // Set isLoading to false after 5 seconds
    Future.delayed(Duration(seconds: 3), () {
      isLoading.value = false;
    });
  }
}
