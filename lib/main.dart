import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _namecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Using controllers',
      home: Scaffold(
        appBar: AppBar(title: const Text('Using controllers')),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _namecontroller,
                decoration: const InputDecoration(labelText: 'Enter your Name'),
              ),
              const SizedBox(height: 20),
              Builder(
                builder: (context) {
                  return ElevatedButton(onPressed: (){
                    final name=_namecontroller.text;
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Hello, $name")));
                  },child: const Text('Show greeting'),);
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
