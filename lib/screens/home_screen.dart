import 'package:flutter/material.dart';
import 'package:newsflow/services/firebase_auth_methods.dart';
import 'package:provider/provider.dart';

import 'package:newsflow/screens/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        automaticallyImplyLeading: false,
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
    final FirebaseAuthMethods authMethods = Provider.of<FirebaseAuthMethods>(context, listen: false);
    authMethods.signOut(context); // Replace this with your actual sign-out method

    Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => const LoginScreen(), 
    ),
    (route) => false,
    );
  }
}
