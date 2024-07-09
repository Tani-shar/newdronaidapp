import 'package:carousel_slider/carousel_slider.dart';
import 'package:dronaid_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  int _currentCarouselImage = 0;


  final List<String> imgList = [
    'assets/asset1.jpg',
    'assets/about_us.jpg',
    'assets/drone_hex.jpeg',
    'assets/minister_interaction.png'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: NavigationBar(
      //   destinations: [
      //     NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
      //     NavigationDestination(icon: Icon(Icons.pin_drop), label: 'Supplies'),
      //     NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
      //   ],
      //   onDestinationSelected: (int index) {
      //     setState(() {
      //       currentpage = index;
      //     });
      //   },
      //   selectedIndex: currentpage,
      // ),
      body: Material(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 1.6,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 1.8,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: dronaidblue,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(200),
                      ),
                    ),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          print('object');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(color: secondaryColor, blurRadius: 10.0)
                            ],
                            color: primaryColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          child: Icon(
                            Icons.local_hospital,
                            size: 200,
                            color: dronaidblue,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 200, // Specify the desired width
                      height: 200, // Specify the desired height
                      child: Image.asset(
                        'assets/logo_nobg.png',
                        fit: BoxFit
                            .contain, // Adjust the fit based on your needs
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height / 2.245,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: dronaidblue,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(80),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height / 2.245,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(
                    top: 40,
                    bottom: 40,
                  ),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(80),
                        topRight: Radius.circular(80)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 30),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Updates',
                            style: GoogleFonts.actor(
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CarouselSlider(
                        items: imgList
                            .map(
                              (e) => Center(
                                child: Container(
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                      color: secondaryColor,
                                      blurRadius: 40,
                                    ),
                                  ]),
                                  child: ClipRRect(
                                    child: Image.asset(e),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        options: CarouselOptions(
                            initialPage: 0,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 2),
                            enlargeCenterPage: true,
                            onPageChanged: (value, _) {
                              setState(() {
                                _currentCarouselImage = value;
                              });
                            }),
                      ),
                      Container(
                        height: 10,
                      ),
                      buildCarouselIndicator(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildCarouselIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < imgList.length; i++)
          Container(
            margin: EdgeInsets.all(5),
            height: i == _currentCarouselImage ? 7 : 5,
            width: i == _currentCarouselImage ? 7 : 5,
            decoration: BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
            ),
          ),
      ],
    );
  }
}
