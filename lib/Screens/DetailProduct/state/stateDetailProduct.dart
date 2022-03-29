import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class StateDetailProdct with ChangeNotifier {
  List<String>? images = [
    "assets/images/banner1.png",
    "assets/images/banner1.png",
    "assets/images/banner1.png",
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

  int current = 0;
  final CarouselController controller = CarouselController();
  ScrollController sc = ScrollController();
  void setCurrent(int value) {
    current = value;
    notifyListeners();
  }
}
