import 'package:flutter/material.dart';
import 'package:sweetalert/sweetalert.dart';
import 'package:umsukoas/components/defaultButton.dart';
import 'package:umsukoas/components/loadingWidget.dart';
import 'package:umsukoas/models/model_login.dart';
import 'package:umsukoas/services/shared_service.dart';
import 'package:umsukoas/size_config.dart';

import 'info.dart';
import 'profileMenuItem.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
      future: SharedService.loginDetails(),
      builder: (BuildContext context, AsyncSnapshot<LoginModel> loginModel) {
        if (loginModel.hasData) {
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Info(
                  image:
                      "https://mahasiswa.umsu.ac.id/FotoMhs/${loginModel.data.data[0].angkatan}/${loginModel.data.data[0].npm}.jpg",
                  name: "${loginModel.data.data[0].fullname}",
                  email: "${loginModel.data.data[0].email}",
                ),
                SizedBox(height: SizeConfig.defaultSize * 2), //20
                ProfileMenuItem(
                  iconSrc: "",
                  title: "${loginModel.data.data[0].npm}",
                  press: () {},
                ),
                ProfileMenuItem(
                  iconSrc: "",
                  title: "${loginModel.data.data[0].prodi}",
                  press: () {},
                ),
                ProfileMenuItem(
                  iconSrc: "",
                  title: "${loginModel.data.data[0].angkatan}",
                  press: () {},
                ),

                ProfileMenuItem(
                  iconSrc: "",
                  title: "${loginModel.data.data[0].phone}",
                  press: () {},
                ),
                Padding(
                  padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                  child: DefaultButton(
                      press: () {
                        SweetAlert.show(context,
                            subtitle: "Do you want to delete this message",
                            style: SweetAlertStyle.confirm,
                            showCancelButton: true, onPress: (bool isConfirm) {
                          if (isConfirm) {
                            SweetAlert.show(context,
                                subtitle: "Logout...",
                                style: SweetAlertStyle.loading);
                            new Future.delayed(new Duration(seconds: 2), () {
                              SharedService.logout().then((value) => {
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil('/loginScreen',
                                            (Route<dynamic> route) => false)
                                  });
                            });
                          } else {
                            SweetAlert.show(context,
                                subtitle: "Canceled!",
                                style: SweetAlertStyle.error);
                          }
                          // return false to keep dialog
                          return false;
                        });
                      },
                      text: "Logout"),
                ),
              ],
            ),
          );
        }
        return Container(
          height: 350,
          child: LodingWidget(),
        );
      },
    );
  }
}
