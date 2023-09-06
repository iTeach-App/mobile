import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: Loading(),
  ));
}

//LOADING PAGE
class Loading extends StatelessWidget {
  const Loading({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Builder( // Use Builder widget to obtain a valid BuildContext
          builder: (BuildContext context) {
            return Stack(
              children: [
                // Background color
                Container(
                  color: Color(0xFF0079D2),
                ),

                // First child (Text widget)
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width, // Set full width
                  child: Align(
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
                  child: Align(
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
                   child: const Text('Loading',
                       style: TextStyle(color: Colors.black)),
                   onPressed: () {
                   Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => const LoginPage()),
                   );
                 },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white, // Background color
                    ),
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

//LOGIN PAGE
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
                  MaterialPageRoute(builder: (context) => const RegistrazioneTutorPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white, // Background color
                onPrimary: Color(0xFF7643B5), // Text color (purple)
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0), // Rounded corners
                  side: BorderSide(color: Color(0xFF7643B5)), // Border color
                ),
                minimumSize: Size(buttonWidth, 0), // Set the minimum button width
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
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
                  MaterialPageRoute(builder: (context) => const RegistrazioneStudentePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white, // Background color
                onPrimary: Color(0xFF7643B5), // Text color (purple)
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0), // Rounded corners
                  side: BorderSide(color: Color(0xFF7643B5)), // Border color
                ),
                minimumSize: Size(buttonWidth, 0), // Set the minimum button width
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
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
                  MaterialPageRoute(builder: (context) => const AccediPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF0079D2), // Background color (blue)
                onPrimary: Colors.white, // Text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0), // Rounded corners
                  side: BorderSide(color: Color(0xFF0079D2)), // Border color
                ),
                minimumSize: Size(buttonWidth, 0), // Set the minimum button width
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text('Accedi', style: TextStyle(fontSize: 18)),
              ), // <-- SEE HERE
            ),
          ),
        ),
      ],
    );
  }
}

// REGISTRAZIONE TUTOR PAGE
class RegistrazioneTutorPage extends StatelessWidget {
  const RegistrazioneTutorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.only(top: 30.0, left: 16.0, right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Registrati!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text(
                          'Compila i campi sottostanti per registrarti gratuitamente come tutor e farti conoscere nella tua zona!',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 56),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextFormField(
                    initialValue: 'Input',
                    decoration: InputDecoration(
                      labelText: 'Nome',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    initialValue: 'Input',
                    decoration: InputDecoration(
                      labelText: 'Cognome',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    initialValue: 'Input',
                    decoration: InputDecoration(
                      labelText: 'Data di nascita',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    initialValue: 'Input',
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    initialValue: 'Input',
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    initialValue: 'Input',
                    decoration: InputDecoration(
                      labelText: 'Ripeti password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 24.0), // Added spacing
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LezioniPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF0079D2), // Background color
                        onPrimary: Colors.white, // Text color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0), // Rounded corners
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text('Registrati come Tutor', style: TextStyle(fontSize: 18)),
                      ), // <-- SEE HERE
                    ),
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


// REGISTRAZIONE STUDENTE PAGE
class RegistrazioneStudentePage extends StatelessWidget {
  const RegistrazioneStudentePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.only(top: 30.0, left: 16.0, right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Registrati!',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Text(
                              'Compila i campi sottostanti per registrarti gratuitamente come utente e scoprire i tutori nella tua zona!',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 56),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextFormField(
                    initialValue: 'Input',
                    decoration: InputDecoration(
                      labelText: 'Nome',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    initialValue: 'Input',
                    decoration: InputDecoration(
                      labelText: 'Cognome',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    initialValue: 'Input',
                    decoration: InputDecoration(
                      labelText: 'Data di nascita',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    initialValue: 'Input',
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    initialValue: 'Input',
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    initialValue: 'Input',
                    decoration: InputDecoration(
                      labelText: 'Ripeti password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 24.0), // Added spacing
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BentrovatoPage()),
                      );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF0079D2), // Background color
                        onPrimary: Colors.white, // Text color
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0), // Rounded corners
                       ),
                      ),
                      child: Padding(
                      padding: const EdgeInsets.all(12.0),
                        child: Text('Registrati come Studente', style: TextStyle(fontSize: 18)),
                         ), // <-- SEE HERE
                      ),
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

//ACCEDI PAGE
class AccediPage extends StatelessWidget {
  const AccediPage({Key? key}) : super(key: key);

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
                          MaterialPageRoute(builder: (context) => const BentrovatoPage()),
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

class RoundButton extends StatelessWidget {
  final String imageAsset;
  final VoidCallback onPressed;
  final double screenWidth; // Declare screenWidth as a property

  RoundButton({required this.imageAsset, required this.onPressed, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(50.0),
      child: Container(
        width: screenWidth * 0.15,
        height: screenWidth * 0.15,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(color: Colors.grey, width: 2.0),
        ),
        child: Center(
          child: Image.asset(
            imageAsset,
            width: screenWidth * 0.075,
            height: screenWidth * 0.075,
          ),
        ),
      ),
    );
  }
}

//BENTROVATO PAGE
class BentrovatoPage extends StatelessWidget {
  const BentrovatoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bentrovato'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}

//LEZIONI PAGE
class LezioniPage extends StatelessWidget {
  const LezioniPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Le mie lezioni',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Your content here
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Lezioni',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline_rounded),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profilo',
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreaLezionePage()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}


//CREA LEZIONE PAGE
class CreaLezionePage extends StatelessWidget {
  const CreaLezionePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Row of elements at the top
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    'Crea Lezione',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Add your functionality for the right text button here
                    },
                    child: Text(
                      'Conferma',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Column of text input boxes
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch text input boxes to full width
                children: [
                  TextFormField(
                    initialValue: 'Input',
                    decoration: InputDecoration(
                      labelText: 'Titolo dell\'annuncio',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '*required',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    initialValue: 'Input',
                    decoration: InputDecoration(
                      labelText: 'Materia',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '*required',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    initialValue: 'Input',
                    decoration: InputDecoration(
                      labelText: 'Tipo di annuncio',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '*required',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    initialValue: 'Input',
                    decoration: InputDecoration(
                      labelText: 'Prezzo all\'ora',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '*required',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class StyledTextInputBox extends StatelessWidget {
  final String label;
  final String hintText;

  const StyledTextInputBox({
    required this.label,
    required this.hintText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8.0), // Add spacing between label and input field
          TextField(
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}

class TextInputBox extends StatelessWidget {
  final String label;
  final String hintText;

  const TextInputBox({required this.label, required this.hintText, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}