import 'package:dio/dio.dart';

class DogApiService {
  final dio = Dio();

  Future<String> getRandomDogImage() async {
    try {
      final response = await dio.get('https://dog.ceo/api/breeds/image/random');
      if (response.statusCode == 200) {
        return response.data['message'];
      } else {
        throw Exception('Failed to load dog image');
      }
    } catch (e) {
      throw Exception('Failed to load dog image: $e');
    }
  }
}


// não é necessário criar um model para a resposta da API, pois a resposta é simples e contém apenas uma URL de imagem. 
//Podemos acessar diretamente a URL usando response.data['message'] sem a necessidade de criar uma classe para 
//representar a resposta.