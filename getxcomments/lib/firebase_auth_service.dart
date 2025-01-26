import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {

  FirebaseAuth _auth = FirebaseAuth.instance;

  //Get current user!
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  //Register with email-pw
  Future<User?> reisterWithEmailPassword(String email, String password) async {

    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;

    } catch(e) {
      throw "Error: ${e.toString()}";
    }
  }

  //SignIn with Email and Password
  Future<User?> signInWithEmailPassword(String email, String password) async {

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;

    } catch (e) {
      throw "Error: ${e.toString()}";
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Stream<User?> get authStateChanges => _auth.authStateChanges();



}