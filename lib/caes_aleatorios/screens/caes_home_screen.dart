import 'package:flutter/material.dart';
import 'package:flutter_animais_aleatorios_app/widgets/gradient_fab.dart';

class CaesHomeScreen extends StatelessWidget {
  const CaesHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cães Aleatórios'),
        centerTitle: true,
        backgroundColor: Colors.blue[200],
        actions: [
          IconButton(
            onPressed: () {},
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
