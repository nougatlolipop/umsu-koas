import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:umsukoas/components/loadingWidget.dart';
import 'package:umsukoas/components/myAppBar.dart';
import 'package:umsukoas/constants.dart';
import 'package:umsukoas/models/model_jadwal.dart';
import 'package:umsukoas/restapi/api_services.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  CalendarController _controller;
  APIService apiService;
  Jadwal modelJadwal;
  DateTime sd;

  @override
  void initState() {
    _controller = CalendarController();
    apiService = new APIService();
    modelJadwal = new Jadwal();

    sd = DateTime.fromMillisecondsSinceEpoch(1640592300000);
    print(sd.year.toString() +
        " " +
        sd.month.toString() +
        " " +
        sd.day.toString() +
        " " +
        sd.hour.toString() +
        " " +
        sd.minute.toString() +
        " " +
        sd.second.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: Text("Jadwal"),
        action: <Widget>[
          PopupMenuButton<int>(
            onSelected: (item) {
              onSelected(context, item);
              setState(() {});
            },
            itemBuilder: (context) => [
              PopupMenuItem<int>(value: 0, child: Text("daily")),
              PopupMenuItem<int>(value: 1, child: Text("weekly")),
              PopupMenuItem<int>(value: 2, child: Text("monthly")),
            ],
          ),
        ],
      ),
      body: FutureBuilder(
        future: _getDataSource(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data != null) {
            return Container(
              child: SfCalendar(
                view: CalendarView.day,
                controller: _controller,
                dataSource: MeetingDataSource(snapshot.data),
                monthViewSettings: const MonthViewSettings(
                    appointmentDisplayMode:
                        MonthAppointmentDisplayMode.appointment),
              ),
            );
          } else {
            return Container(
              height: 350,
              child: LodingWidget(),
            );
          }
        },
      ),
    );
  }

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        _controller.view = CalendarView.day;
        break;
      case 1:
        _controller.view = CalendarView.week;
        break;
      case 2:
        _controller.view = CalendarView.month;
        break;
    }
  }

  Future<List<Meeting>> _getDataSource() async {
    final List<Meeting> meetings = <Meeting>[];
    DateTime startTime;
    // DateTime(today.year, today.month, today.day, 9, 0, 0);
    DateTime endTime;
    // DateTime(today.year, today.month, today.day, 11, 20, 0);

    await apiService.getJadwal('1908320001').then((ret) {
      modelJadwal = ret;
    });
    for (var i = 0; i < modelJadwal.data.length; i++) {
      startTime = DateTime.fromMillisecondsSinceEpoch(
              int.parse(modelJadwal.data[i].jadwalTanggalMulai))
          .toUtc();
      endTime = DateTime.fromMillisecondsSinceEpoch(
              int.parse(modelJadwal.data[i].jadwalTanggalSelesai))
          .toUtc();
      meetings.add(
        Meeting(
          modelJadwal.data[i].rumahSakitNama,
          startTime,
          endTime,
          kPrimaryColor,
          false,
        ),
      );
    }
    return meetings;
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments[index];
    Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }

    return meetingData;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);
  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
