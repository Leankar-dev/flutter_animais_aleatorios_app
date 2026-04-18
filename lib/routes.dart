import 'package:flutter/material.dart';
import 'package:flutter_animais_aleatorios_app/caes_aleatorios/screens/caes_home_screen.dart';
import 'package:flutter_animais_aleatorios_app/caes_aleatorios/screens/settings_caes_screen.dart';
import 'package:flutter_animais_aleatorios_app/gatos_aleatorios/screens/gatos_home_screen.dart';
import 'package:flutter_animais_aleatorios_app/gatos_aleatorios/screens/settings_gatos_screen.dart';
import 'package:flutter_animais_aleatorios_app/menu/menu_screen.dart';

class AppRoutes {
  static const String menu = '/';
  static const String caes = '/caes';
  static const String caesSettings = '/caes/settings';
  static const String gatos = '/gatos';
  static const String gatosSettings = '/gatos/settings';

  static Map<String, WidgetBuilder> get routes => {
    menu: (context) => const MenuScreen(),
    caes: (context) => const CaesHomeScreen(),
    caesSettings: (context) => const SettingsCaesScreen(),
    gatos: (context) => const GatosHomeScreen(),
    gatosSettings: (context) => const SettingsGatosScreen(),
  };
}
