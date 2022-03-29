import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ordo/Rupiah.dart';
import 'package:ordo/Screens/DetailProduct/DetailProduct.dart';
import 'package:ordo/Screens/Home/State/StateDashboard.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<StateDashboard>(
        create: (context) => StateDashboard(),
        child: Scaffold(
            backgroundColor: Color(0xffFCF8F8),
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 150,
                    height: 35,
                    decoration: BoxDecoration(
                      color: const Color(0xffF0F0F0),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: TextField(
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Color(0xff010101).withOpacity(0.2)),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Cari dengan mengetik barang",
                            hintStyle: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Color(0xff010101).withOpacity(0.2)))),
                  ),
                  Container(
                      padding: EdgeInsets.all(2),
                      color: Colors.blue[400],
                      child: const Icon(
                        Icons.tune_sharp,
                        size: 25,
                        color: Colors.white,
                      )),
                  Container(
                    padding: EdgeInsets.all(2),
                    color: Colors.brown[400],
                    child: const Icon(Icons.local_mall,
                        size: 25, color: Colors.white),
                  ),
                  Container(
                      padding: EdgeInsets.all(2),
                      color: Colors.red[400],
                      child: const Icon(Icons.notifications_active_outlined,
                          size: 25, color: Colors.white)),
                ],
              ),
            ),
            body: Consumer<StateDashboard>(builder: (context, state, child) {
              return Container(
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  controller: state.sc,
                  padding: EdgeInsets.zero,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 24, right: 24),
                      width: MediaQuery.of(context).size.width,
                      height: 180,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: CarouselSlider.builder(
                            carouselController: state.controller,
                            itemCount: state.images!.length,
                            options: CarouselOptions(
                                viewportFraction: 1,
                                enlargeCenterPage: true,
                                autoPlay: true,
                                onPageChanged: (index, reason) {
                                  state.setCurrent(index);
                                }),
                            itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) {
                              return Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Image.asset(
                                    "assets/images/banner.jpg",
                                    width: MediaQuery.of(context).size.width,
                                    height: 350,
                                    fit: BoxFit.fill,
                                  ));
                            }),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: state.images!.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () =>
                              state.controller.animateToPage(entry.key),
                          child: Container(
                            width: 24.0,
                            height: 5.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: (Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.blue[200]
                                        : Colors.blue)!
                                    .withOpacity(state.current == entry.key
                                        ? 0.9
                                        : 0.4)),
                          ),
                        );
                      }).toList(),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 8, right: 8),
                      child: AlignedGridView.count(
                          controller: state.sc,
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 0,
                          itemCount: state.imageProducts!.length,
                          itemBuilder: (BuildContext context, int i) {
                            String img = state.imageProducts![i];
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => DetailProduct()));
                              },
                              child: Container(
                                height: 210,
                                padding: EdgeInsets.all(8),
                                margin: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16)),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 250,
                                        child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                                16), // Image border
                                            child: Image.asset(
                                              img,
                                              width: 250,
                                              fit: BoxFit.fitWidth,
                                            )),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Rp ${rupiah(6000)}",
                                                style: GoogleFonts.inter(
                                                    fontSize: 14,
                                                    color: Colors.blue[300],
                                                    fontWeight: FontWeight.w500,
                                                    decoration: TextDecoration
                                                        .lineThrough),
                                              ),
                                              Text(
                                                "Rp ${rupiah(4500)}",
                                                style: GoogleFonts.inter(
                                                  fontSize: 14,
                                                  color: Colors.blue[300],
                                                  fontWeight: FontWeight.w800,
                                                ),
                                              )
                                            ],
                                          ),
                                          Container(
                                              padding: EdgeInsets.only(
                                                  left: 4,
                                                  right: 4,
                                                  top: 2,
                                                  bottom: 2),
                                              decoration: BoxDecoration(
                                                color: Colors.blue[300],
                                                borderRadius:
                                                    BorderRadius.circular(24),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Diskon 10%",
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                      fontSize: 8,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        "Lorem ipsum",
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    ]),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              );
            })));
  }
}
