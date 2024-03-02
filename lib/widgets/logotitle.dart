// ignore_for_file: use_build_context_synchronously

import 'package:acm_website/pages/blogpage.dart';
import 'package:acm_website/pages/eventpage.dart';
import 'package:acm_website/pages/homepage.dart';
import 'package:acm_website/pages/teampage.dart';
import 'package:acm_website/utils/scaffoldtoast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Map<String, dynamic> getMap = {};

// ignore: camel_case_types
class logotitle extends StatelessWidget {
  const logotitle({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          SizedBox(
              height: size.height * 0.14,
              width: size.width * 0.11,
              child: Image.asset("assets/logo.jpg")),
          SizedBox(
            // height: size.height * 0.14,
            // width: size.width * 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Association for Computing Machinery",
                  style: TextStyle(
                      color: const Color.fromRGBO(0, 0, 0, 0.61),
                      fontSize: size.width * 0.0176,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "Academy of Business and Engineering Science",
                  style: TextStyle(
                      color: const Color.fromRGBO(0, 0, 0, 0.61),
                      fontSize: size.width * 0.01,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

int selectedPage = 0;
Row getNavigationButton(Size size, BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const LinearBorder(),
          foregroundColor: Colors.blue.shade700,
          backgroundColor: Colors.blue.shade100,
        ),
        onPressed: () {
          if (selectedPage != 0) {
            Navigator.of(context)
                .push(CupertinoPageRoute(builder: (context) => const HomePage()));
            selectedPage = 0;
          }
        },
        child: InkWell(
          child: Text(
            "Home",
            style: getTextStyle(size.width * 0.012),
          ),
        ),
      ),
      SizedBox(
        width: size.width * 0.02,
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const LinearBorder(),
          foregroundColor: Colors.blue.shade700,
          backgroundColor: Colors.blue.shade100,
        ),
        onPressed: () async {
          //!! Uncomment it after creating BlogPage
          uploadedBlogs= await getBlogList();
          if (selectedPage != 1) {
            Navigator.of(context)
                .push(CupertinoPageRoute(builder: (context) => const BlogPage()));
            selectedPage = 1;
          }
        },
        child: InkWell(
          child: Text(
            "Bytes",
            style: getTextStyle(size.width * 0.012),
          ),
        ),
      ),
      SizedBox(
        width: size.width * 0.02,
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const LinearBorder(),
          foregroundColor: Colors.blue.shade700,
          backgroundColor: Colors.blue.shade100,
        ),
        onPressed: () {
          //!! uncomment it after creating EventPage
          if (selectedPage != 2) {
            Navigator.of(context).push(
                CupertinoPageRoute(builder: (context) => const EventPage()));
            selectedPage = 2;
          }
        },
        child: InkWell(
          child: Text(
            "Events",
            style: getTextStyle(size.width * 0.012),
          ),
        ),
      ),
      SizedBox(
        width: size.width * 0.02,
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const LinearBorder(),
          foregroundColor: Colors.blue.shade700,
          backgroundColor: Colors.blue.shade100,
        ),
        onPressed: () {
          if (selectedPage != 3) {
            Navigator.of(context)
                .push(CupertinoPageRoute(builder: (context) => const TeamPage()));
            selectedPage = 3;
          }
        },
        child: InkWell(
            child: Text("Team", style: getTextStyle(size.width * 0.012))),
      ),
      SizedBox(
        width: size.width * 0.02,
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const LinearBorder(),
          foregroundColor: Colors.blue.shade700,
          backgroundColor: Colors.blue.shade100,
        ),
        onPressed: () async {
          if (!isloginpage) {
            getScaffold("Loading...", Colors.orange, context);
            getMap = await getAuth();
          }
          //!! uncomment it after creating RegisterLogin Page
          if (selectedPage != 4) {
            Navigator.of(context)
                .push(CupertinoPageRoute(builder: (context) => loginpage));
            selectedPage = 4;
          }
        },
        child: InkWell(
            child: isloginpage
                ? Text(
                    "Login/Register",
                    style: getTextStyle(size.width * 0.012),
                  )
                : Text(
                    "Profile",
                    style: getTextStyle(size.width * 0.012),
                  )),
      ),
      SizedBox(
        width: size.width * 0.02,
      ),
    ],
  );
}

TextStyle getTextStyle(double size) {
  return TextStyle(
      fontSize: size,
      color: const Color.fromRGBO(0, 0, 0, 0.61),
      fontWeight: FontWeight.w600);
}
