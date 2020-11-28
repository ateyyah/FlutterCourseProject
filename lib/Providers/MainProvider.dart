import 'dart:convert';

import 'package:FlutterCourseProject/Models/MenuItem.dart';
import 'package:FlutterCourseProject/Models/Restaurant.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class MainProvider extends ChangeNotifier {
  static int selectedRestaurant = -1;

  static void selectRestaurant(BuildContext context, int restID) {
    print("Changed selected Restaurant ID to " + restID.toString());
    selectedRestaurant = restID;
  }

  List<Restaurant> _restaurants = [];
  List<MenuItem> _menuItems = [];

  List<MenuItem> get menuItems => _menuItems;
  List<Restaurant> get restaurants => _restaurants;

  Restaurant findRestaurant(int id) =>
      restaurants.firstWhere((restaurant) => restaurant.id == id);

  void _setRestaurants(List<Restaurant> restaurants) {
    _restaurants = restaurants;
  }

  void _setMenuItems(List<MenuItem> menuItems) {
    _menuItems = menuItems;
  }

  void initalLoad() {
    fetchRestaurantsData();
  }

  Future<bool> fetchRestaurantsData() async {
    const url = 'http://appback.ppu.edu/restaurants';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as List;
      // if (extractedData['error'] != null || extractedData == null) return false;

      List<Restaurant> newRestaurants =
          extractedData.map((e) => Restaurant.fromJson(e)).toList();
      _setRestaurants(newRestaurants);
      // _setRestaurants(extractedData.map((e) => Restaurant.fromJson(e)).toList());
      print('FETCHING RESTAURANTS DATA SUCCESS!');
      return true;
    } catch (e) {
      print('ERROR FETCHING DATA !');
      return false;
    }
  }

  Future<bool> fetchMenuItemData() async {
    if (selectedRestaurant == -1) return false;
    String url =
        'http://appback.ppu.edu/menus/${selectedRestaurant.toString()}';

    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as List;
      // if (extractedData['error'] != null || extractedData == null) return false;

      List<MenuItem> newMenuItems =
          extractedData.map((e) => MenuItem.fromJson(e)).toList();
      _setMenuItems(newMenuItems);
      print(extractedData);
      // _setRestaurants(extractedData.map((e) => Restaurant.fromJson(e)).toList());
      print('FETCHING MENUITEMS DATA SUCCESS!');
      return true;
    } catch (error) {
      Fluttertoast.cancel();
      Fluttertoast.showToast(
          msg: "تحقق من اتصالك",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red[100],
          textColor: Colors.black,
          fontSize: 16.0);

      return false;
    }
  }
}
