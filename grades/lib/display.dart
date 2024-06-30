// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'data.dart';

class Results extends StatefulWidget {
  final Map<String, int> results;
  const Results({super.key, required this.results});

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    // calculate sum
    var marks = widget.results.values;
    int total = marks.reduce((sum, index) => sum + index);
    //average
    double avg = total / marks.length;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Results'),
      ),
      body: Column(
        children: [
          ResultsTable(
            results: widget.results,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Table(
              textDirection: TextDirection.ltr,
              border: TableBorder.all(width: 1, color: Colors.blue),
              children: [
                const TableRow(children: [Text('Summary'), Text('#')]),
                TableRow(children: [
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(total.toString())
                ]),
                TableRow(children: [
                  const Text(
                    'Average',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(avg.toStringAsFixed(2))
                ]),
                TableRow(children: [
                  const Text(
                    'Grade',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(determineGrade(avg))
                ])
              ],
            ),
          )
        ],
      ),
    );
  }
  // Total widget.results
  // Key Values
  //totals - values
}

class ResultsTable extends StatefulWidget {
  ResultsTable({
    super.key,
    required this.results,
  });
  final Map<String, int> results;

  @override
  State<ResultsTable> createState() => _ResultsTableState();
}

class _ResultsTableState extends State<ResultsTable> {
  @override
  Widget build(BuildContext context) {
    return DataTable(
        headingRowColor: WidgetStateProperty.all(Colors.orangeAccent),
        columns: const [
          DataColumn(label: Text('Subject')),
          DataColumn(label: Text('Marks')),
          DataColumn(label: Text('Complete'))
        ],
        rows: generated);
  }

  late List<DataRow> res = [
    DataRow(cells: [
      DataCell(Text('Maths')),
      DataCell(Text(widget.results['Maths'].toString()))
    ]),
  ];

  late List<DataRow> generated = List.generate(widget.results.length, (index) {
    return DataRow(
        color: WidgetStateProperty.all(
            index.isEven ? Colors.black26 : Colors.white),
        cells: [
          DataCell(Text(widget.results.entries.toList()[index].key)),
          DataCell(
              Text(widget.results.entries.toList()[index].value.toString())),
          DataCell(Checkbox(
            value: widget.results.entries.toList()[index].value > 70,
            onChanged: (bool? value) {},
          ))
        ]);
  });
}
