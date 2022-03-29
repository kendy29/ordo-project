import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFCF8F8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
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
                  onPressed: () {},
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
              "Check out",
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.blue[300],
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 24, right: 24),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int i) {
                    return Slidable(
                        // Specify a key if the Slidable is dismissible.
                        key: const ValueKey(0),

                        // The start action pane is the one at the left or the top side.
                        startActionPane: ActionPane(
                          dismissible: DismissiblePane(
                            onDismissed: () {},
                          ),
                          motion: ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) async {},
                              foregroundColor: Color(0xFFFE4A49),
                              backgroundColor: Colors.white,
                              icon: Icons.delete,
                            ),
                          ],
                        ),
                        // The end action pane is the one at the right or the bottom side.
                        endActionPane: ActionPane(
                          dismissible: DismissiblePane(
                            onDismissed: () {},
                          ),
                          motion: ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) async {},
                             foregroundColor: Color(0xFFFE4A49),
                              backgroundColor: Colors.white,
                              icon: Icons.delete,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 80,
                              padding: EdgeInsets.all(8),
                              margin: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16)),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/images/banner1.png",
                                    width: 50,
                                    height: 50,
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 50,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  146,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Tas Gucci",
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 14,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w700),
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
                                                            BorderRadius
                                                                .circular(24),
                                                      ),
                                                      child: Center(
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              Icons.remove,
                                                              color:
                                                                  Colors.white,
                                                              size: 16,
                                                            ),
                                                            Text(
                                                              " 2 ",
                                                              style: GoogleFonts.poppins(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                            Icon(
                                                              Icons.add,
                                                              color:
                                                                  Colors.white,
                                                              size: 16,
                                                            ),
                                                          ],
                                                        ),
                                                      ))
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  146,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Rp 75.000",
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 12,
                                                        color: Colors.blue[300],
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  Container(
                                                      padding: EdgeInsets.only(
                                                          left: 10,
                                                          right: 10,
                                                          top: 2,
                                                          bottom: 2),
                                                      decoration: BoxDecoration(
                                                        color: Colors.blue[300],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24),
                                                      ),
                                                      child: Center(
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              Icons.edit,
                                                              color:
                                                                  Colors.white,
                                                              size: 16,
                                                            ),
                                                            SizedBox(
                                                              width: 4,
                                                            ),
                                                            Text(
                                                              "Catatan",
                                                              style: GoogleFonts.poppins(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          ],
                                                        ),
                                                      ))
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width,
                                height: 105,
                                padding: EdgeInsets.all(8),
                                margin:
                                    EdgeInsets.only(top: 4, left: 8, right: 8),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Catatan Item",
                                      style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 65,
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 0.5, color: Colors.black45),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: TextField(
                                          style: GoogleFonts.poppins(
                                              fontSize: 10,
                                              color: Color(0xff010101)
                                                  .withOpacity(0.2)),
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText:
                                                  "Cari dengan mengetik barang",
                                              hintStyle: GoogleFonts.poppins(
                                                  fontSize: 10,
                                                  color: Color(0xff010101)
                                                      .withOpacity(0.2)))),
                                    ),
                                  ],
                                )),
                            SizedBox(
                              height: 8,
                            ),
                          ],
                        ));
                  }),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Catatan Pesanan",
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 65,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: Colors.black45),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                        style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: Color(0xff010101).withOpacity(0.2)),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Klik disini",
                            hintStyle: GoogleFonts.poppins(
                                fontSize: 10,
                                color: Color(0xff010101).withOpacity(0.2)))),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Catatan Pesanan",
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int i) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Tas Gucci",
                                style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "(Qty. 1)",
                                style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Text(
                            "Rp 75.000",
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      );
                    })),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Ongkos Kirim",
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  "Rp 75.000",
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Container(
              height: 0.5,
              color: Colors.black45,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Sub Total",
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "Rp 75.000",
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Waktu Pengantaran",
                        style: GoogleFonts.poppins(fontSize: 14)),
                    Icon(Icons.keyboard_arrow_right)
                  ],
                ),
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue[300]!),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                            side: BorderSide(color: Colors.red)))),
                onPressed: () => null),
            SizedBox(
              height: 8,
            ),
            ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Alamat Pengiriman",
                        style: GoogleFonts.poppins(fontSize: 14)),
                    Icon(Icons.keyboard_arrow_right)
                  ],
                ),
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue[300]!),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                            side: BorderSide(color: Colors.red)))),
                onPressed: () => null),
            SizedBox(
              height: 16,
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                height: 80,
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)),
                child: Center(
                  child: Text(
                    "Tolong pastikan semua pesanan anda sudah benar dan tidak kurang.",
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                )),
            SizedBox(
              height: 8,
            ),
            ElevatedButton(
                child: Center(
                  child: Text("Bayar Sekarang".toUpperCase(),
                      style: GoogleFonts.poppins(fontSize: 18)),
                ),
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue[300]!),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                            side: BorderSide(color: Colors.red)))),
                onPressed: () => null),
          ],
        ),
      ),
    );
  }
}
