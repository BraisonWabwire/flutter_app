import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Stateless widgest',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Stateless widgets'),
        ),
        body: Column(
          children: [
            const Text('This is a simple stateless widget example.'),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Press Me'),
            ),
          ],
        ),
      ),
    );
  }
}
