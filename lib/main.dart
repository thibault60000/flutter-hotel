import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:hotels/calendar_page.dart';

const primaryColor = Color(0xFF54D3C2);

void main() {
  runApp(const MyApp());
}

// Class MY APP
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, title: "Booking", home: HomePage());
  }
}

// Class HOME PAGE
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(),
        body: SingleChildScrollView(
            child: Column(children: [
          const SearchSection(),
          HotelSection(),
        ])));
  }
}

// Class SEARCH SECTION
class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 160,
        color: Colors.grey[200],
        padding: const EdgeInsets.fromLTRB(10, 25, 10, 10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 4,
                            offset: const Offset(0, 3))
                      ]),
                  // Input Search
                  child: const TextField(
                    decoration: InputDecoration(
                        hintText: "Paris",
                        contentPadding: EdgeInsets.all(10),
                        border: InputBorder.none),
                  ),
                )),
                const SizedBox(width: 10),
                Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 4,
                            offset: const Offset(0, 4))
                      ],
                      borderRadius: const BorderRadius.all(Radius.circular(25)),
                    ),
                    // Button Search
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const CalendarPage();
                          }));
                        },
                        style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: primaryColor,
                            padding: const EdgeInsets.all(10)),
                        child: const Icon(Icons.search, size: 26)))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Choose date
                Container(
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Choisir date',
                            style: GoogleFonts.nunito(
                                color: Colors.grey, fontSize: 15)),
                        const SizedBox(height: 8),
                        Text('12 Déc - 22 Déc',
                            style: GoogleFonts.nunito(
                                color: Colors.black, fontSize: 17))
                      ],
                    )),
                // Rooms / Adults
                Container(
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Nb de pièces',
                            style: GoogleFonts.nunito(
                                color: Colors.grey, fontSize: 15)),
                        const SizedBox(height: 8),
                        Text('1 pièce - 2 Adultes',
                            style: GoogleFonts.nunito(
                                color: Colors.black, fontSize: 17))
                      ],
                    ))
              ],
            )
          ],
        ));
  }
}

// Class HOTEL SECTION
class HotelSection extends StatelessWidget {
  HotelSection({super.key});

  final List hotelList = [
    {
      "name": "Royal Hotel",
      "address": "Paris, France",
      "price": '100',
      "distance": 3,
      "review": 13,
      "image": "assets/images/hotel1.jpg"
    },
    {
      "name": "Ceasar Hotel",
      "address": "Paris, France",
      "price": '200',
      "distance": 4,
      "review": 8,
      "image": "assets/images/hotel2.jpg"
    },
    {
      "name": "Paris Hotel",
      "address": "Paris, France",
      "price": '300',
      "distance": 13,
      "review": 3,
      "image": "assets/images/hotel3.jpg"
    },
    {
      "name": "Grande Tower Hotel",
      "address": "Paris, France",
      "price": '400',
      "distance": 9,
      "review": 21,
      "image": "assets/images/hotel4.jpg"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: const EdgeInsets.all(10),
        // Columns
        child: Column(
          children: [
            Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Filtres
                    Text("4 hotels trouvés",
                        style: GoogleFonts.nunito(
                            color: Colors.black, fontSize: 15)),
                    Row(
                      children: [
                        Text('Filtres',
                            style: GoogleFonts.nunito(
                                color: Colors.black, fontSize: 15)),
                        const IconButton(
                            onPressed: null,
                            icon: Icon(Icons.filter_list_outlined,
                                color: primaryColor, size: 25))
                      ],
                    )
                  ],
                )),
            Column(
                children: hotelList.map((hotel) => HotelCard(hotel)).toList())
          ],
        ));
  }
}

// Class HOTEL CARD
class HotelCard extends StatelessWidget {
  final Map hotelData;

  const HotelCard(this.hotelData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 230,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(18)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade200,
                  spreadRadius: 4,
                  blurRadius: 6,
                  offset: const Offset(0, 3))
            ]),
        child: Column(
          children: [
            Container(
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18)),
                  image: DecorationImage(
                      image: AssetImage(hotelData['image']), fit: BoxFit.cover),
                ),
                child: Stack(
                  children: [
                    Positioned(
                        top: 5,
                        right: -15,
                        child: MaterialButton(
                            color: Colors.white,
                            shape: const CircleBorder(),
                            onPressed: () {},
                            child: const Icon(Icons.favorite_outline_rounded,
                                color: primaryColor, size: 20)))
                  ],
                )),
            Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(hotelData['name'],
                        style: GoogleFonts.nunito(
                            fontSize: 18, fontWeight: FontWeight.w800)),
                    Text(hotelData['price'] + '€/nuit',
                        style: GoogleFonts.nunito(
                            fontSize: 18, fontWeight: FontWeight.w800))
                  ],
                )),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(hotelData['address'],
                        style: GoogleFonts.nunito(
                            fontSize: 14,
                            color: Colors.grey[500],
                            fontWeight: FontWeight.w400)),
                    Row(
                      children: [
                        const Icon(Icons.place, color: primaryColor, size: 14),
                        Text('${hotelData['distance']}km',
                            style: GoogleFonts.nunito(
                                fontSize: 14,
                                color: Colors.grey[500],
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                    Container(
                        margin: const EdgeInsets.fromLTRB(10, 3, 10, 0),
                        child: Row(
                          children: [
                            Row(children: const [
                              Icon(Icons.star_rate,
                                  color: primaryColor, size: 14)
                            ]),
                            Row(children: const [
                              Icon(Icons.star_rate,
                                  color: primaryColor, size: 14)
                            ]),
                            Row(children: const [
                              Icon(Icons.star_rate,
                                  color: primaryColor, size: 14)
                            ]),
                            Row(children: const [
                              Icon(Icons.star_rate,
                                  color: primaryColor, size: 14)
                            ]),
                            Row(children: const [
                              Icon(Icons.star_rate,
                                  color: primaryColor, size: 14)
                            ]),
                            const SizedBox(width: 20),
                            Text('${hotelData['review']} avis',
                                style: GoogleFonts.nunito(
                                    fontSize: 14,
                                    color: Colors.grey[500],
                                    fontWeight: FontWeight.w400)),
                          ],
                        ))
                  ],
                )),
          ],
        ));
  }
}

// Class MY APP BAR
class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  State<MyAppBar> createState() => _MyAppBar();
}

class _MyAppBar extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.grey[800],
          size: 20,
        ),
        onPressed: null,
      ),
      title: Text("Explorer",
          style: GoogleFonts.nunito(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.w800)),
      actions: [
        IconButton(
          icon: Icon(
            Icons.favorite_outline_rounded,
            color: Colors.grey[800],
            size: 20,
          ),
          onPressed: null,
        ),
        IconButton(
          icon: Icon(
            Icons.place,
            color: Colors.grey[800],
            size: 20,
          ),
          onPressed: null,
        ),
      ],
      centerTitle: true,
      backgroundColor: Colors.white,
    );
  }
}
