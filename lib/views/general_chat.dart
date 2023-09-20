import 'package:flutter/material.dart';
import 'package:iteach/views/chat_messages_page.dart';

class GeneralChatPage extends StatefulWidget {
  const GeneralChatPage({Key? key}) : super(key: key);

  @override
  _GeneralChatPageState createState() => _GeneralChatPageState();
}

class _GeneralChatPageState extends State<GeneralChatPage> {
  List<ChatMessage> chatMessages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text(
          'Chat (showing just to style them)',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.0,
          ),
        ),
        centerTitle: true,
      ),
      body: chatMessages.isEmpty
          ? const Center(
        child: Text(
          'Ancora nessuna chat',
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      )
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: chatMessages.length,
          itemBuilder: (context, index) {
            final message = chatMessages[index];
            return GestureDetector(
              onTap: () {
                // Navigate to the chat messages page when tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ChatMessagesPage(chatId: message.chatId),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                            NetworkImage(message.profileImageUrl),
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  message.sender,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                                const SizedBox(height: 4.0),
                                Text(
                                  message.text,
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () {
                              setState(() {
                                chatMessages.removeAt(index);
                              });
                            },
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.black,
                        thickness: 2.0,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF0079D2),
        onPressed: () {
          // Simulate receiving a new chat message
          final newMessage = ChatMessage(
            sender: 'User 3', // Replace with actual sender
            text: 'Hello from User 3!', // Replace with actual message
            profileImageUrl: 'URL_TO_PROFILE_IMAGE',
            onClose: () {},
            chatId: 'UniqueChatID', // Replace with a unique chat ID
          );

          setState(() {
            chatMessages.add(newMessage);
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ChatMessage {
  final String sender;
  final String text;
  final String profileImageUrl;
  final VoidCallback onClose;
  final String chatId; // Unique identifier for the chat

  ChatMessage({
    required this.sender,
    required this.text,
    required this.profileImageUrl,
    required this.onClose,
    required this.chatId,
  });
}
