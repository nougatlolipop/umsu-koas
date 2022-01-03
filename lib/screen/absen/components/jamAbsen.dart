import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:umsukoas/constants.dart';
import 'package:umsukoas/restapi/api_services.dart';

import '../../../size_config.dart';

class Announcement extends StatefulWidget {
  @override
  State<Announcement> createState() => _AnnouncementState();
}

class _AnnouncementState extends State<Announcement> {
  int currentPage = 0;
  APIService apiService;
  String _timeString;

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
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
      child: Text(
        _timeString,
        style: TextStyle(
            fontSize: getProportionateScreenHeight(50),
            fontWeight: FontWeight.bold,
            color: kPrimaryColor),
      ),
    );
  }
}
