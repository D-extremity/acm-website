import 'package:acm_website/widgets/aboutacm.dart';
import 'package:acm_website/widgets/logotitle.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  List<Color> colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

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
