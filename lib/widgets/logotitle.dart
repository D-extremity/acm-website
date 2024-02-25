import 'package:acm_website/pages/blogpage.dart';
import 'package:acm_website/pages/eventpage.dart';
import 'package:acm_website/pages/homepage.dart';
import 'package:acm_website/pages/loginregisterpage.dart';
import 'package:acm_website/pages/teampage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                      color: Color.fromRGBO(0, 0, 0, 0.61),
                      fontSize: size.width * 0.0176,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "Academy of Business and Engineering Science",
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.61),
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
          shape: LinearBorder(),
          foregroundColor: Colors.blue.shade700,
          backgroundColor: Colors.blue.shade100,
        ),
        onPressed: () {
          if (selectedPage != 0) {
            Navigator.of(context)
                .push(CupertinoPageRoute(builder: (context) => HomePage()));
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
          shape: LinearBorder(),
          foregroundColor: Colors.blue.shade700,
          backgroundColor: Colors.blue.shade100,
        ),
        onPressed: () {
          //!! Uncomment it after creating BlogPage
           if (selectedPage != 1) {
            Navigator.of(context)
                .push(CupertinoPageRoute(builder: (context) => BlogPage()));
           selectedPage = 1;

          }
        },
        child: InkWell(
          child: Text(
            "Blog",
            style: getTextStyle(size.width * 0.012),
          ),
        ),
      ),
      SizedBox(
        width: size.width * 0.02,
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: LinearBorder(),
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
          shape: LinearBorder(),
          foregroundColor: Colors.blue.shade700,
          backgroundColor: Colors.blue.shade100,
        ),
        onPressed: () {
          if (selectedPage != 3) {
            Navigator.of(context)
                .push(CupertinoPageRoute(builder: (context) => TeamPage()));
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
          shape: LinearBorder(),
          foregroundColor: Colors.blue.shade700,
          backgroundColor: Colors.blue.shade100,
        ),
        onPressed: () {
          //!! uncomment it after creating RegisterLogin Page
           if (selectedPage != 4) {
            Navigator.of(context)
                .push(CupertinoPageRoute(builder: (context) => const LoginPage()));
           selectedPage = 4;

          }
        },
        child: InkWell(
            child: Text("Login/Register",
                style: getTextStyle(size.width * 0.012))),
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
      color: Color.fromRGBO(0, 0, 0, 0.61),
      fontWeight: FontWeight.w600);
}
