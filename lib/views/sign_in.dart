import 'package:flutter/material.dart';
import 'package:iteach/views/welcome_back.dart';
import 'package:iteach/components/round_button.dart';
class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            IconButton(
              alignment: Alignment.topLeft,
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(
                top: screenHeight * 0.05,
                left: screenWidth * 0.05,
                right: screenWidth * 0.05,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Bentornato',
                        style: TextStyle(
                          fontSize: screenHeight * 0.04,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        width: screenWidth * 0.6,
                        child: Text(
                          'Accedi con il tuo indirizzo email oppure tramite i pulsanti social sottostanti.',
                          style: TextStyle(
                            fontSize: screenHeight * 0.02,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.03),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.05),
              child: Column(
                children: [
                  TextFormField(
                    initialValue: 'Input',
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  TextFormField(
                    initialValue: 'Input',
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01), // Added spacing
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Handle the "Password dimenticata?" action here
                      },
                      child: Text(
                        'Password dimenticata?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue, // You can change the color as desired
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02), // Added spacing
                  Container(
                    width: double.infinity, // Span from one edge to the other
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const WelcomeBackPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF0079D2), // Background color
                        onPrimary: Colors.white, // Text color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(screenWidth * 0.15), // Rounded corners
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(screenWidth * 0.03),
                        child: Text('Accedi', style: TextStyle(fontSize: screenHeight * 0.03)),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04), // Added spacing
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 1.0,
                        margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.transparent, // Fade in from the left
                              Colors.black, // Line color in the middle
                              Colors.transparent, // Fade out to the right
                            ],
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                        child: Text(
                          'or',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: screenHeight * 0.025,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.10), // Added spacing
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RoundButton(
                        imageAsset: 'assets/images/Google - Original.jpg',
                        onPressed: () {
                          // Handle button 1 press
                        },
                        screenWidth: screenWidth, // Pass the screenWidth to RoundButton
                      ),
                      RoundButton(
                        imageAsset: 'assets/images/Facebook - Original.jpg',
                        onPressed: () {
                          // Handle button 2 press
                        },
                        screenWidth: screenWidth, // Pass the screenWidth to RoundButton
                      ),
                      RoundButton(
                        imageAsset: 'assets/images/Linkedin - Original.jpg',
                        onPressed: () {
                          // Handle button 3 press
                        },
                        screenWidth: screenWidth, // Pass the screenWidth to RoundButton
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
