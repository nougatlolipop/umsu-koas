import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:readmore/readmore.dart';
import 'package:umsukoas/components/loadingWidget.dart';
import 'package:umsukoas/restapi/api_services.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<dynamic> listBerita = new List<ListBerita>();
  APIService apiService;

  @override
  void initState() {
    apiService = new APIService();
    _getBerita();
    super.initState();
  }

  Future<void> _getBerita() async {
    await apiService.getBerita().then((value) {
      if (mounted) {
        setState(() {
          listBerita = value;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return listBerita.length > 0
        ? SingleChildScrollView(
            child: Column(
            children: [
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: listBerita.length,
                itemBuilder: (context, index) {
                  Map wppost = listBerita[index];
                  var imageURL = wppost['_embedded']['wp:featuredmedia'][0]
                          ['source_url']
                      .toString();
                  var author =
                      wppost['_embedded']['author'][0]['name'].toString();
                  return ListBerita(
                    title: wppost['title']['rendered'].toString(),
                    isi: wppost['excerpt']['rendered'].toString(),
                    createBy: author,
                    date: wppost['date'].toString(),
                    img: imageURL,
                    press: () {
                      // Navigator.pushNamed(
                      //   context,
                      //   BacaScreen.routeName,
                      //   arguments: ParamString(
                      //       wppost['content']['rendered'].toString(),
                      //       wppost['title']['rendered'].toString(),
                      //       wppost['_embedded']['author'][0]['name'].toString(),
                      //       wppost['date'].toString()),
                      // );
                    },
                  );
                },
              ),
            ],
          ))
        : Container(
            height: SizeConfig.screenHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LodingWidget(),
              ],
            ),
          );
  }
}

class ListBerita extends StatelessWidget {
  String title;
  String isi;
  String createBy;
  String date;
  String img;
  GestureTapCallback press;
  ListBerita(
      {this.title, this.isi, this.createBy, this.date, this.img, this.press});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.9,
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
                height: SizeConfig.screenWidth * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage('asset/images/circle2.png'),
                    fit: BoxFit.cover,
                  ),
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
                    child: Row(
                      children: [
                        Text(
                          'By : ' + createBy + ' ',
                        ),
                        Icon(
                          MdiIcons.fromString('clock-outline'),
                          size: 15,
                        ),
                        Text(
                          " ${date.substring(0, 10)}",
                          style: TextStyle(
                              fontSize: SizeConfig.screenWidth * 0.035),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(
                vertical: SizeConfig.screenWidth * 0.015,
                horizontal: SizeConfig.screenWidth * 0.02),
            child: Text(
              title,
              style: TextStyle(
                  fontFamily: 'mulish',
                  fontSize: SizeConfig.screenWidth * 0.04,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              margin: EdgeInsets.only(
                  left: SizeConfig.screenWidth * 0.02,
                  right: SizeConfig.screenWidth * 0.02,
                  bottom: SizeConfig.screenWidth * 0.02),
              child: ReadMoreText(
                parse(isi).documentElement.text,
                trimLines: 3,
                trimMode: TrimMode.Line,
                style: TextStyle(color: Colors.black, fontFamily: 'mulish'),
              )),
        ],
      ),
    );
  }
}

Color _getColorFromHex(String hexColor) {
  hexColor = hexColor.replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF" + hexColor;
  }
  if (hexColor.length == 8) {
    return Color(int.parse("0x$hexColor"));
  }
}
