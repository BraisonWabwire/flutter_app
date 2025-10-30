import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("contacts")),
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: contactNotifier,
          builder: (context, contact, child) {
            if (contact == null) {
              return const Text("No contact saved yet");
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Name: ${contact.name}',
                  style: const TextStyle(fontSize: 20),
                ),
                 Text(
                  'Phone number: ${contact.phoneNumber}',
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
