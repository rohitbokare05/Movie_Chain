// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginPage();
  }
}

class ConnectToMetamask extends StatelessWidget {
  const ConnectToMetamask({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1280,
      height: 832,
      padding: const EdgeInsets.symmetric(horizontal: 338),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.00, -1.00),
          end: Alignment(0, 1),
          colors: [Color(0xFF2E889A), Color(0xFF45CBD4)],
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Colors.white.withOpacity(0),
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 604,
            height: 231,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 604,
                      height: 231,
                      decoration: ShapeDecoration(
                        color: Color(0x7FB7B7B7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 56,
                    top: 35,
                    child: Text(
                      'Connect to MetaMask to continue',
                      style: TextStyle(
                        color: Color(0xFF0C202B),
                        fontSize: 30,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 222,
                    top: 163.52,
                    child: Container(
                      width: 159.42,
                      height: 46.19,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 159.42,
                              height: 46.19,
                              decoration: ShapeDecoration(
                                color: Color(0xFF023E8A),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 30,
                            top: 1.77,
                            child: Text(
                              'Connect',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontFamily: 'Literata',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 271,
                    top: 90,
                    child: Container(
                      width: 62,
                      height: 54,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage("fox.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RunningShows extends StatelessWidget {
  const RunningShows({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 122, 202, 220),
      width: double.infinity,
      height: double.infinity,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 99,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(1.00, -0.00),
                    end: Alignment(-1, 0),
                    colors: [
                      Color.fromARGB(255, 138, 225, 245),
                      Color.fromARGB(255, 15, 81, 96)
                    ],
                  ),
                  shape: RoundedRectangleBorder(side: BorderSide(width: 1)),
                ),
                child: SizedBox(
                  width: 528,
                  height: 62,
                  child: Text(
                    'Profile',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 64,
                      fontFamily: 'Abhaya Libre',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: 139,
                height: 139,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: NetworkImage("assets/Profile.png"),
                    fit: BoxFit.fill,
                  ),
                  shape: OvalBorder(),
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: 500,
                height: 15,
                child: Text(
                  'Account Address: 0x295F3804967aDe1Bb42b7D64d34e05b85918538a',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Abhaya Libre',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
              SizedBox(height: 55),
              Container(
                width: 368,
                height: 55,
                decoration: ShapeDecoration(
                  color: Color(0xFF328CCC),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: SizedBox(
                  width: 307,
                  height: 42,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 14.0),
                    child: Text(
                      'My Tickets',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Abhaya Libre',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 33),
              ListOfShows(),
            ],
          ),
        ),
      ),
    );
  }
}

class ListOfShows extends StatelessWidget {
  const ListOfShows({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 66),
        TicketDetails(),
        SizedBox(width: 40),
        TicketDetails(),
        SizedBox(width: 40),
        TicketDetails(),
        SizedBox(width: 40),
        TicketDetails(),
        SizedBox(width: 40),
        TicketDetails(),
      ],
    );
  }
}

class TicketDetails extends StatelessWidget {
  const TicketDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 233,
      height: 341,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          image: NetworkImage("assets/doctorstrange.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 239),
          Container(
            width: 234,
            height: 102,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(
                begin: Alignment(-0.00, -1.00),
                end: Alignment(0, 1),
                colors: [Color(0x006C6C6C), Colors.black],
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  width: 222.55,
                  height: 32.09,
                  child: Text(
                    'Doctor Strange',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFD4FBFB),
                      fontSize: 24,
                      fontFamily: 'Abhaya Libre',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
                SizedBox(
                  width: 150,
                  height: 15,
                  child: Text(
                    'Ticket ID: AB123',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF87F4E7),
                      fontSize: 14,
                      fontFamily: 'Abhaya Libre',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                SizedBox(
                  width: 170,
                  height: 40,
                  child: Column(
                    children: [
                      Text(
                        '15:00 15th December, 2024',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF99E9FA),
                          fontSize: 12,
                          fontFamily: 'Abhaya Libre',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      SizedBox(height: 4),
                      Container(
                        width: 80,
                        height: 21.54,
                        decoration: ShapeDecoration(
                          color: Color(0xFFA61414),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: SizedBox(
                          width: 51.47,
                          height: 10,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text(
                              'Cancel Ticket',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 9,
                                fontFamily: 'Abhaya Libre',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class List_Of_Movies extends StatelessWidget {
  const List_Of_Movies({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color:
            Color.fromARGB(255, 132, 208, 204).withOpacity(0.5600000023841858),
      ),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 1550,
                height: 99,
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 73, 226, 209)),
              ),
            ),
            OnGoingShows(),
            MovieDetail(tops: 167, lefts: 124),
            MovieDetail(tops: 167, lefts: 474),
            MovieDetail(tops: 167, lefts: 824),
            MovieDetail(tops: 167, lefts: 1174),
            MovieDetail(tops: 620, lefts: 124),
            MovieDetail(tops: 620, lefts: 474),
            MovieDetail(tops: 620, lefts: 824),
            MovieDetail(tops: 620, lefts: 1174),
          ],
        ),
      ),
    );
  }
}

class MovieDetail extends StatelessWidget {
  final double tops;
  final double lefts;
  MovieDetail({
    super.key,
    required this.tops,
    required this.lefts,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: lefts,
      top: tops,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
        width: 290,
        height: 393.53,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 290,
                height: 393.53,
                decoration: ShapeDecoration(
                  color: Color(0xFFD9D9D9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(56),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: -1.24,
              child: Container(
                width: 289.48,
                height: 423.65,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("assets/doctorstrange.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              left: -1.24,
              top: 267.11,
              child: Container(
                width: 290.72,
                height: 126.72,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(-0.00, -1.00),
                    end: Alignment(0, 1),
                    colors: [Color(0x006C6C6C), Colors.black],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 7.45,
              top: 269.60,
              child: SizedBox(
                width: 276.50,
                height: 39.87,
                child: Text(
                  'Doctor Strange',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFD4FBFB),
                    fontSize: 24,
                    fontFamily: 'Abhaya Libre',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 50.94,
              top: 300.60,
              child: SizedBox(
                width: 179.95,
                height: 41.60,
                child: Text(
                  '15:00 15th December, 2024',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF99E9FA),
                    fontSize: 12,
                    fontFamily: 'Abhaya Libre',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 99.39,
              top: 344.14,
              child: Container(
                width: 80.76,
                height: 26.76,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 80.76,
                        height: 26.76,
                        decoration: ShapeDecoration(
                          color: Color(0xFF14A623),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 8.12,
                      top: 7,
                      child: SizedBox(
                        width: 63.95,
                        height: 10,
                        child: Text(
                          'Book Ticket ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontFamily: 'Abhaya Libre',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 83.24,
              top: 319.35,
              child: SizedBox(
                width: 123.46,
                height: 15,
                child: Text(
                  'Ticket ID: AB123',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF87F4E7),
                    fontSize: 14,
                    fontFamily: 'Abhaya Libre',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnGoingShows extends StatelessWidget {
  const OnGoingShows({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 500,
      top: 19,
      child: Text(
        'On Going Shows',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 64,
          fontFamily: 'Abhaya Libre',
          fontWeight: FontWeight.w700,
          height: 0,
        ),
      ),
    );
  }
}

class Seating_Arrangement_Page extends StatelessWidget {
  const Seating_Arrangement_Page({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.only(
        top: 10,
        left: 9,
        right: 55,
        bottom: 28,
      ),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Color(0xFFB6E4EE),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Colors.white.withOpacity(0),
          ),
        ),
      ),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 1216,
                height: 794,
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 60,
                        top: 1,
                        child: Container(
                          width: 1142,
                          height: 43,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 1142,
                                height: 43,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 484,
                                        height: 43,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              left: 0,
                                              top: 0,
                                              child: SizedBox(
                                                width: 484,
                                                child: Text(
                                                  'Selected Ticket ',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 36,
                                                    fontFamily: 'Itim',
                                                    fontWeight: FontWeight.w400,
                                                    height: 0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 90,
                                              top: 8,
                                              child: Container(
                                                width: 26,
                                                height: 27,
                                                decoration: ShapeDecoration(
                                                  color: Color(0xFF10424D),
                                                  shape: OvalBorder(
                                                      side:
                                                          BorderSide(width: 1)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 352,
                                      top: 0,
                                      child: Container(
                                        width: 484,
                                        height: 43,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              left: 0,
                                              top: 0,
                                              child: SizedBox(
                                                width: 484,
                                                child: Text(
                                                  'Remaining Ticket ',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 36,
                                                    fontFamily: 'Itim',
                                                    fontWeight: FontWeight.w400,
                                                    height: 0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 76,
                                              top: 7,
                                              child: Container(
                                                width: 26,
                                                height: 27,
                                                decoration: ShapeDecoration(
                                                  color: Color(0xFF4DBAD2),
                                                  shape: OvalBorder(
                                                      side:
                                                          BorderSide(width: 1)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 658,
                                      top: 0,
                                      child: Container(
                                        width: 484,
                                        height: 43,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              left: 0,
                                              top: 0,
                                              child: SizedBox(
                                                width: 484,
                                                child: Text(
                                                  'Sold Out  ',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 36,
                                                    fontFamily: 'Itim',
                                                    fontWeight: FontWeight.w400,
                                                    height: 0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 137,
                                              top: 8,
                                              child: Container(
                                                width: 26,
                                                height: 27,
                                                decoration: ShapeDecoration(
                                                  color: Color(0xFF2B4851),
                                                  shape: OvalBorder(
                                                      side:
                                                          BorderSide(width: 1)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 45,
                          height: 45,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 45,
                                  height: 45,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFF1E454A),
                                    shape: OvalBorder(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 504,
                        top: 751,
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 256,
                            height: 43,
                            padding: const EdgeInsets.symmetric(horizontal: 36),
                            decoration: ShapeDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(1.00, -0.03),
                                end: Alignment(-1, 0.03),
                                colors: [Color(0xFF6E96B2), Color(0xFF2F404C)],
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Book Ticket',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFFB7E5EF),
                                    fontSize: 24,
                                    fontFamily: 'Itim',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Seat_Arrangement(),
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
}

class Seat_Arrangement extends StatelessWidget {
  const Seat_Arrangement({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 47,
      top: 67,
      child: Container(
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black, width: 4)),
        width: 1169,
        height: 600,
        child: Stack(
          children: [
            Positioned(
              left: 60,
              top: 43.75,
              child: Container(
                  width: 1100,
                  height: 481.29,
                  child: Column(
                    children: [
                      Seat_Row(),
                      SizedBox(height: 20),
                      Seat_Row(),
                      SizedBox(height: 20),
                      Seat_Row(),
                      SizedBox(height: 20),
                      Seat_Row(),
                      SizedBox(height: 20),
                      Seat_Row(),
                      SizedBox(height: 20),
                      Seat_Row(),
                      SizedBox(height: 20),
                      Seat_Row(),
                      SizedBox(height: 30),
                      Container(
                        width: 600,
                        height: 5,
                        color: Colors.black,
                      )
                    ],
                  )),
            ),
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 1169,
                height: 660,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    ),
                    borderRadius: BorderRadius.circular(1),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Seat_Row extends StatelessWidget {
  const Seat_Row({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        New_Seat(),
        const SizedBox(width: 44),
        New_Seat(),
        const SizedBox(width: 44),
        New_Seat(),
        const SizedBox(width: 44),
        New_Seat(),
        const SizedBox(width: 44),
        New_Seat(),
        const SizedBox(width: 44),
        New_Seat(),
        const SizedBox(width: 44),
        New_Seat(),
        const SizedBox(width: 44),
        New_Seat(),
        const SizedBox(width: 44),
        New_Seat(),
        const SizedBox(width: 44),
        New_Seat(),
        const SizedBox(width: 44),
        New_Seat(),
        const SizedBox(width: 44),
        New_Seat(),
        const SizedBox(width: 44),
      ],
    );
  }
}

class New_Seat extends StatelessWidget {
  const New_Seat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 45.61,
      decoration: ShapeDecoration(
        color: Color(0xFF4DB9D1),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

class Add_Movie_Page extends StatefulWidget {
  Add_Movie_Page({
    super.key,
  });

  final TextEditingController _Name = TextEditingController();

  final TextEditingController _Time = TextEditingController();

  @override
  State<Add_Movie_Page> createState() => _Add_Movie_PageState();
}

class _Add_Movie_PageState extends State<Add_Movie_Page> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   title: const Text('Extend Image Example'),
        // ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.00, -1.00),
              end: Alignment(0, 1),
              colors: [Color(0xFF107C94), Color(0xFFB7E5EF)],
            ),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: Colors.white.withOpacity(0),
              ),
            ),
          ),
          child: Stack(
            children: [
              Center(
                child: Container(
                  width: 408.66,
                  height: 431,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 408.66,
                          height: 431,
                          decoration: ShapeDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(0.60, -0.80),
                              end: Alignment(-0.6, 0.8),
                              colors: [Color(0xFF737373), Color(0xFF0F234E)],
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(73),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 49.31,
                        top: 52.12,
                        child: Container(
                          width: 292.35,
                          height: 280.44,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 73.95,
                                top: 0,
                                child: SizedBox(
                                  width: 145.60,
                                  height: 38.05,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      'Add Movie',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 30,
                                        fontFamily: 'Love Ya Like A Sister',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 1.16,
                                top: 76.93,
                                child: Container(
                                  width: 291.19,
                                  height: 37.23,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 14.89,
                                        top: 9.93,
                                        child: Container(
                                          width: 250,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.white),
                                          child: TextField(
                                            controller: widget._Name,
                                            decoration: InputDecoration(
                                              fillColor: Colors.white,
                                              border: OutlineInputBorder(),
                                              labelText: 'Name',
                                            ),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontFamily: 'Italiana',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 1.16,
                                top: 76.93,
                                child: Container(
                                  width: 291.19,
                                  height: 37.23,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 14.89,
                                        top: 9.93,
                                        child: Container(
                                          width: 250,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.white),
                                          child: TextField(
                                            controller: widget._Name,
                                            decoration: InputDecoration(
                                              fillColor: Colors.white,
                                              border: OutlineInputBorder(),
                                              labelText: 'Name',
                                            ),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontFamily: 'Italiana',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 1.16,
                                top: 120,
                                child: Container(
                                  width: 291.19,
                                  height: 37.23,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 14.89,
                                        top: 9.93,
                                        child: Container(
                                          width: 250,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.white),
                                          child: TextField(
                                            controller: widget._Time,
                                            decoration: InputDecoration(
                                              fillColor: Colors.white,
                                              border: OutlineInputBorder(),
                                              labelText: 'Time',
                                            ),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontFamily: 'Italiana',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // Positioned(
                              //   left: 0,
                              //   top: 121.66,
                              //   child: Container(
                              //     width: 291.19,
                              //     height: 37.23,
                              //     child: Stack(
                              //       children: [
                              //         Positioned(
                              //           left: 15.58,
                              //           top: 12.15,
                              //           child: SizedBox(
                              //             width: 173.72,
                              //             height: 15.72,
                              //             child: Text(
                              //               'Time',
                              //               style: TextStyle(
                              //                 color: Colors.black,
                              //                 fontSize: 15,
                              //                 fontFamily: 'Italiana',
                              //                 fontWeight: FontWeight.w400,
                              //                 height: 0,
                              //               ),
                              //             ),
                              //           ),
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              Positioned(
                                left: 0.69,
                                top: 173.88,
                                child: Container(
                                  width: 400.19,
                                  height: 95.72,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 14.89,
                                        top: 9.93,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          width: 250,
                                          height: 30,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Text(
                                              'Image',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontFamily: 'Italiana',
                                                fontWeight: FontWeight.w400,
                                                height: 0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 70,
                                        left: 35,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: Color(0xFFB7E5EF),
                                          ),
                                          width: 250,
                                          height: 60,
                                          child: Text(
                                            'Add',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontFamily: 'Italiana',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Container(width: 1280, height: 109),
              ),
              Positioned(
                left: 600,
                top: 16,
                child: Text(
                  'Add Movie',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 64,
                    fontFamily: 'Abhaya Libre',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage("assets/loginpage.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 50, top: 20),
              child: Container(
                width: 80,
                height: 80,
                decoration: const ShapeDecoration(
                  image: DecorationImage(
                    image: NetworkImage("assets/Profile.png"),
                  ),
                  shape: OvalBorder(),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 50),
            child: Align(
              alignment: Alignment.centerRight,
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: SizedBox(
                  width: 489,
                  height: 156,
                  child: Text(
                    'MovieChain',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 80,
                      fontFamily: 'Inspiration',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 150),
              child: Container(
                width: 332,
                height: 181,
                decoration: ShapeDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment(-1.00, -0.00),
                    end: Alignment(1, 0),
                    colors: [Color(0xFF4FC7F3), Color(0xFF012137)],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(21),
                  ),
                ),
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Container(
                        width: 270,
                        height: 50,
                        decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            color: const Color.fromARGB(255, 130, 192, 215)),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Add_Movie_Page()));
                            },
                            child: SizedBox(
                              width: 173.72,
                              height: 20,
                              child: Text(
                                'Add Movie Show',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'Irish Grover',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        width: 270,
                        height: 50,
                        decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            color: const Color.fromARGB(255, 130, 192, 215)),
                        child: const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: SizedBox(
                            width: 173.72,
                            height: 15.72,
                            child: Text(
                              'Ongoing Movie Shows',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'Irish Grover',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 230.0, top: 30),
              child: Container(
                width: 158,
                height: 27,
                decoration: ShapeDecoration(
                  color: Color(0xFF0A334B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(top: 6.0),
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: SizedBox(
                      width: 142,
                      height: 21,
                      child: Text(
                        'Connected',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFD4FBFB),
                          fontSize: 13,
                          fontFamily: 'Laila',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SignUp extends StatelessWidget {
  const SignUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage("assets/loginpage.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 50, top: 20),
              child: Container(
                width: 80,
                height: 80,
                decoration: const ShapeDecoration(
                  image: DecorationImage(
                    image: NetworkImage("assets/Profile.png"),
                  ),
                  shape: OvalBorder(),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 50),
            child: Align(
              alignment: Alignment.centerRight,
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: SizedBox(
                  width: 489,
                  height: 156,
                  child: Text(
                    'MovieChain',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 80,
                      fontFamily: 'Inspiration',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 150),
              child: Container(
                width: 332,
                height: 181,
                decoration: ShapeDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment(-1.00, -0.00),
                    end: Alignment(1, 0),
                    colors: [Color(0xFF4FC7F3), Color(0xFF012137)],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(21),
                  ),
                ),
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Container(
                        width: 270,
                        height: 50,
                        decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            color: const Color.fromARGB(255, 130, 192, 215)),
                        child: GestureDetector(
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: SizedBox(
                              width: 173.72,
                              height: 15.72,
                              child: Text(
                                'Add Movie Show',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'Irish Grover',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        width: 270,
                        height: 50,
                        decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            color: const Color.fromARGB(255, 130, 192, 215)),
                        child: const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: SizedBox(
                            width: 173.72,
                            height: 15.72,
                            child: Text(
                              'Ongoing Movie Shows',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'Irish Grover',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 230.0, top: 30),
              child: Container(
                width: 158,
                height: 27,
                decoration: ShapeDecoration(
                  color: Color(0xFF0A334B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(top: 6.0),
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: SizedBox(
                      width: 142,
                      height: 21,
                      child: Text(
                        'Connect To Metamask',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFD4FBFB),
                          fontSize: 13,
                          fontFamily: 'Laila',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
