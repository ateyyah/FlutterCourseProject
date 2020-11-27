import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RestaurantCard extends StatelessWidget {
  final String name;
  final String city;
  final int rating;
  final String image;

  const RestaurantCard({
    Key key,
    this.name,
    this.city,
    this.rating,
    this.image,
  }) : super(key: key);

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
          height: 340,
          // padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Image.network(
                'http://appback.ppu.edu/static/' + this.image,
                width: double.maxFinite,
                fit: BoxFit.cover,
                height: 200,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                          Icon(
                            Icons.location_on,
                            color: Colors.grey[800],
                          ),
                          SizedBox(width: 10),
                          Text(
                            this.city,
                            style: TextStyle(
                                color: Colors.grey[800], fontSize: 17),
                          )
                        ],
                      ),
                      Center(
                        child: RatingBar.builder(
                          initialRating: this.rating / 2,
                          minRating: 1,
                          ignoreGestures: true,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber[300],
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ),
                    ],
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
// Each Restaurant item on this page should display:
// 1.	Name
// 2.	City
// 3.	Rating (as a 5-star graphic view)
// 4.	image
// 5.	Buttons for (show menu items), (rate)
