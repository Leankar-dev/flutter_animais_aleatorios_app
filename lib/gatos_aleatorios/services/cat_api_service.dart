import 'package:dio/dio.dart';

class CatApiService {
  Dio dio = Dio();

  Future<dynamic> getRandomCatImage() async {
    try {
      final response = await dio.get('https://cataas.com/cat?json=true');
      // final response = await dio.get('https://cataas.com/cat/gif?json=true');
      return response.data['url'];
    } catch (e) {
      return null;
    }
  }
}
