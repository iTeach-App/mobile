import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonColor1 = const Color(0XFF0060A8).withOpacity(0.11); // #0060A8 at 11% opacity
    final buttonColor2 = const Color(0XFFFFB800).withOpacity(0.11);
    const buttonWidth = 160.0; // Set a fixed width for the buttons
    const buttonHeight = 60.0; // Set a fixed height for the buttons

    const vipTextColor = Color(0XFFFFB800);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profilo',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // Align horizontally at the center
            children: [
              // Profile Picture
              const SizedBox(
                height: 100, // Fixed height for the profile picture
                child: CircleAvatar(
                  radius: 50, // Adjust the size as needed
                  backgroundImage: AssetImage('assets/profile_image.jpg'), // Replace with your image path
                ),
              ),
              const SizedBox(height: 16), // Add vertical spacing between the image and text
              // User Info (First Name and Last Name)
              const Text(
                'Giovanni Bassi',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis, // Add "..." if text overflows
                maxLines: 1, // Display only one line of text
              ),
              const SizedBox(height: 40), // Add vertical spacing between text and buttons
              // Rows of Customized Elevated Buttons
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: buttonWidth,
                            height: buttonHeight,
                            child: ElevatedButton(
                              onPressed: () {
                                // Handle button tap
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white, // Set the background color to white
                                foregroundColor: Colors.black, // Text color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.bar_chart_outlined), // Add an icon here
                                  SizedBox(width: 8), // Add spacing between icon and text
                                  Text(
                                    'Statistiche',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                color: buttonColor1, // Color to overlay on top
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          SizedBox(
                            width: buttonWidth,
                            height: buttonHeight,
                            child: ElevatedButton(
                              onPressed: () {
                                // Handle button tap
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white, // Set the background color to white
                                foregroundColor: Colors.black, // Text color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.rocket_launch_sharp), // Add an icon here
                                  SizedBox(width: 8), // Add spacing between icon and text
                                  Text(
                                    'Livello',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                color: buttonColor1, // Color to overlay on top
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16), // Add vertical spacing between rows
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: buttonWidth,
                            height: buttonHeight,
                            child: ElevatedButton(
                              onPressed: () {
                                // Handle button tap
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white, // Set the background color to white
                                foregroundColor: Colors.black, // Text color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.euro), // Add an icon here
                                  SizedBox(width: 8), // Add spacing between icon and text
                                  Text(
                                    'Guadagni',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                color: buttonColor1, // Color to overlay on top
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          SizedBox(
                            width: buttonWidth,
                            height: buttonHeight,
                            child: ElevatedButton(
                              onPressed: () {
                                // Handle button tap
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white, // Set the background color to white
                                foregroundColor: Colors.black, // Text color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.auto_awesome_outlined, color: vipTextColor), // Add an icon here
                                  SizedBox(width: 8), // Add spacing between icon and text
                                  Text(
                                    'VIP',
                                    style: TextStyle(
                                        color: vipTextColor,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                color: buttonColor2, // Color to overlay on top
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40), // Add vertical spacing between buttons and text field
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0), // Add left and right padding
                child: Align(
                  alignment: Alignment.centerLeft, // Align text field to the left
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Informazioni personali', // Add your label text here
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20, // Adjust the font size as needed
                        color: Colors.black, // Set the text color to black
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide.none, // Remove the line under the label
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.edit, color: Colors.black,), // Add your icon here
                        onPressed: () {
                          // Handle icon button tap
                        },
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
          const Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0), // Add left and right padding
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Nome:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Giovanni Bassi',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 20), // Adjust the spacing between rows as needed
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'E-mail:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'bassgio81@gmail.com',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 20), // Adjust the spacing between rows as needed
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Telefono:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '+39 3425912132',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 20), // Adjust the spacing between rows as needed
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Indirizzo:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Via Geo Fiko, 69',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 20), // Adjust the spacing between rows as needed
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Data di nascita:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '23/09/2002',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 10), // Adjust the spacing between rows as needed
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Password:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: null,
                      child: Text(
                        'Cambia',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue, // Set the text color to blue
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10), // Adjust the spacing between rows as needed
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Titolo di studio:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Diploma',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 10), // Adjust the spacing between rows as needed
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Curriculum Vitae:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: null,
                      child: Text(
                        'Carica',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue, // Set the text color to blue
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                // Add more rows as needed
              ],
            ),
          )

            ],
          ),
        ),
      ),
    );
  }
}
