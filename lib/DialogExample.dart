import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dialogexample extends StatelessWidget {
  const Dialogexample({super.key});

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Cancel"),
          content: const Text("Are you sure you want to cancel?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Confirm"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dialog Example")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showDialog(context),
          child: const Text("Show Dialog"),
        ),
      ),
    );
  }
}
