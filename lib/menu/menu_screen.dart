import 'package:flutter/material.dart';
import 'package:flutter_animais_aleatorios_app/caes_aleatorios/screens/caes_home_screen.dart';
import 'package:flutter_animais_aleatorios_app/gatos_aleatorios/screens/gatos_home_screen.dart';
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CaesHomeScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            GradientElevatedButton(
              label: 'Gatos Aleatórios',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GatosHomeScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
