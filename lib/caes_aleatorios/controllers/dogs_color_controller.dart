import 'package:flutter/material.dart';

class DogsColorController extends ChangeNotifier {
  Color mainColor = Colors.red[200] ?? Colors.blue;

  void setColor(Color newColor) {
    mainColor = newColor;

    notifyListeners();
  }
}
