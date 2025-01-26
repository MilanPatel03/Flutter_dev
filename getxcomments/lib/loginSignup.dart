import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getxcomments/homepage.dart';

import 'firebase_auth_service.dart';

class Loginsignup extends StatefulWidget {
  const Loginsignup({super.key});

  @override
  State<Loginsignup> createState() => _LoginsignupState();
}

class _LoginsignupState extends State<Loginsignup> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuthService _authService = FirebaseAuthService();

  bool _isSignUp = false;

  void _toggleAuthMode() {
    setState(() {
      _isSignUp =! _isSignUp;
    });
  }
  Future<void> submitAuthForm() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    if(email.isEmpty || password.isEmpty) {
      return;
    }

    try {
      User? user;
      if(_isSignUp){
        user = await _authService.reisterWithEmailPassword(email, password);
      } else {
        user = await _authService.signInWithEmailPassword(email, password);
      }

      if (user != null) {
        // Redirect to another screen (e.g., Home Screen)
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Homepage()),);
      }
    }

    catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: ${e.toString()}")));
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isSignUp ? "SignUp" : "SignIn"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(
                hintText: "Enter email",
                labelText: "email"
            ),
          ),
          TextField(
            controller: _passwordController,
            decoration: const InputDecoration(
              hintText: "Enter password",
              labelText: "password",
            ),
          ),
          SizedBox(height: 20),

          ElevatedButton(onPressed: submitAuthForm, child: Text(_isSignUp? "SignUp" : "SignIn")),

          TextButton(onPressed: _toggleAuthMode, child: Text(_isSignUp? "Already have an account? Login" : "Create Account? Sign Up"),)
        ],
      ),
    );;
  }
}
