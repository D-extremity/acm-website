import 'package:acm_website/pages/blogpage.dart';
import 'package:acm_website/pages/eventpage.dart';
import 'package:acm_website/utils/stringutils.dart';
import 'package:acm_website/widgets/logotitle.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:lottie/lottie.dart';

Widget getAboutACM(Size size) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "ACM and ACM-W Student\nChapter ABESEC",
            style: getTextStyle(size.width * 0.028),
          ),
          SizedBox(
            width: size.width * 0.4,
            child: Text(
              aboutacm,
              style: getTextStyle(size.width * 0.008),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: size.width * 0.112,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade600,
                    foregroundColor: Colors.blue.shade50,
                    shape: const LinearBorder()),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(Icons.info),
                    Text(
                      "Learn More",
                      style: getTextStyle(size.width * 0.01),
                    )
                  ],
                )),
          )
        ],
      ),
      Lottie.asset("assets/floatinglaptop.json",
          height: size.height * 0.8, width: size.width * 0.4)
    ],
  );
}

Widget getEvent(Size size, BuildContext context) {
  List<Widget> eventImages = <Widget>[
    Image.asset("assets/hacks.jpg",
        height: size.height * 0.8, width: size.width * 0.4),
    Image.asset("assets/hackw.jpg",
        height: size.height * 0.8, width: size.width * 0.4),
    Image.asset("assets/navrohan.jpg",
        height: size.height * 0.8, width: size.width * 0.4),
    Image.asset("assets/dev.jpg",
        height: size.height * 0.8, width: size.width * 0.4),
  ];
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      // Lottie.asset("assets/events.json",
      //     height: size.height * 0.8, width: size.width * 0.4),
      SizedBox(
        height: size.height * 0.8,
        width: size.width * 0.4,
        child: FlutterCarousel(
          options: CarouselOptions(
            // height: 400.0,
            showIndicator: true,
            slideIndicator: const CircularSlideIndicator(),
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 6),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
          ),
          items: eventImages,
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "ACM and ACM-W Student\nChapter Events",
            style: getTextStyle(size.width * 0.028),
          ),
          SizedBox(
            width: size.width * 0.4,
            child: Text(
              aboutacmevents,
              style: getTextStyle(size.width * 0.008),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: size.width * 0.112,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade600,
                    foregroundColor: Colors.blue.shade50,
                    shape: const LinearBorder()),
                onPressed: () {
                  if (selectedPage != 2) {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => const EventPage()));
                    selectedPage = 2;
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(Icons.info),
                    Text(
                      "Learn More",
                      style: getTextStyle(size.width * 0.01),
                    )
                  ],
                )),
          )
        ],
      ),
    ],
  );
}

Widget getBytesACM(Size size, BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Express your views on BYTES",
            style: getTextStyle(size.width * 0.028),
          ),
          SizedBox(
            width: size.width * 0.4,
            child: Text(
              aboutBYTES,
              style: getTextStyle(size.width * 0.008),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: size.width * 0.112,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade600,
                    foregroundColor: Colors.blue.shade50,
                    shape: const LinearBorder()),
                onPressed: () {
                  if (selectedPage != 1) {
                    Navigator.of(context).push(
                        CupertinoPageRoute(builder: (context) => const BlogPage()));
                    selectedPage = 1;
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(Icons.info),
                    Text(
                      "Learn More",
                      style: getTextStyle(size.width * 0.01),
                    )
                  ],
                )),
          )
        ],
      ),
      Lottie.asset("assets/events.json",
          height: size.height * 0.8, width: size.width * 0.4)
    ],
  );
}

Widget getTeamACM(Size size) {
  const colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Text(
          //   "Meet The Team",
          //   style: getTextStyle(size.width * 0.032),
          // ),
          SizedBox(
            // width: 250.0,
            child: AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(
                  'Meet The Team',
                  textStyle: getTextStyle(size.width * 0.032),
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
            width: size.width * 0.492,
            child: Text(
              teampageTitle,
              style: getTextStyle(size.width * 0.016),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    ],
  );
}
