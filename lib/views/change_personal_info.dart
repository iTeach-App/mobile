import 'package:flutter/material.dart';

class EditPersonalInfoDialog extends StatelessWidget {
  const EditPersonalInfoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Modifica le informazioni personali'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            // Add form fields to edit personal information here
            TextFormField(
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'E-mail'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Telefono'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Indirizzo'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Data di nascita'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Titolo di studio'),
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            // Handle the save button in the dialog
            // Update the personal information
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text('Save'),
        ),
      ],
    );
  }
}
