// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:acm_website/firebase_methods/signup.dart';
import 'package:acm_website/widgets/aboutacm.dart';
import 'package:acm_website/widgets/logotitle.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

var isloginpage = false;
late var loginpage;
Map<String, dynamic> userDetails = {};
String name = "";
String branch = "";
String linkedin = "";
String github = "";
String emailid = "";
getAuth() async {
  // isloginpage = await FirebaseAuth.instance.authStateChanges().isEmpty;
  // print(isloginpage);
  // loginpage = isloginpage ? const LoginPage() : const UserProfilePage();
  // if (isloginpage) {
  // print(FirebaseAuth.instance.currentUser!.uid);
  userDetails = await getUserDetails(FirebaseAuth.instance.currentUser!.uid);
  name = userDetails['name'];
  branch = userDetails['branch'];
  linkedin = userDetails['linkedin'];
  github = userDetails['github'];
  emailid = userDetails['email'];
  // print(userDetails);
  return userDetails;
  // }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Stack(fit: StackFit.loose, children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            "assets/bg.jpg",
            fit: BoxFit.fill,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12.0, left: 12.0),
          child: ListView(
            children: [
              //!!! Custom Navigation Bar
              const SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  logotitle(size: size),
                  getNavigationButton(size, context),
                ],
              ),
              //!!! Custom Navigation Bar
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  getAboutACM(size),
                  getEvent(size, context),
                  getBytesACM(size, context),
                ],
              ),
            ],
          ),
        )
      ]),
    ));
  }
}
