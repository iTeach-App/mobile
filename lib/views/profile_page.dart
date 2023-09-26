import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:iteach/views/tutor_settings.dart';
import 'package:iteach/views/change_personal_info.dart'; // For File class
import 'dart:io';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:iteach/views/tutor_stats.dart';
import 'package:iteach/views/tutor_level.dart';
import 'package:iteach/views/tutor_earnings.dart';
import 'package:iteach/views/tutor_vip.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  PDFDocument? pdfDocument;
  String? pdfFilePath;

    //CODICE QR (Non funzia dc)
 /* Future<void> _showQRCodeDialog(BuildContext context, String qrData) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("QR Code"),
          content: QrImage(
            data: qrData,
            version: QrVersions.auto,
            size: 200.0, // Adjust the size of the QR code
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }

*/

  Future<void> loadPDF() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      final filePath = result.files.single.path;
      setState(() {
        pdfFilePath = filePath;
      });

      if (filePath != null) {
        pdfDocument = await PDFDocument.fromFile(File(filePath));
      }
    }
  }

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: IconButton(
                        iconSize: 35,
                        icon: const Icon(Icons.qr_code_scanner_rounded),
                        onPressed: () {
                          //final qrData = '1234567890'; // Replace with your data
                          //_showQRCodeDialog(context, qrData);
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: IconButton(
                        iconSize: 35,
                        icon: const Icon(Icons.settings_outlined),
                        onPressed: () async {
                          // Navigate to TutorSettingsPage and await the result
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const TutorSettingsPage()),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
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
                          Container(
                            width: buttonWidth,
                            height: buttonHeight,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(12.0),
                             color: Colors.white,
                             boxShadow: const <BoxShadow>[
                               BoxShadow(
                                   color: Colors.grey,
                                   blurRadius: 2.0,
                                   offset: Offset(0.0, 1.0)
                               ),
                               BoxShadow(
                                   color: Color(0XFFFDFCFF),
                                   blurRadius: 2.0,
                                   offset: Offset(4.0, -3.0)
                               ),
                               BoxShadow(
                                   color: Color(0XFFFDFCFF),
                                   blurRadius: 2.0,
                                   offset: Offset(-4.0, -3.0),
                               )
                             ],
                           ),
                           child: SizedBox(
                            width: buttonWidth,
                            height: buttonHeight,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: buttonColor1, // Set the background color to white
                                foregroundColor: Colors.black, // Text color
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),

                                ),
                              ),
                              onPressed: () async {
                                print("Button tapped");
                                final result = await Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => TutorStatsPage()),
                                );
                                print("Navigation result: $result");
                              },
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
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            width: buttonWidth,
                            height: buttonHeight,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: Colors.white,
                              boxShadow: const <BoxShadow>[
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 2.0,
                                    offset: Offset(0.0, 1.0)
                                ),
                                BoxShadow(
                                    color: Color(0XFFFDFCFF),
                                    blurRadius: 2.0,
                                    offset: Offset(4.0, -3.0)
                                ),
                                BoxShadow(
                                  color: Color(0XFFFDFCFF),
                                  blurRadius: 2.0,
                                  offset: Offset(-4.0, -3.0),
                                )
                              ],
                            ),
                            child: SizedBox(
                              width: buttonWidth,
                              height: buttonHeight,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: buttonColor1, // Set the background color to white
                                  foregroundColor: Colors.black, // Text color
                                  shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),

                                  ),
                                ),
                                onPressed: () async {
                                  final result = await Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => TutorLevelPage()),
                                  );
                                },
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
                          Container(
                            width: buttonWidth,
                            height: buttonHeight,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: Colors.white,
                              boxShadow: const <BoxShadow>[
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 2.0,
                                    offset: Offset(0.0, 1.0)
                                ),
                                BoxShadow(
                                    color: Color(0XFFFDFCFF),
                                    blurRadius: 2.0,
                                    offset: Offset(4.0, -3.0)
                                ),
                                BoxShadow(
                                  color: Color(0XFFFDFCFF),
                                  blurRadius: 2.0,
                                  offset: Offset(-4.0, -3.0),
                                )
                              ],
                            ),
                            child: SizedBox(
                              width: buttonWidth,
                              height: buttonHeight,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: buttonColor1, // Set the background color to white
                                  foregroundColor: Colors.black, // Text color
                                  shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),

                                  ),
                                ),
                                onPressed: () async {
                                  final result = await Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => TutorEarningsPage()),
                                  );
                                },
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
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            width: buttonWidth,
                            height: buttonHeight,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: Colors.white,
                              boxShadow: const <BoxShadow>[
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 2.0,
                                    offset: Offset(0.0, 1.0)
                                ),
                                BoxShadow(
                                    color: Color(0XFFFDFCFF),
                                    blurRadius: 2.0,
                                    offset: Offset(4.0, -3.0)
                                ),
                                BoxShadow(
                                  color: Color(0XFFFDFCFF),
                                  blurRadius: 2.0,
                                  offset: Offset(-4.0, -3.0),
                                )
                              ],
                            ),
                            child: SizedBox(
                              width: buttonWidth,
                              height: buttonHeight,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: buttonColor2, // Set the background color to white
                                  foregroundColor: const Color(0XFFFFB800), // Text color
                                  shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),

                                  ),
                                ),
                                onPressed: () async {
                                  final result = await Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => TutorVIPPage()),
                                  );
                                },
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.auto_awesome_outlined, color: Color(0XFFFFB800)), // Add an icon here
                                    SizedBox(width: 8), // Add spacing between icon and text
                                    Text(
                                      'VIP',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
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
                        icon: const Icon(Icons.edit, color: Colors.black,),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return EditPersonalInfoDialog();
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0), // Add left and right padding
                child: Column(
                  children: [
                    const Row(
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
                    const SizedBox(height: 20), // Adjust the spacing between rows as needed
                    const Row(
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
                    const SizedBox(height: 20), // Adjust the spacing between rows as needed
                    const Row(
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
                    const SizedBox(height: 20), // Adjust the spacing between rows as needed
                    const Row(
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
                    const SizedBox(height: 20), // Adjust the spacing between rows as needed
                    const Row(
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
                    const SizedBox(height: 20), // Adjust the spacing between rows as needed
                    const Row(
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
                    const SizedBox(height: 10), // Adjust the spacing between rows as needed
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Curriculum Vitae:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            loadPDF();
                          },
                          child: const Text(
                            'Carica',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                    //SizedBox(height: 10), // Adjust the spacing between rows as needed
                    const Row(
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
                    const SizedBox(height: 8),
                    Visibility(
                      visible: pdfFilePath != null,
                      child: Column(
                        children: [
                          if (pdfFilePath != null)
                            SizedBox(
                              height: 400,
                              child: PDFViewer(document: pdfDocument!),
                            ),
                          const SizedBox(height: 8),
                          // Add more rows or widgets as needed
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
