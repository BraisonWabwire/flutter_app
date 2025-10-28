import 'package:flutter/material.dart';
import 'package:flutter_app/models/counterModel.dart';
import 'package:flutter_app/pages/homePage.dart';
import 'package:provider/provider.dart'; 

void main() {
  runApp(
      ChangeNotifierProvider(
      create: (context) => CounterModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Providers demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
      ),
      home: const HomePage(title: "Learning providers"),
    );
  }
}
