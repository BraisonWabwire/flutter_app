import 'package:flutter/material.dart';
import 'package:flutter_app/models/eventModel.dart';
import 'package:flutter_app/pages/Homepage.dart';
import 'package:flutter_app/pages/eventsPage.dart';
import 'package:flutter_app/widgets/eventProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Event> _events = [];

  void _addEvent(Event event) {
    setState(() {
      _events = [..._events, event];
    });
  }

  @override
  Widget build(BuildContext context) {
    return EventProvider(events: _events, addEvent: _addEvent, child: MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context) => HomePage(),
        '/add': (context) => EventsPage(),
      },
    ));
  }
}
