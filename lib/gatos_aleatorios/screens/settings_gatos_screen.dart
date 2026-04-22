import 'package:flutter/material.dart';
import 'package:flutter_animais_aleatorios_app/gatos_aleatorios/controllers/cats_theme_controller.dart';
import 'package:provider/provider.dart';

class SettingsGatosScreen extends StatelessWidget {
  const SettingsGatosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CatsThemeController>(
      builder: (context, themeController, child) {
        return Theme(
          data: themeController.getTheme(context),
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Settings'),
              centerTitle: true,
            ),
            body: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _ThemeSelector(themeController: themeController),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ThemeSelector extends StatelessWidget {
  const _ThemeSelector({required this.themeController});

  final CatsThemeController themeController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        // color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Tema do aplicativo:',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          SegmentedButton<CatsThemeMode>(
            expandedInsets: EdgeInsets.zero,
            segments: const [
              ButtonSegment(
                value: CatsThemeMode.system,
                label: Text('Sistema'),
              ),
              ButtonSegment(
                value: CatsThemeMode.light,
                label: Text('Claro'),
              ),
              ButtonSegment(
                value: CatsThemeMode.dark,
                label: Text('Escuro'),
              ),
            ],
            selected: {themeController.themeMode},
            onSelectionChanged: (selection) =>
                themeController.setThemeMode(selection.first),
          ),
        ],
      ),
    );
  }
}
