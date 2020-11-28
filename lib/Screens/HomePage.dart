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
  MainProvider dataProvider;
  @override
  void initState() {
    super.initState();
    dataProvider = context.read<MainProvider>();
    // context.read<MainProvider>().initalLoad();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      drawerScrimColor: Theme.of(context).accentColor.withAlpha(50),
      appBar: AppBar(
        title: Text(
          'TALABAT',
          style: TextStyle(color: Colors.black87),
        ),
        iconTheme: IconThemeData(color: Colors.black87),
        backgroundColor: Theme.of(context).primaryColorLight,
      ),
      endDrawer: MainpageDrawer(),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "Avaliable Restaurants:",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            FutureBuilder(
                future:
                    // context.watch<MainProvider>().fetchRestaurantsData(),
                    Provider.of<MainProvider>(context).fetchRestaurantsData(),
                builder: (context, snapshot) {
                  print(snapshot.connectionState);
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.connectionState == ConnectionState.done)
                    return SingleChildScrollView(
                      child: Container(
                        height: screenHeight * 0.75,
                        child: ListView.builder(
                          itemCount: dataProvider.restaurants.length,
                          itemBuilder: (BuildContext context, int index) {
                            return RestaurantCard(
                              id: dataProvider.restaurants[index].id,
                              name: dataProvider.restaurants[index].name,
                              city: dataProvider.restaurants[index].city,
                              image: dataProvider.restaurants[index].image,
                              rating: dataProvider.restaurants[index].rating,
                            );
                          },
                        ),
                      ),
                    );
                  return null;
                })
          ],
        ),
      ),
    );
  }
}
