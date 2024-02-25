import 'package:acm_website/utils/eventsacm.dart';
import 'package:acm_website/widgets/eventwidgets.dart';
import 'package:acm_website/widgets/logotitle.dart';
import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
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
                  for (int i = 0; i < eventDetails.length; i++) ...[
                    if (i.isEven) ...[
                      getEventWidget(size, eventDetails[i]),
                    ] else ...[
                      getEventWidgetOdd(size, eventDetails[i]),
                    ],
                    const SizedBox(
                      height: 12,
                    ),
                  ]
                ],
              ),
            ],
          ),
        )
      ]),
    ));
  }
}
