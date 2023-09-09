import 'package:flutter/material.dart';
import 'package:iteach/views/tutor_signup.dart';
import 'package:iteach/views/sign_in.dart';
import 'package:iteach/views/student_signup.dart';
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width * 0.8; // Set the button width as 80% of the screen width

    return Stack(
      // Keeping the elevated button just to go back
      children: [
        // Background color
        Container(
          color: Colors.white,
        ),

        Positioned(
          child: Align(
            alignment: Alignment.topLeft, // Top left
            child: ElevatedButton(
              child: const Text('Go back',
                  style: TextStyle(color: Colors.black)),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.25,
          width: MediaQuery.of(context).size.width, // Set full width
          child: Align(
            alignment: Alignment.center, // Center horizontally
            child: Image.asset('assets/images/logoiTeach.png'), // <-- SEE HERE
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.74,
          width: MediaQuery.of(context).size.width, // Set full width
          child: Align(
            alignment: Alignment.center, // Center horizontally
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TutorSignUpPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: const Color(0xFF7643B5), backgroundColor: Colors.white, // Text color (purple)
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0), // Rounded corners
                  side: const BorderSide(color: Color(0xFF7643B5)), // Border color
                ),
                minimumSize: Size(buttonWidth, 0), // Set the minimum button width
              ),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text('Registrati come Tutor', style: TextStyle(fontSize: 18)),
              ), // <-- SEE HERE
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.825,
          width: MediaQuery.of(context).size.width, // Set full width
          child: Align(
            alignment: Alignment.center, // Center horizontally
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StudentSignUpPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: const Color(0xFF7643B5), backgroundColor: Colors.white, // Text color (purple)
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0), // Rounded corners
                  side: const BorderSide(color: Color(0xFF7643B5)), // Border color
                ),
                minimumSize: Size(buttonWidth, 0), // Set the minimum button width
              ),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text('Registrati come Studente', style: TextStyle(fontSize: 18)),
              ), // <-- SEE HERE
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.910,
          width: MediaQuery.of(context).size.width,  // Set full width
          child: Align(
            alignment: Alignment.center, // Center horizontally
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignInPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: const Color(0xFF0079D2), // Text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0), // Rounded corners
                  side: const BorderSide(color: Color(0xFF0079D2)), // Border color
                ),
                minimumSize: Size(buttonWidth, 0), // Set the minimum button width
              ),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text('Accedi', style: TextStyle(fontSize: 18)),
              ), // <-- SEE HERE
            ),
          ),
        ),
      ],
    );
  }
}
