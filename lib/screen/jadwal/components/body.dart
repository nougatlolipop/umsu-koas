import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:umsukoas/components/loadingWidget.dart';
import 'package:umsukoas/components/myAppBar.dart';
import 'package:umsukoas/helpers/colors.dart';
import 'package:umsukoas/models/model_jadwal.dart';
import 'package:umsukoas/models/model_login.dart';
import 'package:umsukoas/restapi/api_services.dart';

import '../../../config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  CalendarController _controller;
  APIService apiService;
  Jadwal modelJadwal;
  DateTime sd;
  LoginModel loginModel;

  @override
  void initState() {
    _controller = CalendarController();
    apiService = new APIService();
    modelJadwal = new Jadwal();
    // test();
    super.initState();
  }

  test() {
    String jamStr = "08:00:00";
    String jamEnd = "16:00:00";
    var formatter = new DateFormat('yyyy-MM-dd');

    DateTime start = DateTime.fromMillisecondsSinceEpoch(1641106800000).toUtc();
    DateTime end = DateTime.fromMillisecondsSinceEpoch(1643785200000).toUtc();
    int selisih = end.difference(start).inDays;
    for (var i = 0; i <= selisih; i++) {
      String startFix = formatter
              .format(DateTime.fromMillisecondsSinceEpoch(1641106800000)
                  .toUtc()
                  .add(new Duration(days: i)))
              .toString() +
          " " +
          jamStr;
      String endFix = formatter
              .format(DateTime.fromMillisecondsSinceEpoch(1641106800000)
                  .toUtc()
                  .add(new Duration(days: i)))
              .toString() +
          " " +
          jamEnd;
      print(startFix + " - " + endFix);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Jadwal",
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
    var formatter = new DateFormat('yyyy-MM-dd');

    await apiService.getJadwal(Config.npm).then((ret) {
      modelJadwal = ret;
    });
    for (var i = 0; i < modelJadwal.data.length; i++) {
      startTime = DateTime.fromMillisecondsSinceEpoch(
              int.parse(modelJadwal.data[i].jadwalTanggalMulai))
          .toUtc();
      endTime = DateTime.fromMillisecondsSinceEpoch(
              int.parse(modelJadwal.data[i].jadwalTanggalSelesai))
          .toUtc();
      int selisih = endTime.difference(startTime).inDays;
      for (var j = 0; j <= selisih; j++) {
        String startFix =
            formatter.format(startTime.add(new Duration(days: j))).toString() +
                " " +
                modelJadwal.data[i].jadwalJamMasuk;

        String endFix =
            formatter.format(startTime.add(new Duration(days: j))).toString() +
                " " +
                modelJadwal.data[i].jadwalJamKeluar;
        DateFormat frmt = new DateFormat("yyyy-MM-dd hh:mm:ss");
        meetings.add(
          Meeting(
            modelJadwal.data[i].rumahSakitNama +
                " " +
                modelJadwal.data[i].jadwalJamMasuk.toString() +
                " - " +
                modelJadwal.data[i].jadwalJamKeluar.toString(),
            frmt.parse(startFix),
            frmt.parse(endFix),
            getColorFromHex(modelJadwal.data[i].rumahSakitWarna),
            false,
          ),
        );
      }
    }
    print(meetings.toList()[1].from.toString() +
        " " +
        meetings.toList()[1].to.toString());
    return meetings;
  }
}

class _getColorFromHex {}

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
