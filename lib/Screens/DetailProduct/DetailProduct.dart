import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ordo/Screens/Cart/CartPage.dart';
import 'package:ordo/Screens/DetailProduct/Widget/Detail.dart';
import 'package:ordo/Screens/DetailProduct/state/stateDetailProduct.dart';
import 'package:provider/provider.dart';

import '../../Rupiah.dart';

class DetailProduct extends StatelessWidget {
  List<Widget> pages = [
    Center(
      child: Text("Assignment"),
    ),
    Center(
      child: Text("Swap Horiz"),
    ),
    Detail(),
    Center(
      child: Text("Assessment"),
    ),
    Center(
      child: Text("Person"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<StateDetailProdct>(
        create: (context) => StateDetailProdct(),
        child: Consumer<StateDetailProdct>(builder: (context, state, child) {
          return Scaffold(
            backgroundColor: Color(0xffFCF8F8),
            bottomNavigationBar: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey[400],
              
              items:  [
                const BottomNavigationBarItem(
                    icon: Icon(Icons.assignment), label: ''),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.swap_horiz), label: ''),
                BottomNavigationBarItem(icon: Icon(Icons.home), label: '',activeIcon: Icon(Icons.home,color: Colors.grey[300],)),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.assessment), label: ''),
                const BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              color: Colors.blue[300],
                              borderRadius: BorderRadius.circular(100)),
                          child: SizedBox(
                            width: 16,
                            height: 16,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                Navigator.pushReplacementNamed(context, '/home');
                              },
                              icon: const Icon(
                                Icons.arrow_back_sharp,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Product Detail",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.blue[300],
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                              Navigator.pushReplacementNamed(context, '/keranjang');
                          },
                          child: Container(
                            padding: EdgeInsets.all(2),
                            child: Icon(Icons.local_mall,
                                size: 25, color: Colors.brown[400]),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(2),
                          child: Icon(
                            Icons.notifications_active,
                            size: 25,
                            color: Colors.red[400],
                          ),
                        )
                      ],
                    ),
                  ],
                )),
            body: pages[state.index!]
          );
        }));
  }
}
