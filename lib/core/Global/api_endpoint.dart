// ignore_for_file: non_constant_identifier_names

class ApiEndpoint {
  // static const String baseUrl = 'https://360softbd.com/skillgro/api';
  static const String baseUrl = 'https://test.shakilahmeed.com/api';
  // static const String imageUrl = "https://360softbd.com/skillgro/";
  static const String imageUrl = "https://test.shakilahmeed.com/";

  // Authentication URLs
  static const String loginUrl = '$baseUrl/login';
  static const String registerUrl = '$baseUrl/register';
  static const String forgetPasswordUrl = '$baseUrl/forget-password';
  static const String resetPasswordUrl = '$baseUrl/reset-password';
  static const String logoutUrl = '$baseUrl/logout';
  static const String logoutFromAllDevicesUrl = '$baseUrl/logout/all-app';

  // Global User URLs
  static const String settingsUrl = '$baseUrl/settings';
  static const String countriesUrl = '$baseUrl/countries';
  static const String languageListUrl = '$baseUrl/language-list';
  static const String currencyListUrl = '$baseUrl/currency-list';
  static String multiLangualDataUrl(String code) {
    return '$baseUrl/static-language/$code';
  }

  static const String courseLanguagesUrl = '$baseUrl/course-languages';

  static String courseMainCategoriesUrl(
      {required String languageCode, int? limit}) {
    return '$baseUrl/course-main-categories?language=$languageCode&limit=$limit';
  }

  static String courseSubCategoriesUrl({
    required String main_category_slug,
    required String languageCode,
  }) {
    return '$baseUrl/course-sub-categories/$main_category_slug?language=$languageCode';
  }

  static String courseLevelsUrl({
    int? limit,
    required String languageCode,
  }) {
    return '$baseUrl/course-levels?limit=$limit&language=$languageCode';
  }

  // Courses URLs
  static String popularCoursesUrl({
    int? limit,
    required String currency,
  }) {
    return '$baseUrl/popular-courses?limit=$limit&currency=$currency';
  }

  static String freshCoursesUrl({
    int? limit,
    required String currency,
  }) {
    return '$baseUrl/fresh-courses?limit=$limit&currency=$currency';
  }

  static String searchCoursesUrl({
    required int limit,
    required String currency,
    required String search,
    required String main_category,
    required String sub_category,
    required String price,
    required String languages,
    required String levels,
    required String rating,
    required String page,
  }) {
    return '$baseUrl/search-courses?limit=$limit&currency=$currency&search=$search&main_category=$main_category&sub_category=$sub_category&price=$price&languages=$languages&levels=$levels&rating=$rating&page=$page';
  }

  static String coursesUrl(
      {required String slug, required String currency, String? userId}) {
    return '$baseUrl/course/$slug?currency=$currency&user_id=$userId';
  }

  static String freeLessonInfoUrl({required String lesson_id}) {
    return '$baseUrl/course/free-lesson-info/:$lesson_id';
  }

  static String courseReviewUrl(
      {required String course_slug, int? limit, int? page}) {
    return '$baseUrl/course/reviews/$course_slug?page=$page?limit=$limit';
  }

  // Frontend URLs
  static String privecyPolicyUrl({required String languageCode}) {
    return '$baseUrl/privacy-policy?language=$languageCode';
  }

  static String termsAndConditionsUrl({required String languageCode}) {
    return '$baseUrl/terms-and-conditions?language=$languageCode';
  }

  static String faqUrl({
    required String languageCode,
    int? limit,
  }) {
    if (limit == null) {
      return '$baseUrl/faqs?language=$languageCode';
    } else {
      return '$baseUrl/faqs?language=$languageCode&limit=$limit';
    }
  }

  static const String onboardingUrl = '$baseUrl/on-boarding-screen';

  // Dashboard Order URLs
  static String dashboardOrderUrl({
    required int limit,
    required String page,
  }) {
    return '$baseUrl/orders?limit=$limit&page=$page';
  }

  static String dashboardOrderDetailsUrl({required String invoice_id}) {
    return '$baseUrl/orders/:$invoice_id';
  }

  static String dashboardOrderInvoiceUrl({required String invoice_id}) {
    return '$baseUrl/orders-invoice/:$invoice_id';
  }

  // Dashboard Review URLs
  static String dashboardReviewsUrl({
    required int limit,
    required String page,
  }) {
    return "$baseUrl/reviews?limit=$limit&page=$page";
  }

  static String dashboardReviewsDetailUrl({required String id}) {
    return "$baseUrl/reviews/$id";
  }

  static String dashboardReviewsDeleteUrl({required String id}) {
    return "$baseUrl/reviews/$id";
  }

  // Dashboard Quiz URLs
  static String dashboardQuizUrl({
    required int limit,
    required String page,
  }) {
    return "$baseUrl/quiz-attempts?limit=$limit&page=$page";
  }

  static String dashboardQuizDetailsUrl({required String id}) {
    return "$baseUrl/quiz-attempts/:$id";
  }

  // Dashboard Enrolled Course URLs
  static String dashboardEnrolledCourseUrl({
    int? limit,
    required int page,
  }) {
    return "$baseUrl/enrolled-courses?limit=$limit&page=$page";
  }

  static String downloadCertificateUrl({
    required int limit,
    required String page,
  }) {
    return "$baseUrl/download-certificate?limit=$limit&page=$page";
  }

  // Dashboard Wishlist URLs
  static String dashboardWishlistUrl({
    required int limit,
    required String page,
  }) {
    return "$baseUrl/wishlist-courses?limit=$limit&page=$page";
  }

  static String dashboardAddRemoveWishlistUrl({required String course_slug}) {
    return "$baseUrl/add-remove-wishlist/$course_slug";
  }

  // Dashboard Learning Quiz URLs
  static String dashboardLearningQuizeUrl({
    required String course_slug,
    required String id,
  }) {
    return "$baseUrl/learning/$course_slug/quiz/$id";
  }

  static String dashboardLearningQuizeResultUrl({
    required String course_slug,
    required String id,
  }) {
    return "$baseUrl/learning/$course_slug/quiz-results/$id";
  }

  // QNA URLs
  static String qnaUrl({
    int? limit,
    required String course_slug,
    required String lesson_id,
    String? search,
    String? page,
  }) {
    if (search != null && page != null && limit != null) {
      return "$baseUrl/questions/$course_slug/$lesson_id?search=$search&page=$page&limit=$limit";
    } else if (search != null) {
      return "$baseUrl/questions/$course_slug/$lesson_id?search=$search";
    } else if (page != null) {
      return "$baseUrl/questions/$course_slug/$lesson_id?page=$page";
    } else if (limit != null && page != null) {
      return "$baseUrl/questions/$course_slug/$lesson_id?limit=$limit&page=$page";
    } else if (limit != null && search != null) {
      return "$baseUrl/questions/$course_slug/$lesson_id?search=$search&limit=$limit";
    } else if (page != null && search != null) {
      return "$baseUrl/questions/$course_slug/$lesson_id?search=$search&page=$page";
    } else if (limit != null) {
      return "$baseUrl/questions/$course_slug/$lesson_id?limit=$limit";
    } else {
      return "$baseUrl/questions/$course_slug/$lesson_id";
    }
  }

  static String addQuestionUrl({
    required String course_slug,
    required String lesson_id,
  }) {
    return "$baseUrl/questions-create/$course_slug/$lesson_id";
  }

  static String deleteQuestionUrl({required String question_id}) {
    return "$baseUrl/questions-destroy/$question_id";
  }

  static String addQuestionReplyUrl(
      {required String question_id, required String lesson_id}) {
    return "$baseUrl/questions/replay/$lesson_id/$question_id";
  }

  static String deleteQuestionReplyUrl({required String reply_id}) {
    return "$baseUrl/questions/replay/$reply_id";
  }

  // Dashboard Learning URLs
  static String dashboardLearningUrl({required String course_slug}) {
    return "$baseUrl/learning/$course_slug";
  }

  static String dashboardLearningGetFileInfoUrl({
    required String course_slug,
    required String type,
    required String lesson_id,
  }) {
    return "$baseUrl/learning/$course_slug/get-file-info/$type/$lesson_id";
  }

  static String dashboardLearningLessonCompleteUrl({
    required String lesson_id,
  }) {
    return "$baseUrl/learning/make-lesson-complete/$lesson_id";
  }

  static String dashboardLearningAnnouncementUrl({required String slug}) {
    return "$baseUrl/learning/$slug/announcements";
  }

  static String dashboardCartListUrl({required String currency}) {
    return "$baseUrl/cart-list?currency=$currency";
  }

  static String dashboardAddToCartUrl({required String slug}) {
    return "$baseUrl/add-to-cart/$slug";
  }

  static String dashboardRemoveCartUrl({required String slug}) {
    return "$baseUrl/remove-from-cart/$slug";
  }

  static String paymentApiUrl(
      {required String method, required String currency}) {
    return "$baseUrl/payment-api/$method?currency=$currency";
  }

  // payment URLs
  static String payemntMethodsListUrl = "$baseUrl/payment-gateway-list";

  // Dashboard Profile URLs
  static const String dashboardProfileUrl = "$baseUrl/profile";
  static const String dashboardProfilePictureUpdateUrl =
      "$baseUrl/update-profile-picture";
  static const String dashboardProfileUpdateUrl = "$baseUrl/update-profile";
  static const String dashboardProfileUpdateBioUrl = "$baseUrl/update-bio";
  static const String dashboardProfileUpdatePasswordUrl =
      "$baseUrl/update-password";
  static const String dashboardProfileUpdateAddressUrl =
      "$baseUrl/update-address";
  static const String dashboardProfileUpdateSocialLinksUrl =
      "$baseUrl/update-social-links";

  // Extra URLs
  static const String socialLinksUrl = "$baseUrl/social-links";
  static const String contactUsUrl = "$baseUrl/contact-us";
  static const String subscribeUsUrl = "$baseUrl/subscribe-us";
}
