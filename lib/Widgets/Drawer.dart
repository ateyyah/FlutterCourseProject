import 'package:flutter/material.dart';

class MainpageDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                // Logo
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    title: GestureDetector(
                      onTap: () {
                        Navigator.of(context).popUntil((route) {
                          if (route.settings.name == '/') {
                            return true;
                          }
                          return false;
                        });
                        Navigator.pop(context); // To close the drawer itself.
                      },
                      child: Image(
                        height: screenHeight * 0.1,
                        image: AssetImage(
                          'assets/images/logo.png',
                        ),
                        width: screenWidth * 0.2,
                      ),
                    ),
                  ),
                ),

                // Tiles
                DrawerTile(
                  title: 'الرئيسية',
                  icon: Icon(Icons.home),
                  function: () {
                    Navigator.of(context).popUntil((route) {
                      if (route.settings.name == '/') {
                        return true;
                      }
                      return false;
                    });
                    Navigator.pop(context); // To close the drawer itself.
                  },
                ),

                DrawerTile(
                  title: 'المفضلة',
                  icon: Icon(Icons.star),
                  function: () {
                    // Navigator.of(context).pushNamed(
                    //     FavouritesScreen.routeName,
                    //     );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  final String title;
  final Function function;
  final Widget icon;
  DrawerTile({
    @required this.title,
    this.function,
    this.icon = const Icon(Icons.notifications_none),
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    // double screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: this.function == null
          ? () {
              print("No function added yet!");
            }
          : this.function,
      splashColor: Theme.of(context).accentColor,
      highlightColor: Theme.of(context).accentColor,
      child: Container(
        height: screenHeight * 0.08,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 0.5,
              color: Colors.black38,
            ),
          ),
        ),
        child: ListTile(
          title: Stack(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: this.icon,
              ),
              Container(
                padding: EdgeInsets.only(left: 30, right: 30, bottom: 5),
                alignment: Alignment.center,
                child: Text(
                  this.title,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
