import 'package:FlutterCourseProject/Providers/MainProvider.dart';
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
        theme: ThemeData(),
        routes: {
          HomePage.routeName: (ctx) => HomePage(),
        },
        home: HomePage(title: 'Talabat App'),
      ),
    );
  }
}
