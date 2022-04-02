import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ordo/Rupiah.dart';
import 'package:ordo/Screens/DetailProduct/DetailProduct.dart';
import 'package:ordo/Screens/Home/State/StateDashboard.dart';
import 'package:provider/provider.dart';

import 'Widget/Home.dart';

class Dashboard extends StatelessWidget {
  List<Widget> pages = [
    Center(
      child: Text("Assignment"),
    ),
    Center(
      child: Text("Swap Horiz"),
    ),
    Home(),
    Center(
      child: Text("Assessment"),
    ),
    Center(
      child: Text("Person"),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<StateDashboard>(
        create: (context) => StateDashboard(),
        child: Consumer<StateDashboard>(builder: (context, state, child) {
          return Scaffold(
              backgroundColor: Color(0xffFCF8F8),
              bottomNavigationBar: BottomNavigationBar(
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedItemColor: Colors.black,
                unselectedItemColor: Colors.grey[400],
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.assignment), label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.swap_horiz), label: ''),
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.assessment), label: ''),
                  BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
                ],
                currentIndex: state.index!,
                type: BottomNavigationBarType.fixed,
                onTap: (index) {
                  state.setIndex(index);
                },
              ),
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 135,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Color(0xffF0F0F0),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: TextField(
                          style: GoogleFonts.poppins(
                              fontSize: 10.5,
                              height: 2,
                              color: Color(0xff010101).withOpacity(0.2)),
                          decoration: InputDecoration(
                              prefixIcon: ShaderMask(
                                  shaderCallback: (Rect bounds) {
                                    return const RadialGradient(
                                      center: Alignment.topLeft,
                                      radius: 0.5,
                                      colors: <Color>[
                                        Color(0xff3AB648),
                                        Color(0xff526430)
                                      ],
                                      tileMode: TileMode.mirror,
                                    ).createShader(bounds);
                                  },
                                  child: Icon(
                                    Icons.search,
                                    color: Color(0xff3AB648),
                                  )),
                              border: InputBorder.none,
                              hintText: "Cari dengan mengetik barang",
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 10.5,
                                  height: 2,
                                  color: Color(0xff010101).withOpacity(0.2)))),
                    ),
                    Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            color: Colors.blue[400],
                            borderRadius: BorderRadius.circular(6)),
                        child: const Icon(
                          Icons.tune_sharp,
                          size: 20,
                          color: Colors.white,
                        )),
                    Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: Colors.brown[400],
                          borderRadius: BorderRadius.circular(6)),
                      child: const Icon(Icons.local_mall,
                          size: 20, color: Colors.white),
                    ),
                    Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            color: Colors.red[400],
                            borderRadius: BorderRadius.circular(6)),
                        child: const Icon(Icons.notifications_active_outlined,
                            size: 20, color: Colors.white)),
                  ],
                ),
              ),
              body: pages[state.index!]);
        }));
  }
}
