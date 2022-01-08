import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
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
  Position position;
  String location = 'Null, Press Button';
  String Address = 'search';

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    if (mounted) {
      setState(() {
        _timeString = formattedDateTime;
      });
    }
  }

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    Address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(() {
      Config.alamat = Address;
    });
  }

  Future<void> getCurrentLoc() async {
    Position position = await _getGeoLocationPosition();
    location = 'Lat: ${position.latitude} , Long: ${position.longitude}';
    GetAddressFromLatLong(position);
    print(location);
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
