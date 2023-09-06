import 'package:flutter/material.dart';
import 'package:iteach/views/welcome_back.dart';

class StudentSignUpPage extends StatelessWidget {
  const StudentSignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Registrati!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Compila i campi sottostanti per registrarti gratuitamente come utente e scoprire i tutori nella tua zona!',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 32.0),
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
                    SizedBox(height: 24.0),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const WelcomeBackPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF0079D2),
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text('Registrati come Studente', style: TextStyle(fontSize: 18)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}