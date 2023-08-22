import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/rendering.dart';
import 'firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';

List walkRequests = <WalkRequestData>[];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

getDataFromDatabase() async {
  DatabaseReference ref =
      FirebaseDatabase.instance.ref('unassignedUsers/ac/name');
  ref.onValue.listen((DatabaseEvent event) {
    final data = event.snapshot.value;
    print(data);
  });
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = const WalkRequestsPage();
        break;
      case 1:
        page = const Placeholder();
        break;
      default:
        throw UnimplementedError('no widget for selectedIndex $selectedIndex');
    }
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                extended: constraints.maxWidth >= 950,
                leading: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 150,
                    ),
                    child:
                        Image.asset('assets/images/White_Safe_Walk_Logo.png')),
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
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
            ),
            Expanded(
              // color: Theme.of(context).colorScheme.primaryContainer,
              child: page,
            ),
          ],
        ),
      );
    });
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
            rows: const [
              // walkRequestDataRow(
              //   time: '00:00',
              //   requestName: 'Hellen Mirren',
              //   currentLocation: '4321 Alviso St',
              //   destination: 'Graham',
              // ),
            ],
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                getDataFromDatabase();
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

  walkRequestDataRow({required WalkRequestData walkRequestData}) {
    return DataRow(
      cells: [
        DataCell(Text(walkRequestData.time)),
        DataCell(Text(walkRequestData.name)),
        DataCell(Text(walkRequestData.currentLocation)),
        DataCell(Text(walkRequestData.destination)),
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

class WalkRequestData {
  String time;
  String name;
  String currentLocation;
  String destination;
  WalkRequestData(this.time, this.name, this.currentLocation, this.destination);
}
/*
1. Make some kind of walkRequestDataRow object
2. Make a list of those objects called WalkRequests -- This will populate the table
3. The table widget will listen for changes in the list
4. The list will listen for changes from the database


Make a struct that keeps all the data for a walk request in one place

*/


// DataRow walkRequestDataRow(String time, String requestName,
//     String currentLocation, String destination) {
  
// }
