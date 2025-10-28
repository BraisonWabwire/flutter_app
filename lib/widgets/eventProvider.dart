import 'package:flutter/material.dart';
import 'package:flutter_app/models/eventModel.dart';

class EventProvider extends InheritedWidget {
  final List<Event> events;
  final Function(Event) addEvent;

  const EventProvider({
    Key? key,
    required this.events,
    required this.addEvent,
    required Widget child,
  }) : super(key: key, child: child);

  // Lookup method
  static EventProvider of(BuildContext context) {
    final provider = context
        .dependOnInheritedWidgetOfExactType<EventProvider>();
    if (provider == null) {
      throw FlutterError('Event not found in context');
    }
    return provider;
  }

  // Only rebuild if event list reference changes
  @override
  bool updateShouldNotify(EventProvider oldWidget) {
    return events != oldWidget.events;
  }
}
