// Inherited widget
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}


// Defineing inherited widget
class UserInheritedWidget extends InheritedWidget {
  final String username;

  const UserInheritedWidget({
    required this.username,
    required Widget child, 
    Key? key,
  }): super(key: key, child: child);


  // Static method to access the inherited widget
  static UserInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserInheritedWidget>();
  }

  @override
  bool updateShouldNotify(covariant UserInheritedWidget oldWidget) {
    return oldWidget.username != username;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserInheritedWidget(
      username: 'Braison Wabwire',
      child: MaterialApp(
        home: homePage(),
      ),
    );
  }
}

class homePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userWidget = UserInheritedWidget.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Inherited Widget Example'),
      ),
      body: Center(
        child: Text('Hello, ${userWidget?.username ?? 'Guest'}!'),
      ),
    );
  }
}

