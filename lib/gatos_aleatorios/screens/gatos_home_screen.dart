import 'package:flutter/material.dart';
import 'package:flutter_animais_aleatorios_app/gatos_aleatorios/controllers/cats_home_controller.dart';
import 'package:flutter_animais_aleatorios_app/routes.dart';
import 'package:flutter_animais_aleatorios_app/widgets/gradient_fab.dart';
import 'package:provider/provider.dart';

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
            onPressed: () =>
                Navigator.pushNamed(context, AppRoutes.gatosSettings),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CatsHomeController>(
              builder: (context, controller, child) {
                if (controller.isLoading) {
                  return const CircularProgressIndicator();
                } else if (controller.currentCatImageUrl != null) {
                  return Image.network(
                    controller.currentCatImageUrl!,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const CircularProgressIndicator();
                    },
                    height: 300,
                  );
                }
                return const Text('Nenhuma imagem disponível');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: GradientFAB(
        onPressed: () {
          context.read<CatsHomeController>().getNewCatImage();
        },
        icon: Icons.refresh,
      ),
    );
  }
}
