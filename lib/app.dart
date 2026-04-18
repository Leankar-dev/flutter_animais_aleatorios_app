import 'package:flutter/material.dart';
import 'package:flutter_animais_aleatorios_app/caes_aleatorios/services/dog_api_service.dart';
import 'package:flutter_animais_aleatorios_app/routes.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DogApiService>(create: (context) => DogApiService()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
        initialRoute: AppRoutes.menu,
        routes: AppRoutes.routes,
      ),
    );
  }
}
