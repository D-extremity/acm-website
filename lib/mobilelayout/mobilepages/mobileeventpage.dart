import 'package:acm_website/mobilelayout/mobilewidgets/eventwidgets.dart';
import 'package:acm_website/mobilelayout/mobilewidgets/logotitle.dart';
import 'package:acm_website/utils/eventsacm.dart';
import 'package:flutter/material.dart';

class MobileEventPage extends StatefulWidget {
  const MobileEventPage({super.key});

  @override
  State<MobileEventPage> createState() => _MobileEventPageState();
}

class _MobileEventPageState extends State<MobileEventPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      drawer: getDrawer(size, context),
      appBar: AppBar(
        title: Mobilelogotitle(size: size),
      ),
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
              //     logotitle(size: size),
              //     getNavigationButton(size, context),
              //   ],
              // ),
              //!!! Custom Navigation Bar
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  for (int i = 0; i < eventDetails.length; i++) ...[
                    getMobileEventWidget(size, eventDetails[i]),
                    const SizedBox(
                      height: 30,
                    ),
                  ]
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
