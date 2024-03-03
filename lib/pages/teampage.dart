import 'package:acm_website/utils/members.dart';
import 'package:acm_website/widgets/aboutacm.dart';
import 'package:acm_website/widgets/logotitle.dart';
import 'package:acm_website/widgets/teammember_widget.dart';
import 'package:flutter/material.dart';

class TeamPage extends StatefulWidget {
  const TeamPage({super.key});

  @override
  State<TeamPage> createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
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
                  getTeamACM(size),
                  const SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (int i = 0; i < 4; i++) ...[
                        getMemberCard(size, peopleDetail[i]),
                      ],
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (int i = 4; i < 8; i++) ...[
                        getMemberCard(size, peopleDetail[i]),
                      ],
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (int i = 8; i < 12; i++) ...[
                        getMemberCard(size, peopleDetail[i]),
                      ],
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (int i = 12; i < 16; i++) ...[
                        getMemberCard(size, peopleDetail[i]),
                      ],
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (int i = 16; i < 20; i++) ...[
                        getMemberCard(size, peopleDetail[i]),
                      ],
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 60,
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
