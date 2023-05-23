import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SafeWalk Admin',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

// class MyAppState extends ChangeNotifier() {

// }

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding:
      color: Colors.white,
      child: DataTable(
        // border: TableBorder.all(color: Colors.black),
        columns: [
          DataColumn(
            label: Text('Time'),
          ),
          DataColumn(
            label: Text('Name'),
          ),
          DataColumn(
            label: Text('Current Location'),
          ),
          DataColumn(
            label: Text('Destination'),
          ),
          DataColumn(label: Text('Assign')),
          DataColumn(
            label: Text('Delete'),
          ),
        ],
        rows: [
          DataRow(
            cells: [
              DataCell(Text('00:00')),
              DataCell(Text('Helen Mirren')),
              DataCell(Text('1234 Bellomy St')),
              DataCell(Text('Graham')),
              DataCell(
                IconButton(
                  icon: const Icon(Icons.person_add),
                  onPressed: () {},
                ),
              ),
              DataCell(
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
        // TableRow(children: [
        //   Text('Time'),
        //   Text('Name'),
        //   Text('Current Location'),
        //   Text('Destination'),
        //   Text('Assign'),
        // //   Text('Delete'),
        //   // ])
        // ],
      ),
    );
  }
}
