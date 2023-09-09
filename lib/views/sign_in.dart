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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
                      SizedBox(
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
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  TextFormField(
                    initialValue: 'Input',
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Handle the "Password dimenticata?" action here
                      },
                      child: const Text(
                        'Password dimenticata?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const WelcomeBackPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: const Color(0xFF0079D2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(screenWidth * 0.15),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(screenWidth * 0.03),
                        child: Text('Accedi', style: TextStyle(fontSize: screenHeight * 0.03)),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 1.0,
                        margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.transparent,
                              Colors.black,
                              Colors.transparent,
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
                  SizedBox(height: screenHeight * 0.10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RoundButton(
                        imageAsset: 'assets/images/Google - Original.jpg',
                        onPressed: () {
                          // Handle button 1 press
                        },
                        screenWidth: screenWidth,
                      ),
                      RoundButton(
                        imageAsset: 'assets/images/Facebook - Original.jpg',
                        onPressed: () {
                          // Handle button 2 press
                        },
                        screenWidth: screenWidth,
                      ),
                      RoundButton(
                        imageAsset: 'assets/images/Linkedin - Original.jpg',
                        onPressed: () {
                          // Handle button 3 press
                        },
                        screenWidth: screenWidth,
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
