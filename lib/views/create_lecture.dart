import 'package:flutter/material.dart';
class CreateLecturePage extends StatelessWidget {
  const CreateLecturePage({Key? key});

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