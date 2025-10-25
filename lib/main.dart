import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 20, color: Colors.black),
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Blue Themed App')),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(onPressed: () {}, child: const Text('Press Me')),
            ],
          ),
        ),
      ),
    );
  }
}
