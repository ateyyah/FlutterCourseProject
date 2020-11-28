import 'dart:convert';

import 'package:FlutterCourseProject/Models/MenuItem.dart';
import 'package:FlutterCourseProject/Providers/MainProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:provider/provider.dart';

class MenuItemsCard extends StatefulWidget {
  final int id;
  final String name;
  final String description;
  final int price;
  final String image;
  final int rating;

  const MenuItemsCard({
    Key key,
    this.id,
    this.name = 'ResName',
    this.description = 'desc',
    this.price = 0,
    this.image = "",
    this.rating = 0,
  }) : super(key: key);

  @override
  _MenuItemsCardState createState() => _MenuItemsCardState();
}

bool isOrdered = false;
bool isFavourite = false;

class _MenuItemsCardState extends State<MenuItemsCard> {
  @override
  void initState() {
    checkInfo();
    super.initState();
  }

  checkInfo() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     if (!(prefs.containsKey('orderList')))
//       await prefs.setString("orderList", "[]");
//     print(prefs.getKeys());

//     print("BLA BLA" + prefs.getString('orderList'));

//     List<int> posts = List<int>.from(jsonDecode(prefs.getString('orderList')));
// // List<int> posts = List<int>.from(prefs.getString('orderList')).map((Map model)=> int.fromJson(model)).toList();
//     print("POSTS" + posts.toList().toString());
//     List<int> orderList = jsonDecode(prefs.getString("orderList")).toList();
//     if (orderList.contains(this.widget.id)) {
//       isOrdered = true;
//       setState(() {});
//       return;
//     } else
//       isOrdered = false;
//     setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(10),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        child: Container(
          width: double.infinity,
          height: screenHeight*0.6,
          // padding: EdgeInsets.all(20),
          child: InkWell(
            splashColor: Theme.of(context).accentColor,
            onTap: () {}, //onPressedCard(context),
            child: Column(
              children: [
                FadeInImage(
                  placeholder: AssetImage('assets/images/placeholder.png'),
                  image: NetworkImage(
                      'http://appback.ppu.edu/static/' + this.widget.image),
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                  height: screenHeight*0.35,
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.assignment),
                                SizedBox(width: 10),
                                Text(
                                  this.widget.name,
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  this.widget.price.toString(),
                                  style: TextStyle(
                                      color: Colors.grey[800], fontSize: 25),
                                ),
                                SizedBox(width: 5),
                                Icon(
                                  Icons.attach_money,
                                  size: 40,
                                  color: Colors.grey[800],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            !isOrdered
                                ? FlatButton(
                                    onPressed:
                                        _addToOrderList, // onPressedCard(context),
                                    child: Row(
                                      children: [
                                        Icon(Icons.add_shopping_cart),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('Order',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6
                                                .copyWith(
                                                    color: Colors.black87)),
                                      ],
                                    ),
                                    color: Colors.green[400],
                                  )
                                : Text(
                                    'In OrderList',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                            FlatButton(
                              onPressed:
                                  _addToFavourites, // onPressedCard(context),
                              child: Row(
                                children: [
                                  Icon(Icons.favorite),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text('Add to favourites',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2),
                                ],
                              ),
                              color: Theme.of(context).accentColor,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Center(
                              child: RatingBar.builder(
                                initialRating: this.widget.rating / 2,
                                minRating: 1,
                                ignoreGestures: true,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber[300],
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                            ),
                            FlatButton(
                              onPressed: () {},
                              child: Text("Rate !"),
                              color: Theme.of(context).primaryColorLight,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _addToOrderList() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // List<int> orderList = jsonDecode(prefs.getString("orderList"));
    // if (orderList.contains(this.widget.id)) {
    //   isOrdered = true;
    //   setState(() {});
    //   return;
    // }
    // orderList.add(this.widget.id);
    // await prefs.setString('orderList', jsonEncode(orderList));
    // setState(() {});
  }

  _addToFavourites() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // List<int> favouritesList = jsonDecode(prefs.getString("favouritesList"));
    // if (favouritesList.contains(this.widget.id)) {
    //   isFavourite = true;
    //   setState(() {});
    //   return;
    // }
    // favouritesList.add(this.widget.id);
    // await prefs.setString('favouritesList', jsonEncode(favouritesList));
    // setState(() {});
  }
}
