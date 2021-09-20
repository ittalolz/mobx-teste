import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'controller.dart';
import 'home.dart';

void main() {
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<Controller>(Controller());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobx Curso',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(
        title: 'mobx',
      ),
    );
  }
}
