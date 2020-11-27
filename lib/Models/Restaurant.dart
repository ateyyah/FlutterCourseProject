class Restaurant {
  final int id;
  final String name;
  final String city;
  final int rating;
  final String image;
  final String phone;
  final String longtitude;
  final String latitude;

  Restaurant({
    this.id,
    this.name,
    this.city,
    this.rating,
    this.image,
    this.phone,
    this.longtitude,
    this.latitude,
  });

  factory Restaurant.fromJson(dynamic jsonObject) {
    // var resturants = jsonObject['products'] as List;
    // List<Restaurant> _restaurants =
    //     prds.map((element) => Restaurant.fromJson(element)).toList();

    return Restaurant(
      id: jsonObject['id'],
      name: jsonObject['name'],
      city: jsonObject['city'],
      phone: jsonObject['phone'],
      image: jsonObject['image'],
      rating: jsonObject['rating'],
      latitude: jsonObject['latitude'],
      longtitude: jsonObject['longtitude'],
    );
  }
}

// Each Restaurant item on this page should display:
// 1.	Name
// 2.	City
// 3.	Rating (as a 5-star graphic view)
// 4.	image
// 5.	Buttons for (show menu items), (rate)
// If (for some reason) there are no Restaurants to be displayed, the page should list a suitable message.
