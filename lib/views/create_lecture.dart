import 'package:flutter/material.dart';

class CreateLecturePage extends StatefulWidget {
  final Map<String, dynamic>? initialData;

  const CreateLecturePage({Key? key, this.initialData}) : super(key: key);

  @override
  CreateLecturePageState createState() => CreateLecturePageState();
}

class CreateLecturePageState extends State<CreateLecturePage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _myAddressController = TextEditingController();
  final TextEditingController _moneyForMoving = TextEditingController();

  bool online = false;
  bool casaMia = false;
  bool possoSpostarmi = false;
  double? pricePerHour;

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
          icon: const Icon(
            Icons.close,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
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
            child: const Text(
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
                    decoration: const InputDecoration(
                      labelText: 'Titolo dell\'annuncio',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    '*required',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _subjectController,
                    decoration: const InputDecoration(
                      labelText: 'Materia',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    '*required',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    initialValue: 'Input',
                    decoration: const InputDecoration(
                      labelText: 'Tipo di annuncio',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    '*required',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _moneyForMoving,
                    onChanged: (value) {
                      setState(() {
                        pricePerHour = double.tryParse(value);
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Prezzo all\'ora',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    '*required',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  // New "Disponibilità" text box
                  const Text(
                    'Disponibilità',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  // Three tickable options with descriptions on the left and checkboxes on the right
                  buildCheckboxOption('Online', online, (value) {
                    setState(() {
                      online = value ?? false;
                    });
                  }),
                  const SizedBox(height: 8.0),
                  buildCheckboxOption('A casa mia', casaMia, (value) {
                    setState(() {
                      casaMia = value ?? false;
                    });
                  }),
                  const SizedBox(height: 8.0),
                  buildCheckboxOption('Posso spostarmi', possoSpostarmi, (value) {
                    setState(() {
                      possoSpostarmi = value ?? false;
                    });
                  }),
                  const SizedBox(height: 16.0),
                  // Two additional text input boxes with the same style
                  TextFormField(
                    controller: _myAddressController,
                    decoration: const InputDecoration(
                      labelText: 'Il mio indirizzo',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _moneyForMoving,
                    decoration: const InputDecoration(
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
          activeColor: const Color(0xFF7643B5), // Set the custom checkmark color
        ),
      ],
    );
  }

  void _saveAndPop() {
    // Save the data you want to pass back to the previous screen
    Map<String, dynamic> data = {
      'title': _titleController.text,
      'subject': _subjectController.text,
      'online': online,
      'casaMia': casaMia,
      'possoSpostarmi': possoSpostarmi,
      'pricePerHour': _moneyForMoving.text,
    };

    // Pop the current page and pass back the data
    Navigator.pop(context, data);
  }

}