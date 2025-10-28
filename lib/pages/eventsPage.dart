import 'package:flutter/material.dart';
import 'package:flutter_app/models/eventModel.dart';
import 'package:flutter_app/widgets/eventProvider.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  final _titleController = TextEditingController();
  final _desController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add event")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'title'),
            ),
            TextField(
              controller: _desController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final title = _titleController.text;
                final desc = _desController.text;
                if (title.isNotEmpty && desc.isNotEmpty) {
                  final event = Event(
                    title: title,
                    description: desc,
                    date: DateTime.now(),
                  );

                  // Use of shared event function
                  EventProvider.of(context).addEvent(event);

                  Navigator.pop(context);
                }
              },
              child: Text("Save event"),
            ),
          ],
        ),
      ),
    );

  }
    @override
    void dispose() {
      _titleController.dispose();
      _desController.dispose();
      super.dispose();
    }
}
