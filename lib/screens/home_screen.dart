import 'package:flutter/material.dart';
import 'package:newsflow/services/firebase_auth_methods.dart';
import 'package:provider/provider.dart';

import 'package:newsflow/screens/login_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: const Center(
        child: Text(
          'Welcome to the Home Screen!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Perform logout action
          _logout(context);
        },
        child: const Icon(Icons.logout),
      ),
    );
  }

  // Logout function
  void _logout(BuildContext context) {
    // Perform logout action using FirebaseAuthMethods or any other provider you have set up
    // For example, using FirebaseAuthMethods:
    final FirebaseAuthMethods authMethods = Provider.of<FirebaseAuthMethods>(context, listen: false);
    authMethods.signOut(); // Replace this with your actual sign-out method

    // After logout, navigate back to the LoginScreen (assuming LoginScreen is the previous route)
    Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => LoginScreen(), // Replace LoginScreen with your actual LoginScreen widget
    ),
    );
  }
}
