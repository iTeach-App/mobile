import 'package:flutter/material.dart';
import 'package:iteach/views/create_lecture.dart';

class LecturesPage extends StatefulWidget {
  const LecturesPage({Key? key}) : super(key: key);

  @override
  LecturesPageState createState() => LecturesPageState();
}

class LecturesPageState extends State<LecturesPage> {
  List<Map<String, dynamic>> lectureDataList = []; // To store the data from CreateLecturePage

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
          return GestureDetector(
            onTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreateLecturePage(initialData: lectureData),
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
            )

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

  const LectureContainer({
    super.key,
    required this.data,
    required this.onDelete,
    required this.iconData,
    this.iconSize = 32.0,
    this.titleTextSize = 18.0, // Specify the title text size
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0), // Add padding
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), // Round corners
          color: Colors.grey.withOpacity(0.2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(
                        iconData,
                        size: iconSize, // Specify the icon size
                      ), // Icon on the top-left corner
                      SizedBox(width: 8.0), // Add spacing between icon and text
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${data['title']}',
                            style: TextStyle(fontSize: titleTextSize), // Specify the title text size
                          ),
                          Text('${data['subject']}'),
                        ],
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close), // X button icon
                  onPressed: onDelete,
                ),
              ],
            ),
            // Add more data fields as needed with padding
          ],
        ),
      ),
    );
  }
}
