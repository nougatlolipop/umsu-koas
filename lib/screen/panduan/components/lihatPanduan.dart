import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:umsukoas/components/myAppBar.dart';
import 'package:umsukoas/config.dart';

import 'body.dart';

class LihatPanduan extends StatelessWidget {
  static String routeName = '/lihatPanduanScreen';
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  String file;

  @override
  Widget build(BuildContext context) {
    final ParamString args = ModalRoute.of(context).settings.arguments;
    file = args.filePdf.toString();
    return Scaffold(
      appBar: MyAppBar(
        title: "Panduan Profesi",
      ),
      body: SfPdfViewer.network(
        Config.urlApp + 'dokumen/' + file,
        key: _pdfViewerKey,
      ),
    );
  }
}
