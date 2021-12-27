import 'package:flutter/material.dart';
import 'package:umsukoas/size_config.dart';
import '../../../components/defaultButton.dart';
import 'package:umsukoas/constants.dart';
import 'welcomeContent.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> contentData = [
    {
      "title": "KOAS UMSU",
      "deskripsi": "Selamat datang di aplikasi KOAS UMSU",
      "image": "asset/lotties/welcome.json"
    },
    {
      "title": "PRESENSI",
      "deskripsi": "Melakukan presensi cepat dan mudah",
      "image": "asset/lotties/absen.json"
    },
    {
      "title": "LOG BOOK",
      "deskripsi": "Pencatatan log book lebih efektif & efisien",
      "image": "asset/lotties/doctor.json"
    },
    {
      "title": "PENJADWALAN",
      "deskripsi": "Penjadwalan kegiatan dengan notifikasi instan",
      "image": "asset/lotties/schedule.json"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: contentData.length,
                itemBuilder: (context, index) => WelcomeContent(
                  title: contentData[index]["title"],
                  deskripsi: contentData[index]["deskripsi"],
                  image: contentData[index]["image"],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                ),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        contentData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 3),
                    DefaultButton(
                        press: () {
                          Navigator.pushNamed(context, "/loginScreen");
                        },
                        text: "Lanjutkan"),
                    Spacer(),
                  ],
                ),
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
