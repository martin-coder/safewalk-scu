import 'package:flutter/material.dart';

void main() {
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

    TextTheme textTheme(context) {
      return const TextTheme();
    }
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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 45, bottom: 10, top: 5),
                child: Text(
                  'Walk Requests',
                ),
              ),
            ),
            Expanded(
              child: DataTable(
                headingRowColor: MaterialStateColor.resolveWith(
                    (states) => Theme.of(context).colorScheme.surface),
                dataRowColor: MaterialStateColor.resolveWith(
                    (states) => Theme.of(context).colorScheme.surface),
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
                  DataRow(
                    cells: [
                      const DataCell(Text('00:00')),
                      const DataCell(Text('Helen Mirren')),
                      const DataCell(Text('1234 Bellomy St')),
                      const DataCell(Text('Graham')),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
