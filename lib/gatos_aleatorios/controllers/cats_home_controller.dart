import 'package:flutter/material.dart';
import 'package:flutter_animais_aleatorios_app/gatos_aleatorios/services/cat_api_service.dart';

class CatsHomeController extends ChangeNotifier {
  final CatApiService catApiService;

  CatsHomeController({required this.catApiService});

  String? currentCatImageUrl;
  bool isLoading = false;

  void setIsLoading(bool newValue) {
    isLoading = newValue;
    notifyListeners();
  }

  Future<void> getNewCatImage() async {
    setIsLoading(true);
    currentCatImageUrl = await catApiService.getRandomCatImage();
    setIsLoading(false);
  }
}
