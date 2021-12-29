import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:umsukoas/components/loadingWidget.dart';
import 'package:umsukoas/restapi/api_services.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'contentAnnouncement.dart';
import '../../../models/model_announcement.dart' as announcementModel;

class Announcement extends StatefulWidget {
  @override
  State<Announcement> createState() => _AnnouncementState();
}

class _AnnouncementState extends State<Announcement> {
  int currentPage = 0;
  APIService apiService;

  @override
  void initState() {
    apiService = new APIService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _announcementsList();
  }

  Widget _announcementsList() {
    return new FutureBuilder(
      future: apiService.getAnnouncements(),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<announcementModel.Announcement>> model,
      ) {
        if (model.hasData) {
          return _buildAnouncementsList(model.data);
        }

        return Container(
          height: 50,
          child: LodingWidget(),
        );
      },
    );
  }

  Widget _buildAnouncementsList(
      List<announcementModel.Announcement> announcements) {
    return Container(
      width: getProportionateScreenWidth(313),
      height: getProportionateScreenWidth(120),
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
                height: getProportionateScreenWidth(100),
                onPageChanged: (value, reason) {
                  setState(() {
                    currentPage = value;
                  });
                },
              ),
              items: announcements.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return ContentAnnouncement(
                      title: i.pengumumanJudul,
                      announcement: i.pengumumanIsi,
                    );
                  },
                );
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                announcements.length,
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
