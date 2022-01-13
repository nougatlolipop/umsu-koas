import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:umsukoas/config.dart';
import 'package:umsukoas/restapi/api_services.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  APIService apiService;
  String panduanNama = '';

  @override
  void initState() {
    apiService = new APIService();
    getPanduan();
    super.initState();
  }

  Future<void> getPanduan() async {
    await apiService.getPanduan().then((value) {
      if (mounted) {
        setState(() {
          panduanNama = value.data[0].panduanFile;
        });
      }
      print(jsonEncode(value));
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: SfPdfViewer.network(
        Config.urlApp + 'dokumen/' + panduanNama,
        key: _pdfViewerKey,
      ),
    );
  }
}
