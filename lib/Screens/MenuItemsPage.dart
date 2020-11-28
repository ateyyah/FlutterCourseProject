import 'package:FlutterCourseProject/Providers/MainProvider.dart';
import 'package:FlutterCourseProject/Widgets/Drawer.dart';
import 'package:FlutterCourseProject/Widgets/MenuItemCard.dart';
import 'package:FlutterCourseProject/Widgets/RestaurantCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuItemsPage extends StatefulWidget {
  static const routeName = '/menu_items_page';

  final String title;

  MenuItemsPage({Key key, this.title}) : super(key: key);
  @override
  _MenuItemsPageState createState() => _MenuItemsPageState();
}

class _MenuItemsPageState extends State<MenuItemsPage> {
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
          'Menu Items',
          style: TextStyle(color: Colors.black87),
        ),
        iconTheme: IconThemeData(color: Colors.black87),
        backgroundColor: Theme.of(context).primaryColorLight,
      ),
      // endDrawer: MainpageDrawer(),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "List of Items:",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            FutureBuilder(
                future:
                    // context.watch<MainProvider>().fetchRestaurantsData(),
                    Provider.of<MainProvider>(context).fetchMenuItemData(),
                builder: (context, snapshot) {
                  print(snapshot.connectionState);
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.connectionState == ConnectionState.done)
                    return SingleChildScrollView(
                      child: Container(
                        height: screenHeight * 0.75,
                        child: ListView.builder(
                          itemCount: dataProvider.menuItems.length,
                          itemBuilder: (BuildContext context, int index) {
                            return MenuItemsCard(
                              id: dataProvider.menuItems[index].id,
                              name: dataProvider.menuItems[index].name,
                              description:
                                  dataProvider.menuItems[index].description,
                              image: dataProvider.menuItems[index].image,
                              price: dataProvider.menuItems[index].price,
                              rating: dataProvider.menuItems[index].rating,
                            );
                          },
                        ),
                      ),
                    );
                  return Text("Check your Connection !");
                })
          ],
        ),
      ),
    );
  }
}
