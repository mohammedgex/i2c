import 'package:dio/dio.dart';
import '../../../core/Global/api_endpoint.dart';
import '../../../core/Global/api_service.dart';

class MultiLangualDataService {
  final ApiService _apiService = ApiService();

  // Function to handle language data retrieval
  Future<Map<String, dynamic>> getLanguage() async {
    try {
      String url = ApiEndpoint.multiLangualDataUrl("en");

      // Print the URL for debugging purposes
      print('API URL: $url');

      // Set up the headers to ensure the request is recognized as JSON

      // Call the API using your custom ApiService with the proper headers
      var response = await _apiService.getData(
        url: url,
        requiresAuth: false,
        
      );

      // Check if response is null or empty
      if (response == null || response.data == null) {
        print('Response is null or empty');
        throw Exception('Received null response from the server');
      }

      // Log the entire response to understand the structure
      print('Response Data: ${response.data}');

      // Ensure the response is in the correct format before decoding
      if (response.data is Map<String, dynamic>) {
        var data = response.data;

        // Validate the response format and check for 'status' key
        if (data.containsKey('status') && data['status'] == 'success') {
          // Check if 'data' is not null and contains valid content
          if (data['data'] != null) {
            return Map<String, dynamic>.from(data['data']);
          } else {
            throw Exception('No language data available');
          }
        } else {
          throw Exception('Failed to load valid language data. Status: ${data['status']}');
        }
      } else {
        throw Exception('Invalid response format. Expected Map<String, dynamic>');
      }
    } on DioException catch (e) {
      print('Get language data failed: ${e.response?.data ?? e.message}');
      rethrow;
    } catch (e) {
      print('An error occurred: $e');
      rethrow;
    }
  }
}
