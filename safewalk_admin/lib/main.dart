import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MaterialApp(
      // title: 'SafeWalk Admin',
      color: theme.colorScheme.primary,
      home: const MyHomePage(),
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
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: const WalkRequestsPage(),
            ),
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
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 45, bottom: 10, top: 5),
                  child: Text(
                    'Walk Requests',
                    style: TextStyle(
                      // Theme.of(context).textTheme.displayMedium,
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 40,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    // border: Border.all(color: Colors.black),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: DataTable(
                      headingRowColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white),
                      dataRowColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white),
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
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    // border: Border.all(color: Colors.black),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: DataTable(
                      headingRowColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white),
                      dataRowColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white),
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
