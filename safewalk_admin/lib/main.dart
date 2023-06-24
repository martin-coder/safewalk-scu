import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);

    return MaterialApp(
      // title: 'SafeWalk Admin',
      theme: lightThemeData(context),
      home: const MyHomePage(),
    );
  }

  ThemeData lightThemeData(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: lightThemeColors(context).background,
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: const Color(0xFF5B6770), //<-- SEE HERE
            displayColor: const Color(0xFF5B6770),
          ), //<-- SEE HERE,
      // appBarTheme: appBarTheme(context),
      // inputDecorationTheme: inputDecorationData(context),
      colorScheme: lightThemeColors(context),
    );
  }

  ColorScheme lightThemeColors(context) {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFFB23234),
      onPrimary: Color(0xFF5B6770),
      secondary: Color(0xFFEAAA00),
      onSecondary: Color(0xFF5B6770),
      error: Color(0xFFF32424),
      onError: Color(0xFF5B6770),
      background: Color(0xFFE0D6B5),
      onBackground: Color(0xFFFFFFFF),
      surface: Color(0xFFFFFFFF),
      onSurface: Color(0xFF323232),
    );
  }
}

// class MyAppState extends ChangeNotifier() {

// }

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SafeArea(
            child: NavigationRail(
              extended: false,
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.directions_walk),
                  label: Text('Walk Requests'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.people),
                  label: Text('Walkers'),
                ),
              ],
              selectedIndex: 0,
              onDestinationSelected: (value) {
                print('selected: $value');
              },
            ),
          ),
          const Expanded(
            child: WalkRequestsPage(),
          ),
        ],
      ),
    );
  }
}

class WalkRequestsPage extends StatelessWidget {
  const WalkRequestsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RoundedDataTable(
          name: 'Walk Requests',
        ),
      ],
    );
  }
}

class RoundedDataTable extends StatelessWidget {
  // final List<DataColumn> columns;
  // final List<DataRow> rows;
  final String name;

  const RoundedDataTable({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // constraints: const BoxConstraints.tightFor(
      //     width: double.infinity, height: double.infinity),
      margin: const EdgeInsets.all(25.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          DataTable(
            columns: const [
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
              DataColumn(
                label: Text('Assign'),
              ),
              DataColumn(
                label: Text('Delete'),
              ),
            ],
            rows: [
              walkRequestDataRow(
                time: '00:00',
                requestName: 'Hellen Mirren',
                currentLocation: '4321 Alviso St',
                destination: 'Graham',
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                print('See More button pressed');
                // Handle "see more" button click
              },
              child: const Text('See More'),
            ),
          ),
        ],
      ),
    );
  }

  walkRequestDataRow(
      {required String time,
      required String requestName,
      required String currentLocation,
      required String destination}) {
    return DataRow(
      cells: [
        DataCell(Text(time)),
        DataCell(Text(requestName)),
        DataCell(Text(currentLocation)),
        DataCell(Text(destination)),
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
    );
  }
}

// DataRow walkRequestDataRow(String time, String requestName,
//     String currentLocation, String destination) {
  
// }
