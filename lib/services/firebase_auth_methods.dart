import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  
  // Sign in with Google

  Future<User?> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      
      final UserCredential authResult =
          await _auth.signInWithCredential(credential);
      final User? user = authResult.user;
      assert(!user!.isAnonymous);
      assert(await user!.getIdToken() != null);
      final User? currentUser = _auth.currentUser;
      assert(user!.uid == currentUser!.uid);
      return user;
    } catch (e) {
      showSnackBar(
        context: context,
        content: 'Something went wrong. Please try again later.',
      );
      return null;
    }
  }

  // Sign up with email and password

  Future<User?> signUpWithEmailAndPassword({
      required String email,
      required String password,
      required BuildContext context,  // Pass the context from the widget calling this method 

    }) async {
    try {
      final UserCredential authResult = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      final User? user = authResult.user;
      assert(!user!.isAnonymous);
      assert(await user!.getIdToken() != null);
      return user;
    } catch (e) {
      showSnackBar(
        context: context,
        content: 'Something went wrong. Please try again later.',
      );
      return null;
    }
  }

  // Sign in with email and password

  Future<User?> signInWithEmailAndPassword({
      required String email,
      required String password,
      required BuildContext context,  // Pass the context from the widget calling this method 

    }) async {
    try {
      final UserCredential authResult = await _auth
          .signInWithEmailAndPassword(email: email, password: password);
      final User? user = authResult.user;
      assert(!user!.isAnonymous);
      assert(await user!.getIdToken() != null);
      return user;
    } catch (e) {
      showSnackBar(
        context: context,
        content: 'Something went wrong. Please try again later.',
      );
      return null;
    }
  }

  // Sign out

  Future<void> signOut(context) async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
    } catch (e) {
      showSnackBar(
        context: context,
        content: 'Something went wrong. Please try again later.',
      );
    }
  }
  

  // Show SnackBar
  void showSnackBar({required BuildContext context, required String content}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
      ),
    );
  }
}
