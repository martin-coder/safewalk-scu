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
    return const Placeholder();
  }
}
