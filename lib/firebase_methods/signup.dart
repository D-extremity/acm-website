// ignore_for_file: use_build_context_synchronously

import 'package:acm_website/pages/homepage.dart';
import 'package:acm_website/pages/userprofilepage.dart';
import 'package:acm_website/utils/scaffoldtoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  final BuildContext context;
  FirebaseAuthMethods(this._auth, this.context);

  Future<void> signup(
      {required String email,
      required String password,
      required String name,
      required String branch,
      required String github,
      required String linkedin}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await uploadDetail(name, branch, github, linkedin, password, email);
      await sendVerification(email);
      if (_auth.currentUser!.emailVerified) {
        getScaffold("Account Created Successfully,", Colors.green, context);
      } else {
        getScaffold("Please verify your email", Colors.orange, context);
      }
    } on FirebaseAuthException catch (e) {
      getScaffold("Some problem occurred , try again later ${e.message}",
          Colors.red, context);
    }
  }

  Future<void> sendVerification(String email) async {
    try {
      await _auth.currentUser!.sendEmailVerification();
      getScaffold("Verification Email sent to $email", Colors.orange, context);
    } catch (e) {
      getScaffold("Some error occurred", Colors.red, context);
    }
  }

  Future<void> loginEmail(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      if (_auth.currentUser!.emailVerified) {
       await getAuth();
        Navigator.of(context).pushReplacement(
            CupertinoPageRoute(builder: (context) => UserProfilePage(detail: userDetails,)));
      } else {
        getScaffold("Verify your email", Colors.orange, context);
      }
    } catch (e) {
      getScaffold("Some error occurred", Colors.red, context);
    }
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> uploadDetail(String name, String branch, String github,
      String linkedin, String password, String email) async {
    Map<String, String> user = {
      'name': name,
      'password': password,
      'email': email,
      'branch': branch,
      'linkedin': linkedin,
      'github': github,
      'uid': _auth.currentUser!.uid,
    };
    await _firestore.collection('users').doc(_auth.currentUser!.uid).set(user);
  }

  Future<void> signout() async {
    try {
      await _auth.signOut();
      getScaffold("Signed out Successfully", Colors.green, context);
    } catch (e) {
      getScaffold(e.toString(), Colors.red, context);
    }
  }
}

Future<Map<String, dynamic>> getUserDetails(String uid) async {
  DocumentSnapshot snap =
      await FirebaseFirestore.instance.collection("users").doc(uid).get();
  // print((dataDocument.data() as Map<String, String>).toString() +"line 87 loginregistration.dart");
  return (snap.data() as Map<String, dynamic>);
}
