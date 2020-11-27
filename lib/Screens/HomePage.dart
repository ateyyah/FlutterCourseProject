import 'package:FlutterCourseProject/Providers/MainProvider.dart';
import 'package:FlutterCourseProject/Widgets/Drawer.dart';
import 'package:FlutterCourseProject/Widgets/RestaurantCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/main_page';

  final String title;

  HomePage({Key key, this.title}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<MainProvider>().initalLoad();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: Text('TALABAT'),
        ),
        endDrawer: MainpageDrawer(),
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Avaliable Restaurants:",
                style: Theme.of(context).textTheme.headline4,
              ),
              SingleChildScrollView(
                child: Container(
                  height: 700,
                  child: ListView.builder(
                    itemCount: value.restaurants.length,
                    itemBuilder: (BuildContext context, int index) {
                      return RestaurantCard(
                        name: value.restaurants[index].name,
                        city: value.restaurants[index].city,
                        image: value.restaurants[index].image,
                        rating: value.restaurants[index].rating,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
