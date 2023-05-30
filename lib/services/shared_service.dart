import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/model_login.dart';

class SharedService {
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString("login_details") != null ? true : false;
  }

  static Future<LoginModel> loginDetails() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString("login_details") != null
        ? LoginModel.fromJson(jsonDecode(prefs.getString("login_details")))
        : null;
  }

  static Future<void> setLogindetails(
    LoginModel loginResponse,
  ) async {
    final prefs = await SharedPreferences.getInstance();

    if (loginResponse != null) {
      return prefs.setString(
          "login_details", jsonEncode(loginResponse.toJson()));
    } else {
      return prefs.remove("login_details");
    }
  }

  static Future<void> logout() async {
    await setLogindetails(null);
  }
}
