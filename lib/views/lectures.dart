import 'package:flutter/material.dart';
import 'package:iteach/views/create_lecture.dart';

class LecturesPage extends StatefulWidget {
  const LecturesPage({Key? key}) : super(key: key);

  @override
  LecturesPageState createState() => LecturesPageState();
}

class LecturesPageState extends State<LecturesPage> {
  List<Map<String, dynamic>> lectureDataList =
      [];

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
          color: Colors.black,
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
              lectureData['pricePerHour'];
          final announcementType = lectureData['announcementType'];

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
              announcementType: announcementType,
              descriptionLecture: lectureData['descriptionLecture'],
              options: [
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
            MaterialPageRoute(builder: (context) => CreateLecturePage()),
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
        backgroundColor: const Color(0xFF0079D2), // Set the blue color
      ),
    );
  }
}

class LectureContainer extends StatelessWidget {
  final Map<String, dynamic> data;
  final List<String> options;
  final String? announcementType;
  final VoidCallback onDelete;
  final double iconSize;
  final IconData iconData;
  final double titleTextSize;
  final String? pricePerHour;
  final String? descriptionLecture;

  const LectureContainer({
    required this.data,
    required this.options,
    required this.onDelete,
    required this.iconData,
    this.iconSize = 48.0,
    this.titleTextSize = 18.0,
    this.pricePerHour,
    this.announcementType,
    this.descriptionLecture,
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
                        size: iconSize,
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${data['subject']}',
                          style: TextStyle(
                            fontSize: titleTextSize - 2.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          '${announcementType ?? ''}',
                          style: TextStyle(
                            fontSize: titleTextSize,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 4.0),
                Row(
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
                    if (descriptionLecture != null)
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Container(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              '"${descriptionLecture}"',
                              style: TextStyle(
                                fontSize: titleTextSize - 2.0,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: options.map((option) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Chip(
                        label: Text(
                          option,
                          style: TextStyle(
                            fontSize: titleTextSize - 2.0,
                          ),
                        ),
                        backgroundColor: Colors.grey.withOpacity(0.15),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.black,
              ),
              onPressed: onDelete,
            ),
          ),
        ],
      ),
    );
  }
}
