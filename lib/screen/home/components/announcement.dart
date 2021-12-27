import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'contentAnnouncement.dart';

class Announcement extends StatefulWidget {
  @override
  State<Announcement> createState() => _AnnouncementState();
}

class _AnnouncementState extends State<Announcement> {
  int currentPage = 0;
  List<Map<String, String>> contentData = [
    {
      "title": "HILIH",
      "announcement":
          "Kini melakukan absensi bisa dilakukan hanya dengan satu kali klik didalam aplikasi, kini melakukan absensi bisa dilakukan hanya dengan satu kali klik didalam aplikasi",
    },
    {
      "title": "KOAS UMSU",
      "announcement":
          "Aplikasi ini diperuntukan kepada pada dokter muda di UMSU",
    },
    {
      "title": "PRESENSI",
      "announcement":
          "Kini melakukan absensi bisa dilakukan hanya dengan satu kali klik didalam aplikasi, kini melakukan absensi bisa dilakukan hanya dengan satu kali klik didalam aplikasi",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(313),
      height: getProportionateScreenWidth(100),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            offset: Offset(3, 3),
            blurRadius: 10,
            color: Colors.black.withOpacity(0.16),
            spreadRadius: -2,
          )
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                viewportFraction: 1,
                height: getProportionateScreenWidth(80),
                onPageChanged: (value, reason) {
                  setState(() {
                    currentPage = value;
                  });
                },
              ),
              items: contentData.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return ContentAnnouncement(
                      title: i['title'],
                      announcement: i['announcement'],
                    );
                  },
                );
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                contentData.length,
                (index) => buildDot(index: index),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
