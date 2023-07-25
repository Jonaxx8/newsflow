import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class NewsService {
  final String apiKey = '0a1f91ee4cf9483793eeb92c79aa518a';

  Future<List<dynamic>> fetchNewsData() async {
    final String baseUrl= 'https://newsapi.org/v2/top-headlines?country=in&apiKey=$apiKey';
    final String country = 'in';
    final String category = 'general';

    final String url = '$baseUrl&country=$country&category=$category';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return jsonData['articles'];
      } else {
        print('Error: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }
}
