import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ordo/Screens/Cart/CartPage.dart';
import 'package:ordo/Screens/DetailProduct/state/stateDetailProduct.dart';
import 'package:provider/provider.dart';

import '../../Rupiah.dart';

class DetailProduct extends StatelessWidget {
  const DetailProduct({Key? key}) : super(key: key);

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
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => CartPage()));
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
            body: SingleChildScrollView(
              controller: state.sc,
              child: Container(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 24, right: 24),
                      height: 160,
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
                              String img = state.images![itemIndex];
                              return Container(
                                  child: Image.asset(
                                img,
                                height: 160,
                                fit: BoxFit.fitHeight,
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
                                vertical: 0, horizontal: 4),
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
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height,
                        decoration: const BoxDecoration(
                            color: Color(0xffff485a),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50))),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.only(top: 24),
                          height: MediaQuery.of(context).size.height - 365,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50))),
                          child: SingleChildScrollView(
                            controller: state.sc,
                            child: Container(
                              margin:
                                  const EdgeInsets.only(left: 24, right: 24),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Tas Gucci",
                                          style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              color: Color(0xffF47623F),
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                                padding: EdgeInsets.only(
                                                    left: 8,
                                                    right: 8,
                                                    top: 2,
                                                    bottom: 2),
                                                decoration: BoxDecoration(
                                                  color: Color(0XFFDFAE1D),
                                                  borderRadius:
                                                      BorderRadius.circular(24),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "Barang Bekas",
                                                    style: GoogleFonts.poppins(
                                                        color: Colors.white,
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                )),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Container(
                                                padding: EdgeInsets.only(
                                                    left: 8,
                                                    right: 8,
                                                    top: 2,
                                                    bottom: 2),
                                                decoration: BoxDecoration(
                                                  color: Colors.blue[300],
                                                  borderRadius:
                                                      BorderRadius.circular(24),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "Stok 100",
                                                    style: GoogleFonts.poppins(
                                                        color: Colors.white,
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ))
                                          ],
                                        )
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                                                  fontSize: 13,
                                                  color: Colors.blue[300],
                                                  fontWeight: FontWeight.w500,
                                                  decoration: TextDecoration
                                                      .lineThrough),
                                            ),
                                            Text(
                                              "Rp ${rupiah(4500)}",
                                              style: GoogleFonts.inter(
                                                fontSize: 13,
                                                color: Colors.blue[300],
                                                fontWeight: FontWeight.w800,
                                              ),
                                            )
                                          ],
                                        ),
                                        Container(
                                            padding: EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                                top: 2,
                                                bottom: 2),
                                            decoration: BoxDecoration(
                                              color: Colors.blue,
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
                                      height: 16,
                                    ),
                                    Container(
                                      height: 1,
                                      color: Colors.grey[200],
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 40,
                                              height: 40,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                child: Image.asset(
                                                  "assets/images/profile.jpg",
                                                  width: 40,
                                                  height: 40,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 16,
                                            ),
                                            Text(
                                              "Eiger Store",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.blue[300],
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                              "5.0 | 200 Terjual",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 12,
                                                  color: Colors.blue[300],
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "Deskripsi",
                                      style: GoogleFonts.poppins(
                                          fontSize: 11,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Text(
                                          "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.",
                                          style: GoogleFonts.poppins(
                                              fontSize: 10,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400),
                                          textAlign: TextAlign.justify),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                      "Ulasan dan Penilaian",
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 30,
                                              height: 30,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                child: Image.asset(
                                                  "assets/images/profile2.jpg",
                                                  width: 30,
                                                  height: 30,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 16,
                                            ),
                                            Text(
                                              "Maude Hall",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 11,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              size: 16,
                                              color: Colors.orange,
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                              "5.0",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 10,
                                                  color: Colors.orange,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Text(
                                          "That's a fantastic new app feature. You and your team did an excellent job of incorporating user testing feedback.",
                                          style: GoogleFonts.poppins(
                                              fontSize: 8,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400),
                                          textAlign: TextAlign.justify),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 30,
                                              height: 30,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                child: Image.asset(
                                                  "assets/images/profile3.jpg",
                                                  width: 30,
                                                  height: 30,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 16,
                                            ),
                                            Text(
                                              "Ester Howard",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 11,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              size: 16,
                                              color: Colors.orange,
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                              "5.0",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 10,
                                                  color: Colors.orange,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Text(
                                          "That's a fantastic new app feature. You and your team did an excellent job of incorporating user testing feedback.",
                                          style: GoogleFonts.poppins(
                                              fontSize: 8,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400),
                                          textAlign: TextAlign.justify),
                                    ),
                                  ]),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
