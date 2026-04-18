import 'package:flutter/material.dart';
import 'package:flutter_animais_aleatorios_app/caes_aleatorios/controllers/dogs_color_controller.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

class SettingsCaesScreen extends StatelessWidget {
  const SettingsCaesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mainColor = context.watch<DogsColorController>().mainColor;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
        backgroundColor: mainColor,
      ),
      body: Column(
        children: [
          Text(
            'Escolha a cor principal dos cães:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: mainColor,
            ),
          ),
          SizedBox(height: 20),
          Consumer<DogsColorController>(
            builder: (context, value, child) {
              return ColorPicker(
                pickerColor: value.mainColor,
                onColorChanged: (color) => value.setColor(color),
                pickerAreaHeightPercent: 0.8,
              );
            },
          ),
        ],
      ),
    );
  }
}
