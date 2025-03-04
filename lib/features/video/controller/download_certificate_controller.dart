import 'package:get/get.dart';
import 'package:skill_grow/core/Global/sharedPref.dart';
import 'package:skill_grow/core/widgets/snackbar.dart';
import 'package:skill_grow/features/video/model/check_certificate_for_download_model.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/Global/api_endpoint.dart';
import '../../../core/Global/api_service.dart';
import 'package:dio/dio.dart' as dio;

class DownloadCertificateController extends GetxController {
  // Observable state

  var responsedData = Rxn<CheckCertificateForDownloadResponseModel>();

  final ApiService _apiService = ApiService();

  // Fetch course data from API
  Future<void> fetchQnaData({
    required String slug,
  }) async {
    print("📡 Fetching QNA data for Course Slug: $slug");
    String token = await SharedPrefUtil.get("token", '');

    try {
      final String url =
          ApiEndpoint.checkStatusForDownlaodCertificate(slug: slug);
      print("API URL: $url");

      dio.Response? response =
          await _apiService.getData(url: url, showSnackbar: false);

      if (response != null && response.data != null) {
        // Parse the response data into the Course model
        responsedData.value =
            CheckCertificateForDownloadResponseModel.fromJson(response.data);
        if (responsedData.value!.data.toDouble() == 100.toDouble()) {
          launchUrl(Uri.parse(
              "${ApiEndpoint.baseUrl}/download-certificate/$slug?bearer_token=$token"));
        } else {
          customSnackbar(
              title: "Error",
              message: "Certificate not available Please Complete the course",
              type: CustomSnackbarType.warning);
        }
      } else {
        responsedData.value = null;

        print("Error: Received null response from API");
      }
    } on dio.DioError catch (dioError) {
      print("DioError: ${dioError.response?.statusCode} - ${dioError.message}");
    } catch (e) {
      // Handle other errors
      print('Error fetching course data: $e');
    } finally {}
  }
}
