import 'package:flutter/material.dart';
import 'package:flutter_app/pages/homepage.dart';

void main() {
  runApp(const FileReaderApp());
}

class FileReaderApp extends StatelessWidget {
  const FileReaderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'File reader example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Homepage(),
    );
  }
}
