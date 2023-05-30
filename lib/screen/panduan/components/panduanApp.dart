import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:umsukoas/components/loadingWidget.dart';
import 'package:umsukoas/restapi/api_services.dart';

import '../../../constants.dart';
import 'contentPanduanApp.dart';
import '../../../models/model_panduan_app.dart' as panduanModel;

class PanduanApp extends StatefulWidget {
  @override
  State<PanduanApp> createState() => PanduanAppState();
}

class PanduanAppState extends State<PanduanApp> {
  int currentPage = 0;
  APIService apiService;

  @override
  void initState() {
    apiService = new APIService();
    if (mounted) return;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _panduanList();
  }

  Widget _panduanList() {
    return new FutureBuilder(
      future: apiService.getPanduanApp(),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<panduanModel.PanduanApp>> model,
      ) {
        if (model.hasData) {
          return _buildPanduanAppList(model.data);
        }

        return Container(
          height: 50,
          child: LodingWidget(),
        );
      },
    );
  }

  Widget _buildPanduanAppList(List<panduanModel.PanduanApp> panduan) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              viewportFraction: 1,
              onPageChanged: (value, reason) {
                if (mounted) {
                  setState(() {
                    currentPage = value;
                  });
                }
              },
            ),
            items: panduan.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return ContentPanduanApp(
                    title: i.panduanNama,
                    press: () {
                      Navigator.pushNamed(
                        context,
                        '/lihatPanduanAppScreen',
                        arguments: Params(i.panduanFile),
                      );
                      // print(i.panduanFile);
                    },
                  );
                },
              );
            }).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              panduan.length,
              (index) => buildDot(index: index),
            ),
          ),
        ],
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

class Params {
  final String filePdf;
  Params(this.filePdf);
}
