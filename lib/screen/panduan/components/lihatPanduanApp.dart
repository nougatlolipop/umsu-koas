import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:umsukoas/components/myAppBar.dart';
import 'package:umsukoas/config.dart';
import 'package:umsukoas/screen/panduan/components/panduanApp.dart';

class LihatPanduanApp extends StatelessWidget {
  static String routeName = '/lihatPanduanAppScreen';
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  String file;

  @override
  Widget build(BuildContext context) {
    final Params args = ModalRoute.of(context).settings.arguments;
    file = args.filePdf.toString();
    return Scaffold(
      appBar: MyAppBar(
        title: "Panduan Aplikasi",
      ),
      body: SfPdfViewer.network(
        Config.urlApp + 'dokumen/' + file,
        key: _pdfViewerKey,
      ),
    );
  }
}
