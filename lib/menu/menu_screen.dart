import 'package:flutter/material.dart';
import 'package:flutter_animais_aleatorios_app/routes.dart';
import 'package:flutter_animais_aleatorios_app/widgets/gradient_elevated_button.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GradientElevatedButton(
              label: 'Cães Aleatórios',
              onPressed: () => Navigator.pushNamed(context, AppRoutes.caes),
            ),
            const SizedBox(height: 16),
            GradientElevatedButton(
              label: 'Gatos Aleatórios',
              onPressed: () => Navigator.pushNamed(context, AppRoutes.gatos),
            ),
          ],
        ),
      ),
    );
  }
}
