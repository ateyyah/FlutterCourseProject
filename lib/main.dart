import 'package:FlutterCourseProject/Providers/MainProvider.dart';
import 'package:FlutterCourseProject/Screens/MenuItemsPAge.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(accentColor: Colors.amber),
        routes: {
          HomePage.routeName: (ctx) => HomePage(),
          MenuItemsPage.routeName: (ctx) => MenuItemsPage(),
        },
        home: HomePage(title: 'Talabat App'),
      ),
    );
  }
}
