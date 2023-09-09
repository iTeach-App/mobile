import 'package:flutter/material.dart';
import 'package:iteach/views/loading.dart';

Future<void> main() async {
  runApp(const MaterialApp(
    title: 'iTeach',
    home: LoadingPage(),
  ));
}

class StyledTextInputBox extends StatelessWidget {
  final String label;
  final String hintText;

  const StyledTextInputBox({
    required this.label,
    required this.hintText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8.0), // Add spacing between label and input field
          TextField(
            decoration: InputDecoration(
              hintText: hintText,
              border: const OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}

class TextInputBox extends StatelessWidget {
  final String label;
  final String hintText;

  const TextInputBox({required this.label, required this.hintText, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}