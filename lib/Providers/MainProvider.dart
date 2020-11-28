import 'dart:convert';

import 'package:FlutterCourseProject/Models/MenuItem.dart';
import 'package:FlutterCourseProject/Models/Restaurant.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class MainProvider extends ChangeNotifier {
  List<Restaurant> _restaurants = [];
  List<MenuItem> _menuItems = [];

  List<MenuItem> get menuItems => _menuItems;
  List<Restaurant> get restaurants => _restaurants;

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

  Future<bool> fetchMenuItemData(int menuItemId) async {
    String url = 'http://appback.ppu.edu/menus/${menuItemId.toString()}';

    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as List;
      // if (extractedData['error'] != null || extractedData == null) return false;

      List<MenuItem> newMenuItems =
          extractedData.map((e) => MenuItem.fromJson(e)).toList();
      _setMenuItems(newMenuItems);
      // _setRestaurants(extractedData.map((e) => Restaurant.fromJson(e)).toList());
      notifyListeners();
      return true;
    } catch (e) {
      print('ERROR FETCHING DATA !');
      return false;
    }
  }

  Future<bool> fetchAndSetData() async {
    const url =
        'https://buthor-kids.com/weather_backend/weatherapp-backend/api/v1/home';

    try {
      // final response = await http.get(url);
      // final extractedData = json.decode(response.body);

      // if (extractedData['error'] != null || extractedData == null) return false;

      // await checkRegionData(extractedData['regions']);
      // _setDetailedWeatherForecast(extractedData['detailed_weather']);
      // _setMainWeatherDetails(extractedData);
      // _setWhatToWearData(extractedData['whatweartommoro']);
      // _setTenDaysForecast(extractedData);
      // _setCurrencyExchangeList(extractedData['currency']);
      // _setMoonStatus(extractedData['moonstatus']);
      // _setEarthquaks(extractedData['earthquakes']);
      // _setPrayers(extractedData['prayers']);
      // _setRain(extractedData['rain']);
      // _setAlerts(extractedData['notifications']);
      // _setRegions(extractedData['regions']);
      // _setNews(extractedData['mainnews']);
      // _breakNews = extractedData['break_news'];
      // if (_detailedWeatherForecast == null ||
      //     _currencyExchangeList == null ||
      //     _moonStatus == null ||
      //     _regionWeatherDetails == null ||
      //     _tenDaysForecast == null ||
      //     _regionIndex == null ||
      //     _breakNews == null) return false;

      notifyListeners();
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
