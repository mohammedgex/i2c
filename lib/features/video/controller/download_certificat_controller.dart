import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:open_file/open_file.dart'; 
import 'package:permission_handler/permission_handler.dart'; 
import 'package:skill_grow/core/Global/api_endpoint.dart';
import '../../../core/Global/sharedPref.dart';

class DownloadController extends GetxController {
  final Dio _dio = Dio();

  // Observable variables
  var downloadProgress = 0.0.obs;
  var isDownloading = false.obs;
  var isDownloadComplete = false.obs;
  var filePath = ''.obs;
  var errorMessage = ''.obs;

  // Download file function
  Future<void> downloadFile(String slug) async {
    String token = await SharedPrefUtil.get("token", '');
    String url = ApiEndpoint.downloadCertificateUrl(course_slug: slug);

    print('DEBUG: Downloading from -> $url');
    print('DEBUG: Authorization Token -> Bearer $token');

    try {
      isDownloading.value = true;
      isDownloadComplete.value = false;
      errorMessage.value = ''; 

      // Request permission for storage access
      if (await _requestStoragePermission() == false) {
        errorMessage.value = "Storage permission denied.";
        isDownloading.value = false;
        return;
      }

      // Get Downloads folder path
      Directory? downloadsDir = await _getDownloadDirectory();
      if (downloadsDir == null) {
        errorMessage.value = "Failed to access Downloads folder.";
        isDownloading.value = false;
        return;
      }

      String fileName = "${slug.replaceAll(' ', '_')}.pdf"; // Ensure valid filename
      String savePath = join(downloadsDir.path, fileName);

      print('DEBUG: Saving to -> $savePath');

      // Start the download
      await _dio.download(
        url,
        savePath,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
          responseType: ResponseType.bytes,
          validateStatus: (status) => status != null && status < 500,
        ),
        onReceiveProgress: (receivedBytes, totalBytes) {
          if (totalBytes > 0) {
            downloadProgress.value = receivedBytes / totalBytes;
          }
        },
      );

      // Update state after download completes
      isDownloading.value = false;
      isDownloadComplete.value = true;
      filePath.value = savePath;

      print('File downloaded and saved to: $savePath');
    } on DioException catch (e) {
      isDownloading.value = false;
      errorMessage.value = 'Failed to download file: ${e.response?.statusCode ?? ''} ${e.message}';
      print('Dio Error: ${e.response?.statusCode ?? ''} ${e.message}');
    } on SocketException catch (e) {
      isDownloading.value = false;
      errorMessage.value = 'Network error: ${e.message}';
      print('Network Error: ${e.message}');
    } catch (e) {
      isDownloading.value = false;
      errorMessage.value = 'An unexpected error occurred: $e';
      print('Unexpected Error: $e');
    }
  }

  // Request Storage Permission
  Future<bool> _requestStoragePermission() async {
    if (Platform.isAndroid) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,
        Permission.manageExternalStorage, // For Android 10+
      ].request();

      return statuses[Permission.storage]!.isGranted || statuses[Permission.manageExternalStorage]!.isGranted;
    }
    return true; // No permission needed for iOS
  }

  // Get the internal storage directory path
  Future<Directory?> _getDownloadDirectory() async {
    if (Platform.isAndroid) {
      String appPackageName = "com.websolutionus.skillgrow"; // Replace with your actual app package name
      Directory appDocDir = Directory('/storage/emulated/0/Android/media/$appPackageName/');
      if (!await appDocDir.exists()) {
        await appDocDir.create(recursive: true); // Create the directory if it doesn't exist
      }
      return appDocDir; // Return the internal storage path
    } else {
      return await getApplicationDocumentsDirectory(); // Use Documents for iOS
    }
  }

  // Open the downloaded file
  Future<void> openDownloadedFile() async {
    if (filePath.value.isNotEmpty) {
      try {
        await OpenFile.open(filePath.value);
      } catch (e) {
        errorMessage.value = 'Failed to open file: $e';
        print('Error opening file: $e');
      }
    } else {
      errorMessage.value = 'No file has been downloaded yet.';
      print('No file path available.');
    }
  }
}
