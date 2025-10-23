import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget(count: 0));
}

class MyWidget extends StatelessWidget {
  final int count;
  const MyWidget({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('My Widget')),
        body: Center(
          child: Text(
            'Count: $count',
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
