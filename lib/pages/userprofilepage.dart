// ignore_for_file: use_build_context_synchronously

import 'package:acm_website/firebase_methods/signup.dart';
import 'package:acm_website/pages/homepage.dart';
import 'package:acm_website/pages/loginregisterpage.dart';

import 'package:acm_website/widgets/logotitle.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserProfilePage extends StatefulWidget {
  final Map<String, dynamic> detail;
  const UserProfilePage({super.key, required this.detail});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  List<Color> colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];
  TextEditingController getEmail = TextEditingController();
  TextEditingController getbranch = TextEditingController();
  TextEditingController getgithub = TextEditingController();
  TextEditingController getlinkedin = TextEditingController();
  TextEditingController getname = TextEditingController();
  @override
  void initState() {
    super.initState();
    getAuth();
  }

  @override
  Widget build(BuildContext context) {
    // Map<String, dynamic> userData = widget.detail;
    getEmail.text = emailid;
    getbranch.text = branch;
    getgithub.text = github;
    getlinkedin.text = linkedin;
    getname.text = name;

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
                  SizedBox(
                    // width: 250.0,
                    child: AnimatedTextKit(
                      animatedTexts: [
                        ColorizeAnimatedText(
                          'ACM ABESEC',
                          textStyle: getTextStyle(size.width * 0.08),
                          colors: colorizeColors,
                        ),
                        ColorizeAnimatedText(
                          'ACM-W ABESEC',
                          textStyle: getTextStyle(size.width * 0.08),
                          colors: colorizeColors,
                        ),
                      ],
                      isRepeatingAnimation: true,
                      // onTap: () {
                      //   print("Tap Event");
                      // },
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.3,
                    child: Column(
                      children: [
                        CupertinoTextField(
                          placeholder: "Name",
                          controller: getname,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CupertinoTextField(
                          placeholder: "E-mail id",
                          controller: getEmail,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CupertinoTextField(
                          placeholder: "Branch",
                          controller: getbranch,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CupertinoTextField(
                          placeholder: "Github link",
                          controller: getgithub,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CupertinoTextField(
                          placeholder: "Linkedin link",
                          controller: getlinkedin,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: () async {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue.shade800,
                              foregroundColor: Colors.blue.shade200),
                          child: const Text(
                            "Update",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await FirebaseAuthMethods(FirebaseAuth.instance, context)
                          .signout();
                      loginpage = const LoginPage();
                      Navigator.of(context).pushReplacement(
                          CupertinoPageRoute(builder: (context) => const HomePage()));
                      selectedPage = 0;

                      setState(() {});
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: const Text(
                      "Sign Out",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ]),
    ));
  }
}
