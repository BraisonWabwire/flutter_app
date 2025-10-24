import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/DetailsPage.dart';
import 'package:flutter_app/settings.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(title: const Text("Tab Navigation Demo")),
        body: const TabBarView(children: [DetailsPage(), Settings()]),
        bottomNavigationBar: const TabBar(
          tabs: [
            Tab(icon: Icon(Icons.info), text: 'Info'),
            Tab(icon: Icon(Icons.settings), text: 'Settings'),
          ],
        ),
      ),
    );
  }
}
