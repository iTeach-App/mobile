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
                // Handle updated data if needed
              }
            },
            child: LectureContainer(
              data: lectureData,
              onDelete: () {
                setState(() {
                  lectureDataList.removeAt(index);
                });
              },
              iconData: Icons.info, // Replace with the icon you want
              pricePerHour:
                  pricePerHour, // Pass pricePerHour to LectureContainer
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
  final VoidCallback onDelete;
  final double iconSize; // Icon size
  final IconData iconData; // Icon data to display
  final double titleTextSize; // Title text size
  final String? pricePerHour; // Price per hour data

  const LectureContainer({super.key,
    required this.data,
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
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey.withOpacity(0.2),
        ),
        child: Stack(
          // Wrap the content in a Stack
          children: [
            Column(
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
                            color: Colors.grey, // Change subject text color
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        // Add spacing between subject and title
                        Text(
                          '${data['title']}',
                          style: TextStyle(
                            fontSize: titleTextSize,
                            fontWeight: FontWeight.bold, // Make the title bold
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 4.0), // Add spacing before the chips
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  // Enable horizontal scrolling
                  child: Row(
                    children: [
                      Container(
                        // Create a container to align icon and first chip
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Chip(
                                label: Text(
                                  'Prezzo all\'ora: ${pricePerHour ?? ''}',
                                  style: TextStyle(
                                    fontSize: titleTextSize -
                                        2.0, // Adjust the price text size
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Add additional chips here with Padding
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Chip(
                          label: Text(
                            'Additional Chip 1',
                            style: TextStyle(
                              fontSize: titleTextSize - 2.0,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Chip(
                          label: Text(
                            'Additional Chip 2',
                            style: TextStyle(
                              fontSize: titleTextSize - 2.0,
                            ),
                          ),
                        ),
                      ),
                      // Add more chips as needed with Padding
                    ],
                  ),
                ),
                // Add more data fields as needed with padding
              ],
            ),
            Positioned(
              // Position the close button in the top right corner
              top: 0,
              right: 0,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: onDelete,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
