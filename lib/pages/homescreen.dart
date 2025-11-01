import 'package:flutter/material.dart';
import 'package:flutter_app/pages/contacts.dart';

// A class model defining the data
class Contact {
  String name;
  String phoneNumber;

  Contact({required this.name, required this.phoneNumber});
}

// A global notifier that stores the latest value
final contactNotifier = ValueNotifier<Contact?>(null);

// input page
class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Contact')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
            ),
            TextField(
              controller: _phoneNumberController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                contactNotifier.value = Contact(
                  name: _nameController.text,
                  phoneNumber: _phoneNumberController.text,
                );
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const ContactsPage()));
              },
              child: const Text("Save & view a contact"),
            ),
          ],
        ),
      ),
    );
  }
}
