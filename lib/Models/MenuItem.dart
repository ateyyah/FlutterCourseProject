// 2.	menu item name, description, price, image, rating.

class MenuItem {
  final int id;
  final int restId;
  final String name;
  final String description;
  final double price;
  final String image;
  final String rating;

  MenuItem({
    this.id,
    this.restId,
    this.name,
    this.description,
    this.price,
    this.image,
    this.rating,
  });

  factory MenuItem.fromJson(dynamic jsonObject) {
    return MenuItem(
      id: jsonObject['id'],
      restId: jsonObject['restId'],
      name: jsonObject['name'],
      description: jsonObject['descr'],
      price: jsonObject['price'],
      image: jsonObject['image'],
      rating: jsonObject['rating'],
    );
  }
}
// {
// "id": 1,
// "rest_id": 1,
// "name": "maklouba",
// "descr": "Good maklouba Good makloubaGood makloubaGood maklouba",
// "price": 15,
// "image": "makhlouba.jpeg",
// "rating": null
// },
