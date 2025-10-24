import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details Page"),
      ),
      body: Column(
        children: [
          const Text('This is the Details Page'),
          ElevatedButton(onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go Back'),)
        ]
      ),
    );
  }
}
