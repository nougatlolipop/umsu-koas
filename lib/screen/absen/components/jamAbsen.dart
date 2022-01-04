import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:umsukoas/components/marqueeWidget.dart';
import 'package:umsukoas/constants.dart';
import 'package:umsukoas/restapi/api_services.dart';

import '../../../config.dart';
import '../../../size_config.dart';

class JamAbsen extends StatefulWidget {
  @override
  State<JamAbsen> createState() => _JamAbsenState();
}

class _JamAbsenState extends State<JamAbsen> {
  int currentPage = 0;
  APIService apiService;
  String _timeString;
  List<Placemark> place = [];
  Position position;

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    if (mounted) {
      setState(() {
        _timeString = formattedDateTime;
      });
    }
  }

  Future<void> getCurrentLoc() async {
    position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<Placemark> newPlace = await Geolocator()
        .placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark placeMark = newPlace[0];
    String name = placeMark.name;
    String locality = placeMark.locality;
    String administrativeArea = placeMark.administrativeArea;
    String postalCode = placeMark.postalCode;
    String country = placeMark.country;
    // String jalan= placeMark.;
    String address = //"${first.addressLine}";

        "${name}, ${locality}, ${administrativeArea}, ${postalCode}, ${country}";

    print(address);

    setState(() {
      Config.latlong =
          position.latitude.toString() + "," + position.longitude.toString();
      Config.alamat = address; // update _address
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('hh:mm:ss').format(dateTime);
  }

  @override
  void initState() {
    apiService = new APIService();
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    getCurrentLoc();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _announcementsList();
  }

  Widget _announcementsList() {
    return _buildAnouncementsList();
  }

  Widget _buildAnouncementsList() {
    return Container(
      alignment: Alignment.center,
      width: getProportionateScreenWidth(313),
      height: getProportionateScreenWidth(80),
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
      child: Column(
        children: [
          Text(
            _timeString,
            style: TextStyle(
                fontSize: getProportionateScreenHeight(50),
                fontWeight: FontWeight.bold,
                color: kPrimaryColor),
          ),
          SizedBox(
            width: getProportionateScreenWidth(280),
            child: MarqueeWidget(
              direction: Axis.horizontal,
              child:
                  Text(Config.alamat, style: TextStyle(color: kPrimaryColor)),
            ),
          ),
        ],
      ),
    );
  }
}
