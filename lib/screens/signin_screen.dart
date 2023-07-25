import 'package:flutter/material.dart';
import 'package:newsflow/widgets/custom_textfeild.dart';
import 'package:newsflow/services/firebase_auth_methods.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

class SignInScreen extends StatefulWidget {
  static String routeName = '/signin-email-password';
  const SignInScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void signInUser() async {
    context
        .read<FirebaseAuthMethods>()
        .signInWithEmailAndPassword(
          email: emailController.text, 
          password: passwordController.text, 
          context: context, 
        );
        // Navigate to the next screen after successful sign-up
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(), // Replace NextScreen with your desired screen.
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Image.asset(
          'assets/images/news-192.png',
          fit: BoxFit.contain,
          height: 48,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Sign In",
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.fromLTRB(30, 10, 30, 0),
            child: CustomTextFeild(
              controller: emailController,
              hintText: 'Email',
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.fromLTRB(30, 10, 30, 0),
            child: CustomTextFeild(
              controller: passwordController,
              hintText: 'Password',
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: signInUser,
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
              ),
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            child: const Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
