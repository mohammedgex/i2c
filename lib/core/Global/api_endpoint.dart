// ignore_for_file: non_constant_identifier_names

String baseUrl = 'https://360softbd.com/skillgro/api';
String imageUrl = "https://360softbd.com/skillgro/";

// authentication url
String loginUrl = '$baseUrl/login';
String registerUrl = '$baseUrl/register';
String forgetPasswordUrl = '$baseUrl/patient/forget-password';
String resetPasswordUrl = '$baseUrl/patient/reset-password';
String logoutUrl = '$baseUrl/logout';
String logoutFromAllDevicesUrl = '$baseUrl/logout/all-app';

// Global user url
String settingsUrl = '$baseUrl/settings';
String countriesUrl = '$baseUrl/countries';
String languageListUrl = '$baseUrl/language-list';
String currencyListUrl = '$baseUrl/currency-list';
String multiLangualDataUrl = '$baseUrl/static-language'; // need language code
String courseLanguagesUrl = '$baseUrl/course-languages'; // need language code
String courseMainCategoriesUrl(String languageCode) {
  return '$baseUrl/course-main-categories?language=$languageCode';
}

String courseSubCategoriesUrl(
    {required String main_category_slug, required String languageCode}) {
  return '$baseUrl/course-sub-categories/:$main_category_slug?language=$languageCode';
}

String courseLevelsUrl({required String limit, required String languageCode}) {
  return '$baseUrl/course-levels?limit=$limit&language=$languageCode';
}

// Courses url
String popularCoursesUrl({required String limit, required String currency}) {
  return '$baseUrl/popular-courses?limit=$limit&currency=$currency';
}

String freshCoursesUrl({required String limit, required String currency}) {
  return '$baseUrl/fresh-courses?limit=$limit&currency=$currency';
}

String searchCoursesUrl(
    {required String limit,
    required String currency,
    required String search,
    required String main_category,
    required String sub_category,
    required String price,
    required String languages,
    required String levels,
    required String rating,
    required String page}) {
  return '$baseUrl/search-courses?limit=$limit&currency=$currency&search=$search&main_category=$main_category&sub_category=$sub_category&price=$price&languages=$languages&levels=$levels&rating=$rating&page=$page';
}

String coursesUrl({required String slug, required String currency}) {
  return '$baseUrl/course/:$slug?currency=$slug';
}

String freeLessonInfoUrl({required String lesson_id}) {
  return '$baseUrl/course/free-lesson-info/:$lesson_id';
}

String courseReviewUrl({required String course_slug}) {
  return '$baseUrl/course/reviews/:$course_slug';
}

// Frontend url
String privecyPolicyUrl({required String languageCode}) {
  return '$baseUrl/privacy-policy?language=$languageCode';
}

String termsAndConditionsUrl({required String languageCode}) {
  return '$baseUrl/terms-and-conditions?language=$languageCode';
}

String faqUrl({required String languageCode, required String limit}) {
  return '$baseUrl/faqs?language=$languageCode&limit=$limit';
}

String onboardingUrl = '$baseUrl/on-boarding-screen';

// Dashboard Order url
String dashboardOrderUrl({required String limit, required String page}) {
  return '$baseUrl/orders?limit=$limit&page=$page';
}

String dashboardOrderDetailsUrl({required String invoice_id}) {
  return '$baseUrl/orders/:$invoice_id';
}

String dashboardOrderInvoiceUrl({required String invoice_id}) {
  return '$baseUrl/orders-invoice/:$invoice_id';
}

// Dashboard Review url

String dashboardReviewsUrl({required String limit, required String page}) {
  return "$baseUrl/reviews?limit=$limit&page=$page";
}

String dashboardReviewsDetailUrl({required String id}) {
  return "$baseUrl/reviews/:$id";
}

String dashboardReviewsDeleteUrl({required String id}) {
  return "$baseUrl/reviews/:$id";
}

// Dashboard Quiz url
String dashboardQuizUrl({required String limit, required String page}) {
  return "$baseUrl/quiz-attempts?limit=$limit&page=$page";
}

String dashboardQuizDetailsUrl({required String id}) {
  return "$baseUrl/quiz-attempts/:$id";
}

// Dashboard Enrolled Course url
String dashboardEnrolledCourseUrl(
    {required String limit, required String page}) {
  return "$baseUrl/enrolled-courses?limit=$limit&page=$page";
}

String downloadCertificateUrl({required String limit, required String page}) {
  return "$baseUrl/download-certificate?limit=$limit&page=$page";
}

// Dashboard Wishlist url
String dashboardWishlistUrl({required String limit, required String page}) {
  return "$baseUrl/wishlist-courses?limit=$limit&page=$page";
}

String dashboardAddRemoveWishlistUrl({required String course_slug}) {
  return "$baseUrl/add-remove-wishlist/:$course_slug";
}

// Dashboard Learning Quiz url
String dashboardLearningQuizeUrl(
    {required String course_slug, required String id}) {
  return "$baseUrl/learning/:$course_slug/quiz/:$id";
}

String dashboardLearningQuizeResultUrl(
    {required String course_slug, required String id}) {
  return "$baseUrl/learning/:$course_slug/quiz-results/:$id";
}

// QNA url
String qnaUrl(
    {required String limit,
    required String course_slug,
    required String lesson_id,
    required String search,
    required String page}) {
  return "$baseUrl/questions/:$course_slug/:$lesson_id?search=$search&page=$page";
}

String addQuestionUrl(
    {required String course_slug, required String lesson_id}) {
  return "$baseUrl/questions-create/:$course_slug/:$lesson_id";
}

String deleteQuestionUrl({required String question_id}) {
  return "$baseUrl/questions-destroy/:$question_id";
}

String addQuestionReplyUrl({required String question_id}) {
  return "$baseUrl/questions/replay/:$question_id";
}

String deleteQuestionReplyUrl({required String reply_id}) {
  return "$baseUrl/questions/replay/:$reply_id";
}

// Dashboard Learning url
dashboardLearningUrl({required String course_slug}) {
  return "$baseUrl/learning/:$course_slug";
}

dashboardLearningGetFileInfoUrl(
    {required String course_slug,
    required String type,
    required String lesson_id}) {
  return "$baseUrl/learning/:$course_slug/get-file-info/:t$type/:$lesson_id";
}

dashboardLearningLessonCompleteUrl({required String lesson_id}) {
  return "$baseUrl/learning/make-lesson-complete/:$lesson_id";
}

dashboardLearningAnnouncementUrl({required String slug}) {
  return "$baseUrl//learning/:$slug/announcements";
}

// Dashboard Profile url

String dashboardProfileUrl = "$baseUrl/profile";
String dashboardProfilePictureUpdateUrl = "$baseUrl/update-profile-picture";
String dashboardProfileUpdateUrl = "$baseUrl/update-profile";
String dashboardProfileUpdateBioUrl = "$baseUrl/update-bio";
String dashboardProfileUpdatePasswordUrl = "$baseUrl/update-password";
String dashboardProfileUpdateAddressUrl = "$baseUrl/update-address";
String dashboardProfileUpdateSocialLinksUrl = "$baseUrl/update-social-links";

// Extra url
String socialLinksUrl = "$baseUrl/social-links";
String contactUsUrl = "$baseUrl/contact-us";
String subscribeUsUrl = "$baseUrl/subscribe-us";
