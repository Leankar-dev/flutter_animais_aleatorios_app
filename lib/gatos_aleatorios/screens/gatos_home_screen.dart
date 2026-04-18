import 'package:flutter/material.dart';
import 'package:flutter_animais_aleatorios_app/routes.dart';
import 'package:flutter_animais_aleatorios_app/widgets/gradient_fab.dart';

class GatosHomeScreen extends StatelessWidget {
  const GatosHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gatos Aleatórios'),
        centerTitle: true,
        backgroundColor: Colors.blue[200],
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, AppRoutes.gatosSettings),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Column(
        children: [],
      ),
      floatingActionButton: GradientFAB(
        onPressed: () {},
        icon: Icons.refresh,
      ),
    );
  }
}
