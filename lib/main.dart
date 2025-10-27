// Reusable custom widget
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/app_buttons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Button',
      home: Scaffold(
        appBar: AppBar(title: const Text("Test Custom Button")),
        body: Center(
          child: Row(
            children: [
              CustomButton(
                backgroundColor: Colors.black,
                borderColor: Colors.black,
                textColor: Colors.white,
                text: "1",
                size: 40,
              ),
              SizedBox(width: 10),
              CustomButton(
                backgroundColor: Colors.black,
                borderColor: Colors.black,
                textColor: Colors.white,
                isIcon: true,
                icon: Icons.settings,
                size: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
