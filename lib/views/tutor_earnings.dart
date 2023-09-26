import 'package:flutter/material.dart';

class TutorEarningsPage extends StatelessWidget {
  const TutorEarningsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Guadagni",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Theme
            .of(context)
            .scaffoldBackgroundColor,
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0), // Add the desired padding
            child: CircleAvatar(
              backgroundImage: AssetImage(
                  'assets/profile_image.jpg'), // Replace with your image path
            ),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          _buildListTile("Title 1", "Data 1", Icons.star),
          Divider(), // Add a divider between rows
          _buildListTile("Title 2", "Data 2", Icons.favorite),
          Divider(), // Add a divider between rows
          _buildListTile("Title 3", "Data 3", Icons.bookmark),
          Divider(),
          _buildListTile("Title 3", "Data 3", Icons.ac_unit_rounded),
          Divider(),
          _buildListTile(
              "Title 3", "Data 3", Icons.baby_changing_station_rounded),
          Divider(),
          _buildListTile("Title 3", "Data 3", Icons.cabin_rounded),
          Divider(),
          _buildListTile("Title 3", "Data 3", Icons.dark_mode),
          Divider(),
          _buildListTile("Title 3", "Data 3", Icons.earbuds_outlined),
          Divider(),
          _buildListTile("Title 3", "Data 3", Icons.face),
          Divider(),
          _buildListTile("Title 3", "Data 3", Icons.g_translate),
          Divider(),
          _buildListTile("Title 3", "Data 3", Icons.hail_outlined),
          Divider(),
          _buildListTile("Title 3", "Data 3", Icons.ice_skating_rounded),
          Divider(),
          // Add more rows as needed
        ],
      ),
    );
  }

  Widget _buildListTile(String title, String data, IconData icon) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(data),
    );
  }

}