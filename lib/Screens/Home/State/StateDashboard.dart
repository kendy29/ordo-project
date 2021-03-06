import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class StateDashboard with ChangeNotifier {
  List<String>? images = [
    "assets/images/banner.jpg",
    "assets/images/banner.jpg",
    "assets/images/banner.jpg",
  ];
  List<String>? imageProducts = [
    "assets/images/produk1.png",
    "assets/images/produk2.png",
    "assets/images/produk3.png",
    "assets/images/produk4.png",
    "assets/images/produk5.png",
    "assets/images/produk6.png",
    "assets/images/produk7.png",
    "assets/images/produk8.png",
  ];
  int? index = 2;
  int current = 0;
  final CarouselController controller = CarouselController();
  ScrollController sc = ScrollController();
  void setCurrent(int value) {
    current = value;
    notifyListeners();
  }
  void setIndex(int value) {
    index = value;
    notifyListeners();
  }
}
