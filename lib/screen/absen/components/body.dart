import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:umsukoas/components/loadingWidget.dart';
import 'package:umsukoas/constants.dart';
import 'package:umsukoas/models/model_myjadwal.dart';
import 'package:umsukoas/restapi/api_services.dart';
import '../../../size_config.dart';
import 'absenHeader.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  APIService apiService;

  @override
  void initState() {
    apiService = new APIService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AbsenHeader(),
        SizedBox(height: getProportionateScreenHeight(55)),
        FutureBuilder(
          future: apiService.getMyJadwal('1908320001'),
          builder: (
            BuildContext context,
            AsyncSnapshot<MyJadwal> model,
          ) {
            if (model.hasData) {
              return _buildJadwalList(model.data);
            }

            return Container(
              height: 350,
              child: LodingWidget(),
            );
          },
        ),
      ],
    );
  }

  Widget _buildJadwalList(MyJadwal jadwals) {
    return Container(
      color: Colors.amber,
      child: jadwals.status
          ? ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: jadwals.data.length,
              itemBuilder: (BuildContext context, int index) {
                return new Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    child: ListTile(
                      title: Text('Atika'),
                      subtitle: Text("umaya"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: kPrimaryColor,
                            child: IconButton(
                              icon: Icon(
                                MdiIcons.login,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: kPrimaryColor,
                            child: IconButton(
                              icon: Icon(
                                MdiIcons.logout,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          : Container(),
    );
  }
}
