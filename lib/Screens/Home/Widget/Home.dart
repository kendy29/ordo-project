import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../Rupiah.dart';
import '../../DetailProduct/DetailProduct.dart';
import '../State/StateDashboard.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StateDashboard>(builder: (context, state, child) {
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
              margin: const EdgeInsets.only(left: 24, right: 24),
              width: MediaQuery.of(context).size.width,
              height: 130,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
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
                            height: 130,
                            fit: BoxFit.fill,
                          ));
                    }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: state.images!.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => state.controller.animateToPage(entry.key),
                  child: Container(
                    width: 24.0,
                    height: 5.0,
                    margin: EdgeInsets.symmetric(vertical: 12.0, horizontal: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.blue[200]
                                : Colors.blue)!
                            .withOpacity(
                                state.current == entry.key ? 0.9 : 0.4)),
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
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 0,
                  itemCount: state.imageProducts!.length,
                  itemBuilder: (BuildContext context, int i) {
                    String img = state.imageProducts![i];
                    return InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/detail');
                      },
                      child: Container(
                        height: 204,
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.only(left: 8, right: 8, bottom: 4),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16)),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
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
                                  Positioned(
                                      top: 0,
                                      left: 0,
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            left: 8,
                                            right: 8,
                                            bottom: 4,
                                            top: 4),
                                        decoration: const BoxDecoration(
                                            color: Color(0xffDFAE1D),
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(16),
                                                topRight: Radius.circular(16),
                                                bottomRight:
                                                    Radius.circular(16))),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Icon(
                                                Icons.star,
                                                size: 13,
                                                color: Colors.white,
                                              ),
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Text("5.0 | 200+ rating",
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 8,
                                                    color: Colors.white,
                                                  ))
                                            ]),
                                      ))
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                            fontSize: 12,
                                            color: Colors.blue[300],
                                            fontWeight: FontWeight.w500,
                                            decoration:
                                                TextDecoration.lineThrough),
                                      ),
                                      Text(
                                        "Rp ${rupiah(4500)}",
                                        style: GoogleFonts.inter(
                                          fontSize: 12,
                                          color: Colors.blue[300],
                                          fontWeight: FontWeight.w800,
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(
                                          left: 6, right: 6, top: 2, bottom: 2),
                                      decoration: BoxDecoration(
                                        color: Colors.blue[300],
                                        borderRadius: BorderRadius.circular(24),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Diskon 10%",
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 8,
                                              fontWeight: FontWeight.w800),
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
                                  fontSize: 13,
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
    });
  }
}
