import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SfPdfViewer.network(
        'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
        key: _pdfViewerKey,
      ),
    );
  }
}
