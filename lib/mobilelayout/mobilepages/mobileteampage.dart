import 'package:acm_website/mobilelayout/mobilewidgets/aboutacm.dart';
import 'package:acm_website/mobilelayout/mobilewidgets/logotitle.dart';
import 'package:acm_website/mobilelayout/mobilewidgets/teammember_widget.dart';
import 'package:acm_website/utils/members.dart';
import 'package:flutter/material.dart';

class MobileTeamPage extends StatefulWidget {
  const MobileTeamPage({super.key});

  @override
  State<MobileTeamPage> createState() => _MobileTeamPageState();
}

class _MobileTeamPageState extends State<MobileTeamPage> {
  @override
  Widget build(BuildContext context) {
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
                  getMobileTeamACM(size),
                  const SizedBox(
                    height: 60,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 1000,
                    child: GridView.count(
                      padding: const EdgeInsets.all(12),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      // reverse: true,
                      primary: false,
                      children: [
                        for(int i=0;i<20;i++)...[
                           getMobileMemberCard(size, peopleDetail[i]),
                        ]
                      ],
                    ),
                  )
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
