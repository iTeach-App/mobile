import 'package:flutter/material.dart';
import 'package:iteach/views/create_lecture.dart';

class LecturesPage extends StatefulWidget {
  const LecturesPage({Key? key}) : super(key: key);

  @override
  LecturesPageState createState() => LecturesPageState();
}

class LecturesPageState extends State<LecturesPage> {
  List<Map<String, dynamic>> lectureDataList =
      []; // To store the data from CreateLecturePage

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Le mie lezioni',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView.builder(
        itemCount: lectureDataList.length,
        itemBuilder: (context, index) {
          final lectureData = lectureDataList[index];
          final pricePerHour =
              lectureData['pricePerHour']; // Access the pricePerHour value

          return GestureDetector(
            onTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CreateLecturePage(initialData: lectureData),
                ),
              );

              if (result != null) {
                setState(() {
                  lectureDataList.add(result);
                });
              }
            },
            child: LectureContainer(
              data: lectureData,
              onDelete: () {
                setState(() {
                  lectureDataList.removeAt(index);
                });
              },
              iconData: Icons.info,
              pricePerHour:
                  pricePerHour,
              options: [ // Pass the selected options here
                if (lectureData['online']) 'Online',
                if (lectureData['casaMia']) 'A casa mia',
                if (lectureData['possoSpostarmi']) 'Posso spostarmi',
              ],
            ),
          );

        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Lezioni',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline_rounded),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profilo',
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navigate to CreateLecturePage and await the result
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateLecturePage()),
          );

          // Check if a result was returned
          if (result != null) {
            // Update the state with the returned data
            setState(() {
              lectureDataList.add(result);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class LectureContainer extends StatelessWidget {
  final Map<String, dynamic> data;
  final List<String> options;
  final VoidCallback onDelete;
  final double iconSize; // Icon size
  final IconData iconData; // Icon data to display
  final double titleTextSize; // Title text size
  final String? pricePerHour; // Price per hour data

  const LectureContainer({
    required this.data,
    required this.options,
    required this.onDelete,
    required this.iconData,
    this.iconSize = 48.0, // Increase the icon size here
    this.titleTextSize = 18.0, // Specify the title text size
    this.pricePerHour,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.grey.withOpacity(0.3),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                        Icons.assignment_turned_in_outlined,
                        size: iconSize, // Icon size
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    // Add spacing between icon and text
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${data['subject']}',
                          style: TextStyle(
                            fontSize: titleTextSize - 2.0,
                            // Reduce subject text size
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        // Add spacing between subject and title
                        Text(
                          '${data['title']}',
                          style: TextStyle(
                            fontSize: titleTextSize,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 4.0), // Add spacing before the chips
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Chip(
                                label: Text(
                                  '${pricePerHour ?? ''}€/h',
                                  style: TextStyle(
                                    fontSize: titleTextSize -
                                        2.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Add more chips as needed with Padding
                    ],
                  ),
                ),
                const SizedBox(height: 8.0), // Add spacing before the chip lists
                Center( // Center the second row of chips horizontally
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (String option in options)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Chip(
                            label: Text(
                              option,
                              style: TextStyle(
                                fontSize: titleTextSize - 2.0,
                              ),
                            ),
                            backgroundColor: Colors.grey.withOpacity(0.15), // Change chip color
                          ),
                        ),
                    ],
                  ),
                ),
                // Add more data fields as needed with padding
              ],
            ),
          ),
          Positioned(
              // Position the close button in the top right corner
            top: 0,
            right: 0,
            child: IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.black, // Customize the color of the X icon
              ),
              onPressed: onDelete,
            ),
          ),
        ],
      ),
    );
  }
}
