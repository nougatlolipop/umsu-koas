import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:lottie/lottie.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sweetalert/sweetalert.dart';
import 'package:umsukoas/components/rounded_button.dart';
import 'package:umsukoas/components/rounded_input.dart';
import 'package:umsukoas/components/rounded_password_input.dart';
import 'package:umsukoas/constants.dart';
import 'package:umsukoas/restapi/api_services.dart';
import 'package:umsukoas/services/shared_service.dart';
import 'package:umsukoas/size_config.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key key,
    @required this.isLogin,
    @required this.animationDuration,
    @required this.size,
    @required this.defaultLoginSize,
  }) : super(key: key);

  final bool isLogin;
  final Duration animationDuration;
  final Size size;
  final double defaultLoginSize;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  APIService apiService;
  TextEditingController npm = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState() {
    apiService = new APIService();
    super.initState();
  }

  Future<void> userAuth(npm, pass) {
    apiService.loginUser(npm, pass).then(
      (ret) {
        print(ret.toJson());
        if (ret.status) {
          SharedService.setLogindetails(ret);
          Navigator.pushNamed(context, "/homeScreen");
        } else {
          SweetAlert.show(
            context,
            title: "KOAS UMSU",
            subtitle: ret.message,
            style: SweetAlertStyle.error,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: widget.isLogin ? 1.0 : 0.0,
      duration: widget.animationDuration * 4,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: widget.size.width,
          height: widget.defaultLoginSize,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text(
                //   'KOAS UMSU',
                //   style: TextStyle(
                //     fontWeight: FontWeight.bold,
                //     fontSize: 30,
                //     color: kTextColorHome,
                //   ),
                // ),
                SizedBox(height: 120),
                Lottie.asset('asset/lotties/log.json',
                    width: getProportionateScreenWidth(250)),
                SizedBox(height: 40),
                RoundedInput(
                  name: npm,
                  icon: MdiIcons.accountCircleOutline,
                  hint: 'Username',
                ),
                RoundedPasswordInput(
                  name: password,
                  hint: 'Password',
                ),
                SizedBox(height: 10),
                RoundedButton(
                  title: 'LOGIN',
                  press: () {
                    final progress = ProgressHUD.of(context);
                    progress?.show();
                    Future.delayed(Duration(seconds: 1), () {
                      userAuth(npm.text, password.text);
                      progress?.dismiss();
                    });
                  },
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
