import 'package:flutter/material.dart';

class AnaSayfaController extends ChangeNotifier {
  var _pageRoute = 0;
  get pageRoute => _pageRoute;
  set setPageRoute(int number) {
    _pageRoute = number;
    notifyListeners();
  }

 
  ScrollController scrollController = ScrollController();
  
  List categoryList = [
    {
      "title": "Sıcak Kahveler",
      "image": "assets/images/coffee.png",
    },
    {
      "title": "Soğuk Kahveler",
      "image": "assets/images/hot-drink.png",
    },
    {
      "title": "Sıcak Çaylar",
      "image": "assets/images/tea.png",
    },
    {
      "title": "Sıcak İçecekler",
      "image": "assets/images/hot-drinks.png",
    },
    {
      "title": "Buzlu Çaylar",
      "image": "assets/images/mug.png",
    },
    {
      "title": "Özel",
      "image": "assets/images/menu.png",
    },
  ];
}


