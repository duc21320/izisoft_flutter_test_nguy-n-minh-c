import 'package:http/http.dart' as http;

class Api {
  static const String baseUrl =
      'https://6551f0255c69a77903294d34.mockapi.io/v1';

  static Future<void> signUp(
      String username, String email, String password) async {
    final response = await http.post(
      '$baseUrl/signup' as Uri,
      body: {
        'username': username,
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to sign up');
    }
  }

  static Future<List<String>> fetchHomeData() async {
    final response = await http.get('$baseUrl/home' as Uri);
    if (response.statusCode == 200) {
      return response.body
          .split(','); // Thay thế với logic phân tích cụ thể của bạn
    } else {
      throw Exception('Failed to load home data');
    }
  }

  static Future<String> fetchCampaignDetail(String campaignId) async {
    final response = await http.get('$baseUrl/campaigns/$campaignId' as Uri);
    if (response.statusCode == 200) {
      return response.body; // Thay thế với logic phân tích cụ thể của bạn
    } else {
      throw Exception('Failed to load campaign detail');
    }
  }
}
