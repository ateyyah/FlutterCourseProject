import 'package:FlutterCourseProject/Models/MenuItem.dart';
import 'package:FlutterCourseProject/Providers/MainProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class MenuItemsCard extends StatelessWidget {
  final int id;
  final String name;
  final String description;
  final int price;
  final String image;
  final int rating;

  const MenuItemsCard({
    Key key,
    this.id,
    this.name,
    this.description,
    this.price,
    this.image,
    this.rating,
  }) : super(key: key);

  // void onPressedCard(BuildContext context) {
  //   print('Tapped restaurant card');
  //   MainProvider.selectMenuItem(context, this.id);
  //   MenuItem selectedRest =
  //       Provider.of<MainProvider>(context, listen: false).findMenuItem(id);

  //   AlertDialog alert = new AlertDialog(
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
  //     backgroundColor: Theme.of(context).primaryColorLight,
  //     content: Container(
  //       height: 300,
  //       child: Column(
  //         children: [
  //           Text(
  //             selectedRest.name,
  //             style: Theme.of(context).textTheme.headline5,
  //           ),
  //           Text(selectedRest.phone),
  //         ],
  //       ),
  //     ),
  //     actions: [
  //       FlatButton(
  //         onPressed: () => Navigator.pop(context),
  //         child: Text('Cancel'),
  //       )
  //     ],
  //   );
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        child: Container(
          width: double.infinity,
          height: 500,
          // padding: EdgeInsets.all(20),
          child: InkWell(
            splashColor: Theme.of(context).accentColor,
            onTap: () {}, //onPressedCard(context),
            child: Column(
              children: [
                Image.network(
                  'http://appback.ppu.edu/static/' + this.image,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                  height: 300,
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
                                  this.name,
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  this.price.toString(),
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
                            FlatButton(
                              onPressed: () {}, // onPressedCard(context),
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
                                          .copyWith(color: Colors.black87)),
                                ],
                              ),
                              color: Colors.green[400],
                            ),
                            FlatButton(
                              onPressed: () {}, // onPressedCard(context),
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
                                initialRating: this.rating / 2,
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
}
