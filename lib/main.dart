import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Single subscription stream controller
  StreamController<String> _streamController = StreamController<String>();
  // Broadcast stream controller
  late Stream<String> dataStream;
  TextEditingController _textEditingController = TextEditingController();


  @override
  void initState() {
    dataStream = _streamController.stream.asBroadcastStream();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('My App')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder<String>(
                stream: dataStream,
                builder: (context, asyncSnapshot) {
                  if (asyncSnapshot.hasData) {
                    return Text(asyncSnapshot.data!);
                  } else {
                    return const Text("No data");
                  }
                },
              ),
              StreamBuilder<String>(
                stream: dataStream,
                builder: (context, asyncSnapshot) {
                  if (asyncSnapshot.hasData) {
                    return Text(asyncSnapshot.data!);
                  } else {
                    return const Text("No data");
                  }
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: TextField(controller: _textEditingController),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _streamController.add(_textEditingController.text);
                },
                child: Text("Done"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
