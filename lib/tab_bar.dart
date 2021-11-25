import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'categoreis_screen.dart';

class TabBarScreen extends StatelessWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Watchlist'),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Contact 1"),
              Tab(text: "Contact 2"),
              Tab(
                text: 'Contact 3',
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            CategoriesScreen(),
            CategoriesScreen(),
            CategoriesScreen(),
          ],
        ),
      ),
    );
  }
}
