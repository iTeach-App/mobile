import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class WelcomeBackPage extends StatelessWidget {
  const WelcomeBackPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bentrovato'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(FirebaseAuth.instance.currentUser!.email!),
        ),
      ),
    );
  }
}
