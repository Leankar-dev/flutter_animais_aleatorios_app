import 'package:flutter/material.dart';
import 'package:flutter_animais_aleatorios_app/caes_aleatorios/controllers/dogs_color_controller.dart';
import 'package:flutter_animais_aleatorios_app/caes_aleatorios/services/dog_api_service.dart';
import 'package:flutter_animais_aleatorios_app/gatos_aleatorios/controllers/cats_home_controller.dart';
import 'package:flutter_animais_aleatorios_app/gatos_aleatorios/controllers/cats_theme_controller.dart';
import 'package:flutter_animais_aleatorios_app/gatos_aleatorios/services/cat_api_service.dart';
import 'package:flutter_animais_aleatorios_app/routes.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DogApiService>(create: (context) => DogApiService()),
        ChangeNotifierProvider(create: (context) => DogsColorController()),
        Provider<CatApiService>(create: (context) => CatApiService()),
        ChangeNotifierProvider(
          create: (context) =>
              CatsHomeController(catApiService: context.read<CatApiService>()),
        ),
        ChangeNotifierProvider(create: (context) => CatsThemeController()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        initialRoute: AppRoutes.menu,
        routes: AppRoutes.routes,
      ),
    );
  }
}
