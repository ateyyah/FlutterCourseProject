import 'package:FlutterCourseProject/Models/Restaurant.dart';
import 'package:FlutterCourseProject/Providers/MainProvider.dart';
import 'package:FlutterCourseProject/Screens/MenuItemsPAge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class RestaurantCard extends StatelessWidget {
  final int id;
  final String name;
  final String city;
  final int rating;
  final String image;

  const RestaurantCard({
    Key key,
    this.id,
    this.name,
    this.city,
    this.rating,
    this.image,
  }) : super(key: key);

  void onPressedShowMenuItems(BuildContext context) {
    MainProvider.selectRestaurant(context, this.id);
    Navigator.pushNamed(context, MenuItemsPage.routeName);
  }

  void onPressedCard(BuildContext context) {
    // print('Tapped Restaurant Card');
    MainProvider.selectRestaurant(context, this.id);
    Restaurant selectedRest =
        Provider.of<MainProvider>(context, listen: false).findRestaurant(id);

    AlertDialog alert = new AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      backgroundColor: Theme.of(context).primaryColorLight,
      content: Container(
        height: 300,
        child: Column(
          children: [
            Text(
              selectedRest.name,
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(selectedRest.phone),
          ],
        ),
      ),
      actions: [
        FlatButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        )
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
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
          height: screenHeight*0.45,
          // padding: EdgeInsets.all(20),
          child: InkWell(
            splashColor: Theme.of(context).accentColor,
            onTap: () => onPressedCard(context),
            child: Column(
              children: [
                Image.network(
                  'http://appback.ppu.edu/static/' + this.image,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                  height: screenHeight*0.25,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(screenHeight*0.01),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.assignment),
                                    SizedBox(width: screenHeight*0.01),
                                    Text(
                                      this.name,
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      size: 20,
                                      color: Colors.grey[800],
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      this.city,
                                      style: TextStyle(
                                          color: Colors.grey[800],
                                          fontSize: 17),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            FlatButton(
                              onPressed: () => onPressedShowMenuItems(context),
                              child: Text('Show Menu Items',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(color: Colors.white)),
                              color: Theme.of(context).primaryColor,
                            )
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

// Each Restaurant item on this page should display:
// 1.	Name
// 2.	City
// 3.	Rating (as a 5-star graphic view)
// 4.	image
// 5.	Buttons for (show menu items), (rate)
