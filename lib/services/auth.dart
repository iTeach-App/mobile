import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  AuthService._privateConstructor();

  static final AuthService instance = AuthService._privateConstructor();

  factory AuthService() {
    return instance;
  }

  /// Sign in with email and password
  ///
  /// Returns a [Future] that resolves to a [User] object
  Future<User?> loginEmail(String email, String password) async {
    return FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value) => value.user);
  }

}