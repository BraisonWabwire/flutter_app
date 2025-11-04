import 'package:flutter/material.dart';

enum ThemeAspect { color, fontsize }

class ThemeModel extends InheritedModel<ThemeAspect> {
  final Color color;
  final double fontsize;

  const ThemeModel({
    required this.color,
    required this.fontsize,
    required Widget child,
  }) : super(child: child);

  // Static helper to get the model
  static ThemeModel? of(BuildContext context, ThemeAspect aspect) {
    return InheritedModel.inheritFrom<ThemeModel>(context, aspect: aspect);
  }

  @override
  bool updateShouldNotify(ThemeModel oldWidget) {
    return color != oldWidget.color || fontsize != oldWidget.fontsize;
  }

  @override
  bool updateShouldNotifyDependent(
    ThemeModel oldWidget,
    Set<ThemeAspect> dependencies,
  ) {
    if (dependencies.contains(ThemeAspect.color) && color != oldWidget.color) {
      return true;
    }
    if (dependencies.contains(ThemeAspect.fontsize) &&
        fontsize != oldWidget.fontsize) {
      return true;
    }
    return false;
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color _color = Colors.blue;
  double _fontsize = 20;

  @override
  Widget build(BuildContext context) {
    return ThemeModel(
      color: _color,
      fontsize: _fontsize,
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text("Inherited Model Demo")),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ColorWidget(),
              FontSizeWidget(),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _color = _color == Colors.blue ? Colors.red : Colors.blue;
                  });
                },
                child: const Text("Change color"),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _fontsize = _fontsize == 20 ? 30 : 20;
                  });
                },
                child: const Text("Change font size"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widgets depending on the fontsize
class ColorWidget extends StatelessWidget {
  const ColorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = ThemeModel.of(context, ThemeAspect.color);
    print('ColorWidget Rebuild');
    return Text(
      'This depends on COLOR',
      style: TextStyle(color: model?.color, fontSize: 20),
    );
  }
}

class FontSizeWidget extends StatelessWidget {
  const FontSizeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = ThemeModel.of(context, ThemeAspect.color);
    print('FontSizeWidget Rebuild');
    return Text(
      'This depends on COLOR',
      style: TextStyle(fontSize: model?.fontsize, color: Colors.black),
    );
  }
}
