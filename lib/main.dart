import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newsflow/screens/login_screen.dart';
import 'package:newsflow/screens/signin_screen.dart';
import 'package:newsflow/screens/signup_screen.dart';
import 'package:newsflow/services/firebase_auth_methods.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FirebaseAuthMethods>(
          create: (_) => FirebaseAuthMethods(),
        ),
      ],
      child: MaterialApp(
        title: 'NewsFlow',
        home: const LoginScreen(),
        routes: {
          SignUpScreen.routeName: (context) => const SignUpScreen(),
          SignInScreen.routeName: (context) => const SignInScreen(),
        },
      ),
    );
  }
}

