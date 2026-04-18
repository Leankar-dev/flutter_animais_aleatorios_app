import 'package:flutter/material.dart';
import 'package:flutter_animais_aleatorios_app/caes_aleatorios/controllers/caes_home_controller.dart';
import 'package:flutter_animais_aleatorios_app/caes_aleatorios/controllers/dogs_color_controller.dart';
import 'package:flutter_animais_aleatorios_app/routes.dart';
import 'package:flutter_animais_aleatorios_app/widgets/gradient_fab.dart';
import 'package:provider/provider.dart';

class CaesHomeScreen extends StatelessWidget {
  const CaesHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mainColor = context.watch<DogsColorController>().mainColor;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cães Aleatórios'),
        centerTitle: true,
        backgroundColor: mainColor,
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.pushNamed(context, AppRoutes.caesSettings),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            Flexible(
              child: Consumer<CaesHomeController>(
                builder: (context, controller, child) {
                  if (controller.dogImageUrl.isEmpty) {
                    return const Text(
                      'Pressione o botão para carregar um cachorro!',
                    );
                  }
                  return Image.network(
                    controller.dogImageUrl,
                    fit: BoxFit.contain,
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Selector<CaesHomeController, bool>(
              selector: (_, controller) => controller.isLoading,
              builder: (context, isLoading, child) {
                if (isLoading) {
                  return CircularProgressIndicator(
                    color: mainColor,
                  );
                }
                return SizedBox();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: GradientFAB(
        onPressed: () {
          context.read<CaesHomeController>().loadRandomDog();
        },
        icon: Icons.refresh,
      ),
    );
  }
}
