import 'package:flutter/material.dart';

class CreateLecturePage extends StatefulWidget {
  final Map<String, dynamic>? initialData;

  const CreateLecturePage({Key? key, this.initialData}) : super(key: key);

  @override
  _CreateLecturePageState createState() => _CreateLecturePageState();
}

class _CreateLecturePageState extends State<CreateLecturePage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _subjectController = TextEditingController();
  TextEditingController _myAddressController = TextEditingController();
  TextEditingController _moneyForMoving = TextEditingController();

  bool online = false;
  bool casaMia = false;
  bool possoSpostarmi = false;

  @override
  void initState() {
    super.initState();

    // Pre-fill the text fields with initial data
    if (widget.initialData != null) {
      _titleController.text = widget.initialData!['title'] ?? '';
      _subjectController.text = widget.initialData!['subject'] ?? '';
      online = widget.initialData!['online'] ?? false;
      casaMia = widget.initialData!['casaMia'] ?? false;
      possoSpostarmi = widget.initialData!['possoSpostarmi'] ?? false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Crea Lezione',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Add your functionality for the right text button here
              _saveAndPop(); // Call this function to save the data and pop the page
            },
            child: Text(
              'Conferma',
              style: TextStyle(
                color: Color(0xFF0060A8),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: _titleController,
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
                    controller: _subjectController,
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
                  ),
                  SizedBox(height: 16.0),
                  // New "Disponibilità" text box
                  Text(
                    'Disponibilità',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  // Three tickable options with descriptions on the left and checkboxes on the right
                  buildCheckboxOption('Online', online, (value) {
                    setState(() {
                      online = value ?? false;
                    });
                  }),
                  SizedBox(height: 8.0),
                  buildCheckboxOption('A casa mia', casaMia, (value) {
                    setState(() {
                      casaMia = value ?? false;
                    });
                  }),
                  SizedBox(height: 8.0),
                  buildCheckboxOption('Posso spostarmi', possoSpostarmi, (value) {
                    setState(() {
                      possoSpostarmi = value ?? false;
                    });
                  }),
                  SizedBox(height: 16.0),
                  // Two additional text input boxes with the same style
                  TextFormField(
                    controller: _myAddressController,
                    decoration: InputDecoration(
                      labelText: 'Il mio indirizzo',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _moneyForMoving,
                    decoration: InputDecoration(
                      labelText: 'Incremento per lo spostamento',
                      border: OutlineInputBorder(),
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

  Widget buildCheckboxOption(String title, bool value, void Function(bool?) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: Color(0xFF7643B5), // Set the custom checkmark color
        ),
      ],
    );
  }

  // Function to save data and pop the page
  void _saveAndPop() {
    // Save the data you want to pass back to the previous screen
    Map<String, dynamic> data = {
      'title': _titleController.text,
      'subject': _subjectController.text,
      'online': online,
      'casaMia': casaMia,
      'possoSpostarmi': possoSpostarmi,
    };

    // Pop the current page and pass back the data
    Navigator.pop(context, data);
  }
}
