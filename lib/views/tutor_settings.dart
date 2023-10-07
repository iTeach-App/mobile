import 'package:flutter/material.dart';

class TutorSettingsPage extends StatefulWidget {
  const TutorSettingsPage({Key? key}) : super(key: key);

  @override
  _TutorSettingsPageState createState() => _TutorSettingsPageState();
}

class _TutorSettingsPageState extends State<TutorSettingsPage> {
  final List<bool> switchStates = List.filled(5, true); // Initialize switch states

  final MaterialStateColor thumbColor = MaterialStateColor.resolveWith((Set<MaterialState> states) {
    if (states.contains(MaterialState.selected)) {
      return Colors.green; // Set the color when the switch is ON
    }
    return Colors.grey; // Set the color when the switch is OFF
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Impostazioni",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          actions: [
            Padding(
            padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
              backgroundImage: AssetImage('assets/profile_image.jpg'),
              ),
            ),
            ],
          ),
    body: Container(
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    color: Colors.lightBlueAccent,
    ),
    child: ListView(
    children: <Widget>[
    _buildDisabledTextButton("Notifiche", "Attivare le notifiche?", icon: Icons.star),
    _buildDisabledTextButton("Numero di telefono", "Mostrare il numero di telefono sul vostro profilo pubblico?", icon: Icons.favorite),
    _buildDisabledTextButton("Contatti", "Collegare la rubrica per avere connessioni dai contatti?", icon: Icons.bookmark),
    _buildDisabledTextButton("Posizione", "Mostrare sulla mappa la posizione del luogo dove terrete lezioni?", icon: Icons.ac_unit_rounded),
    // Add more rows as needed
    ],
    ),
    ),
    );
  }

  TextButton _buildDisabledTextButton(String title, String subtitle, {IconData icon = Icons.star}) {
    return TextButton(
      onPressed: null, // Disabled button
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(0),
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(icon ?? Icons.star),
        trailing: Switch(
          value: false, // Switch is always off
          onChanged: null, // Disable switch
        ),
      ),
    );
  }
}