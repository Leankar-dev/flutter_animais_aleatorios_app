import 'package:flutter/material.dart';
import 'package:flutter_animais_aleatorios_app/caes_aleatorios/services/dog_api_service.dart';

class CaesHomeController extends ChangeNotifier {
  final DogApiService dogApiService;

  CaesHomeController({required this.dogApiService});

  bool isLoading = false;
  String dogImageUrl = '';

  void setLoading(bool newValue) {
    isLoading = newValue;
    notifyListeners();
  }

  Future<void> loadRandomDog() async {
    setLoading(true);
    try {
      final url = await dogApiService.getRandomDogImage();
      dogImageUrl = url;
    } catch (e) {
      // Handle error
    } finally {
      setLoading(false);
    }
  }
}
