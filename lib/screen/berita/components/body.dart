import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String _formatDateTime(DateTime dateTime) {
    return DateFormat('dd MMMM yyyy HH:mm:ss').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          beritaCard(screenWidth),
          beritaCard(screenWidth),
          beritaCard(screenWidth),
          beritaCard(screenWidth),
        ],
      ),
    );
  }

  Container beritaCard(double screenWidth) {
    return Container(
      width: screenWidth * 0.9,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: screenWidth * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage('asset/images/circle2.png'),
                      fit: BoxFit.cover),
                ),
              ),
              Positioned(
                  left: 10,
                  bottom: 7,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "${_formatDateTime(DateTime.now())}",
                      style: TextStyle(fontSize: screenWidth * 0.035),
                    ),
                  )),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(
                vertical: screenWidth * 0.015, horizontal: screenWidth * 0.02),
            child: Text(
              "toShow.heading",
              style: TextStyle(
                  fontFamily: 'mulish',
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              margin: EdgeInsets.only(
                  left: screenWidth * 0.02,
                  right: screenWidth * 0.02,
                  bottom: screenWidth * 0.02),
              child: ReadMoreText(
                'Id commodo occaecat sit cillum ad duis adipisicing duis cillum voluptate veniam. Occaecat eiusmod tempor Lorem non exercitation ipsum occaecat officia culpa quis. Excepteur commodo culpa ad culpa sunt quis elit duis sunt. Ipsum occaecat magna ex sit dolore consectetur amet nulla consequat officia dolor. Tempor quis minim ea veniam duis in proident proident aute eu amet laborum.Laboris amet et proident ea. Amet anim labore aliqua esse aliquip culpa ea consectetur. Minim excepteur ea Lorem adipisicing dolore aliqua do fugiat. Irure occaecat culpa et est ut cupidatat. Labore esse do do exercitation minim proident duis magna sit excepteur. Laborum exercitation ut irure minim cillum. Incididunt irure aliquip magna sit eiusmod proident sunt ut laborum esse nisi sint incididunt consequat.Sint aliqua nulla tempor in. Velit veniam et ad anim. Est pariatur consectetur esse irure consequat.',
                trimLines: 3,
                trimMode: TrimMode.Line,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'mulish',
                    fontWeight: FontWeight.w500),
              )),
        ],
      ),
    );
  }
}
