import 'package:flutter/material.dart';
import 'package:flutter_animais_aleatorios_app/caes_aleatorios/services/dog_api_service.dart';
import 'package:flutter_animais_aleatorios_app/menu/menu_screen.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<DogApiService>(
      create: (context) => DogApiService(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        home: const MenuScreen(),
      ),
    );
  }
}
