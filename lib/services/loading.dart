import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart';
import 'package:flutter/foundation.dart';

class LoadingService {
  LoadingService._privateConstructor();

  static final LoadingService instance = LoadingService._privateConstructor();

  factory LoadingService() {
    return instance;
  }

  final List<Function> _toinitialize = [
    initializeFirebase,
  ];

  Future<void> initializeApp() async {
    debugPrint('Start app initialization');
    await Future.wait(_toinitialize.map((e) => e()));
    debugPrint('End app initialization');
  }

  static Future<void> initializeFirebase() async {
    if (kDebugMode) {
      // keep some delay during debug mode to see the loading screen
      await Future.delayed(const Duration(seconds: 2));
    }
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}