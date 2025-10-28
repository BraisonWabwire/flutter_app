import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/eventProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = EventProvider.of(context);
    final events = provider.events;

    return Scaffold(
      appBar: AppBar(title: Text("My events")),
      body: events.isEmpty
          ? Center(child: Text('No events found, add one'))
          : ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                final event = events[index];
                return ListTile(
                  title: Text(event.title),
                  subtitle: Text(event.description),
                  trailing: Text(event.date.toString().substring(0, 10)),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/add'),
        child: Icon(Icons.add),
      ),
    );
  }
}
