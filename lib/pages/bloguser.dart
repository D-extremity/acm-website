// ignore_for_file: use_build_context_synchronously

import 'package:acm_website/pages/homepage.dart';

import 'package:acm_website/widgets/logotitle.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogUserPage extends StatefulWidget {
  final Map<String, dynamic> detail;
  const BlogUserPage({super.key, required this.detail});

  @override
  State<BlogUserPage> createState() => _BlogUserPageState();
}

class _BlogUserPageState extends State<BlogUserPage> {
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
                          textStyle: getTextStyle(size.width * 0.06),
                          colors: colorizeColors,
                        ),
                        ColorizeAnimatedText(
                          'ACM-W ABESEC',
                          textStyle: getTextStyle(size.width * 0.06),
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
                        Text(
                          widget.detail['name'],
                          style: getTextStyle(size.width * 0.02),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.detail['branch'],
                          style: getTextStyle(size.width * 0.02),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                await _launchUrl(widget.detail['github']);
                              },
                              child: Image.asset(
                                "assets/github.png",
                                height: 40,
                                width: 40,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () async {
                                await _launchUrl(widget.detail['linkedin']);
                              },
                              child: Image.asset(
                                "assets/linkedin.png",
                                height: 40,
                                width: 40,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue.shade800,
                              foregroundColor: Colors.blue.shade200),
                          child: const Text(
                            "Back",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
              Center(
                child: Text("Made with 💖 by Satyam Srivastav",
                    style: getTextStyle(size.width*0.016)),
              ),
            ],
          ),
        )
      ]),
    ));
  }
}

Future<void> _launchUrl(String _url) async {
  if (!await launchUrl(Uri.parse(_url))) {
    throw Exception('Could not launch $_url');
  }
}
