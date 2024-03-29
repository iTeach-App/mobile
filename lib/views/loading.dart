import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:iteach/services/loading.dart';
import 'package:iteach/views/login.dart';
class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});
  @override
  Widget build(BuildContext context) {
    Future<void> loading = LoadingService().initializeApp();
    // go to login page loading is done
    loading.then((value) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    ));

    return MaterialApp(
      home: Scaffold(
        body: Builder( // Use Builder widget to obtain a valid BuildContext
          builder: (BuildContext context) {
            return Stack(
              children: [
                // Background color
                Container(
                  color: const Color(0xFF0079D2),
                ),

                // First child (Text widget)
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width, // Set full width
                  child: const Align(
                    alignment: Alignment.center, // Center horizontally
                    child: Text(
                      'iTeach',
                      style: TextStyle(fontSize: 50, color: Colors.white),
                    ),
                  ),
                ),
                // Second child (Container widget)
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.65,
                  width: MediaQuery.of(context).size.width, // Set full width
                  child: const Align(
                    alignment: Alignment.center, // Center horizontally
                    child: SpinKitCircle(
                      color: Colors.white,
                      size: 70.0,
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.85,
                  width: MediaQuery.of(context).size.width, // Set full width
                  child: Align(
                    alignment: Alignment.center, // Center horizontally
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Background color
                      ),
                      child: const Text('Loading',
                          style: TextStyle(color: Colors.black)),
                    ),
                  ),
                ),
                // You can add more Positioned widgets for additional children
              ],
            );
          },
        ),
      ),
    );
  }
}
