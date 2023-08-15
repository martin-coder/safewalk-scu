import 'package:flutter/material.dart';
import 'auth_service.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFB23234),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xFFB23234),
          child: Center(
            child: Container(
              width: 200,
              height: 500,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        width: 480,
                        height: 210,
                        child: Padding(
                          padding: const EdgeInsets.all(19.0),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/logo_red_1.png',
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'SafeWalkSCU',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: SizedBox(
                        width: 160,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () async {
                             await AuthService().signInWithGoogle();
                          }, 
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          child: Image.asset(
                            'assets/google_icon.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: SizedBox(
                        width: 181,
                        height: 44,
                        child: ElevatedButton(
                          onPressed: () {
                            // Call Dispatcher button pressed
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/rectangle_image.png',
                                width: 22,
                                height: 22,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Call Dispatcher',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                 overflow: TextOverflow.ellipsis
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: 164,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          // Call Campus Safety button pressed
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/Error_outline.png',
                              width: 22,
                              height: 22,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(width: 3),
                            Text(
                              'Call Campus Safety',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class WalkRequestsPage extends StatelessWidget {
  const WalkRequestsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 181, 28, 28),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Align(
                alignment: Alignment.topRight,
                child: Transform.translate(
                  offset: const Offset(50, -50),
                  child: SizedBox(
                    width: 189,
                    height: 554,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: Image.asset(
                        'assets/logo_red_1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: const Placeholder(),
          ),
        ],
      ),
    );
  }
}
