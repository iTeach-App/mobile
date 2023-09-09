import 'package:flutter/material.dart';
import 'package:iteach/views/lectures.dart';

class TutorSignUpPage extends StatelessWidget {
  const TutorSignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    const Text(
                      'Registrati!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Compila i campi sottostanti per registrarti gratuitamente come tutor e farti conoscere nella tua zona!',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32.0),
                    TextFormField(
                      initialValue: 'Input',
                      decoration: const InputDecoration(
                        labelText: 'Nome',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      initialValue: 'Input',
                      decoration: const InputDecoration(
                        labelText: 'Cognome',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      initialValue: 'Input',
                      decoration: const InputDecoration(
                        labelText: 'Data di nascita',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      initialValue: 'Input',
                      decoration: const InputDecoration(
                        labelText: 'E-mail',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      initialValue: 'Input',
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      initialValue: 'Input',
                      decoration: const InputDecoration(
                        labelText: 'Ripeti password',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const LecturesPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white, backgroundColor: const Color(0xFF0079D2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text('Registrati come Tutor', style: TextStyle(fontSize: 18)),
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