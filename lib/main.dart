import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

/// This is our custom InheritedWidget that stores the counter state
class CounterProvider extends InheritedWidget {
  final int counter;
  final VoidCallback increment;

  const CounterProvider({
    super.key,
    required this.counter,
    required this.increment,
    required Widget child,
  }) : super(child: child);

  // Method used by child widgets to access the data
  static CounterProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterProvider>();
  }

  // Tells Flutter when to rebuild widgets that depend on this
  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return counter != oldWidget.counter;
  }
}

/// The main app widget
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      counter: counter,
      increment: increment,
      child: MaterialApp(
        title: 'InheritedWidget Demo',
        home: Scaffold(
          appBar: AppBar(title: const Text('InheritedWidget Example')),
          body: const Center(child: CounterDisplay()),
          floatingActionButton: const IncrementButton(),
        ),
      ),
    );
  }
}

/// Widget that displays the counter
class CounterDisplay extends StatelessWidget {
  const CounterDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = CounterProvider.of(context)!;
    return Text(
      'Counter value: ${provider.counter}',
      style: const TextStyle(fontSize: 24),
    );
  }
}

/// Widget that triggers the increment
class IncrementButton extends StatelessWidget {
  const IncrementButton({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = CounterProvider.of(context)!;
    return FloatingActionButton(
      onPressed: provider.increment,
      child: const Icon(Icons.add),
    );
  }
}
