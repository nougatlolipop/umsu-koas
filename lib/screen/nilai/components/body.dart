import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(8.0),
          alignment: Alignment.topLeft,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              border: TableBorder.symmetric(),
              columns: const <DataColumn>[
                DataColumn(
                  label: Text(
                    'Kegiatan',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Bobot',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Nilai',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Hasil',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ],
              rows: const <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Pretest')),
                    DataCell(Text('5%')),
                    DataCell(Text('85')),
                    DataCell(Text('4,25')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Tutorial Klinik')),
                    DataCell(Text('10%')),
                    DataCell(Text('95')),
                    DataCell(Text('9,5')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Journal Reading')),
                    DataCell(Text('15%')),
                    DataCell(Text('880')),
                    DataCell(Text('12')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Refarat')),
                    DataCell(Text('15%')),
                    DataCell(Text('80')),
                    DataCell(Text('12')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Midtest')),
                    DataCell(Text('15%')),
                    DataCell(Text('95')),
                    DataCell(Text('14,25')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Follow Up')),
                    DataCell(Text('15%')),
                    DataCell(Text('95')),
                    DataCell(Text('14,25')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Post Test')),
                    DataCell(Text('25%')),
                    DataCell(Text('95')),
                    DataCell(Text('23,75')),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(8.0),
          alignment: Alignment.topLeft,
          child: Text('Kondite'),
        ),
      ],
    );
  }
}
