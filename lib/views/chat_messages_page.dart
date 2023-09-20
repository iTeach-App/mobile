import 'package:flutter/material.dart';

class ChatMessagesPage extends StatelessWidget {
  final String chatId; // Unique identifier for the chat

  const ChatMessagesPage({super.key, required this.chatId});

  @override
  Widget build(BuildContext context) {
    // Retrieve chat messages based on the chatId and display them here
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Messages $chatId'), // You can customize the title
      ),
      body: Center(
        child: Text('Chat Messages for Chat $chatId'), // Display chat messages here
      ),
    );
  }
}
