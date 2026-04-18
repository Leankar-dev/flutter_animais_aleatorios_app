import 'package:flutter/material.dart';
import 'package:flutter_animais_aleatorios_app/caes_aleatorios/controllers/caes_home_controller.dart';
import 'package:flutter_animais_aleatorios_app/routes.dart';
import 'package:flutter_animais_aleatorios_app/widgets/gradient_fab.dart';
import 'package:provider/provider.dart';

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
            Consumer<CaesHomeController>(
              builder: (context, controller, child) {
                if (controller.dogImageUrl.isEmpty) {
                  return const Text(
                    'Pressione o botão para carregar um cachorro!',
                  );
                }
                return Image.network(controller.dogImageUrl);
              },
            ),
            const SizedBox(height: 16),
            Selector<CaesHomeController, bool>(
              selector: (_, controller) => controller.isLoading,
              builder: (context, isLoading, child) {
                if (isLoading) {
                  return CircularProgressIndicator(
                    color: Colors.blue[200],
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
