
import 'package:acm_website/firebase_methods/signup.dart';
import 'package:acm_website/mobilelayout/mobilewidgets/logotitle.dart';
import 'package:acm_website/utils/scaffoldtoast.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MobileLoginPage extends StatefulWidget {
  const MobileLoginPage({super.key});

  @override
  State<MobileLoginPage> createState() => _MobileLoginPageState();
}

class _MobileLoginPageState extends State<MobileLoginPage> {
  List<Color> colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];
  TextEditingController getEmail = TextEditingController();
  TextEditingController getPassword = TextEditingController();
  TextEditingController getsignPassword = TextEditingController();
  TextEditingController getsignEmail = TextEditingController();
  TextEditingController getbranch = TextEditingController();
  TextEditingController getgithub = TextEditingController();
  TextEditingController getlinkedin = TextEditingController();
  TextEditingController getname = TextEditingController();
  TextEditingController getsignrepassword = TextEditingController();
  @override
  void initState() {
    super.initState();
    // getAuth();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuthMethods firebaseMethods =
        FirebaseAuthMethods(FirebaseAuth.instance, context);
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          drawer:getDrawer(size, context) ,
          appBar: AppBar(title: Mobilelogotitle(size: size),),
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
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Mobilelogotitle(size: size),
              //     getMobileNavigationButton(size, context),
              //   ],
              // ),
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
                          'Login',
                          textStyle: getTextStyle(size.width * 0.08),
                          colors: colorizeColors,
                        ),
                        ColorizeAnimatedText(
                          'Register',
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
                  loginORsignup == 0
                      ? SizedBox(
                          width: size.width * 0.3,
                          child: Column(
                            children: [
                              CupertinoTextField(
                                placeholder: "E-mail id",
                                controller: getEmail,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CupertinoTextField(
                                placeholder: "Password",
                                controller: getPassword,
                                obscureText: true,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      if (loginORsignup == 0) {
                                        setState(() {
                                          loginORsignup = 1;
                                        });
                                      }
                                    },
                                    child: Text(
                                      "Create Account",
                                      style: TextStyle(
                                          color: Colors.blue.shade800,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Text(
                                    "Forgot Possword?",
                                    style: TextStyle(
                                        color: Colors.blue.shade800,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  if (getEmail.text.length > 4 &&
                                      getPassword.text.length > 4) {
                                    await firebaseMethods.loginEmail(
                                        getEmail.text, getPassword.text);
                                  } else {
                                    getScaffold(
                                        "Recheck your email and password",
                                        Colors.red,
                                        context);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue.shade800,
                                    foregroundColor: Colors.blue.shade200),
                                child: const Text(
                                  "Login",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        )
                      : SizedBox(
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
                                controller: getsignEmail,
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
                              CupertinoTextField(
                                placeholder: "Password",
                                obscureText: true,
                                controller: getsignPassword,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CupertinoTextField(
                                placeholder: "Re-enter Password",
                                obscureText: true,
                                controller: getsignrepassword,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (loginORsignup == 1) {
                                    setState(() {
                                      loginORsignup = 0;
                                    });
                                  }
                                },
                                child: Text(
                                  "Already have an Account? Login",
                                  style: TextStyle(
                                      color: Colors.blue.shade800,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  if (getsignEmail.text.length > 4 &&
                                      getsignPassword.text.length > 4) {
                                    if (getsignPassword.text ==
                                        getsignrepassword.text) {
                                      await firebaseMethods.signup(
                                          email: getsignEmail.text,
                                          password: getsignPassword.text,
                                          name: getname.text,
                                          branch: getbranch.text,
                                          github: getgithub.text,
                                          linkedin: getlinkedin.text);
                                    } else {
                                      getScaffold("Password didn't match",
                                          Colors.red, context);
                                    }
                                  } else {
                                    // print("ok2");

                                    getScaffold(
                                        "Recheck your email and password",
                                        Colors.red,
                                        context);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue.shade800,
                                    foregroundColor: Colors.blue.shade200),
                                child: const Text(
                                  "Sign Up",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                  SizedBox(
                    height: size.height * 0.36,
                  )
                ],
              ),
              Center(
                child: Text("Made with 💖 by Satyam Srivastav",
                    style: getTextStyle(size.width * 0.016)),
              ),
            ],
          ),
        )
      ]),
    ));
  }
}

int loginORsignup = 0;

// ignore: camel_case_types
class loginWidget extends StatefulWidget {
  final Size size;
  final BuildContext context;
  const loginWidget({super.key, required this.context, required this.size});

  @override
  State<loginWidget> createState() => _loginWidgetState();
}

// ignore: camel_case_types
class _loginWidgetState extends State<loginWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size.width * 0.3,
      child: Column(
        children: [
          const CupertinoTextField(
            placeholder: "E-mail id",
          ),
          const SizedBox(
            height: 10,
          ),
          const CupertinoTextField(
            placeholder: "Password",
            obscureText: true,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  if (loginORsignup == 0) {
                    setState(() {
                      loginORsignup = 1;
                    });
                  }
                },
                child: Text(
                  "Create Account",
                  style: TextStyle(
                      color: Colors.blue.shade800, fontWeight: FontWeight.w500),
                ),
              ),
              Text(
                "Forgot Possword?",
                style: TextStyle(
                    color: Colors.blue.shade800, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade800,
                foregroundColor: Colors.blue.shade200),
            child: const Text(
              "Login",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class signupWidget extends StatefulWidget {
  final Size size;
  final BuildContext context;
  const signupWidget({super.key, required this.context, required this.size});
  @override
  State<signupWidget> createState() => _signupWidgetState();
}

// ignore: camel_case_types
class _signupWidgetState extends State<signupWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size.width * 0.3,
      child: Column(
        children: [
          const CupertinoTextField(
            placeholder: "Name",
          ),
          const SizedBox(
            height: 10,
          ),
          const CupertinoTextField(
            placeholder: "E-mail id",
          ),
          const SizedBox(
            height: 10,
          ),
          const CupertinoTextField(
            placeholder: "Branch",
          ),
          const SizedBox(
            height: 10,
          ),
          const CupertinoTextField(
            placeholder: "Section",
          ),
          const SizedBox(
            height: 10,
          ),
          const CupertinoTextField(
            placeholder: "Github link",
          ),
          const SizedBox(
            height: 10,
          ),
          const CupertinoTextField(
            placeholder: "Linkedin link",
          ),
          const SizedBox(
            height: 10,
          ),
          const CupertinoTextField(
            placeholder: "Password",
            obscureText: true,
          ),
          const SizedBox(
            height: 10,
          ),
          const CupertinoTextField(
            placeholder: "Re-enter Password",
            obscureText: true,
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              if (loginORsignup == 1) {
                setState(() {
                  loginORsignup = 0;
                });
              }
            },
            child: Text(
              "Already have an Account? Login",
              style: TextStyle(
                  color: Colors.blue.shade800, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade800,
                foregroundColor: Colors.blue.shade200),
            child: const Text(
              "Sign Up",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
