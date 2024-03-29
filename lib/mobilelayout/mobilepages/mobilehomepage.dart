
import 'package:acm_website/firebase_methods/signup.dart';
import 'package:acm_website/mobilelayout/mobilewidgets/aboutacm.dart';
import 'package:acm_website/mobilelayout/mobilewidgets/logotitle.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MobileHomePage extends StatefulWidget {
  const MobileHomePage({super.key});

  @override
  State<MobileHomePage> createState() => _MobileHomePageState();
}

var isMobileloginpage = false;
late var mobileloginpage;
Map<String, dynamic> userDetails = {};
String name = "";
String branch = "";
String linkedin = "";
String github = "";
String emailid = "";
String uid = "";
getAuth() async {
  userDetails = await getUserDetails(FirebaseAuth.instance.currentUser!.uid);
  name = userDetails['name'];
  branch = userDetails['branch'];
  linkedin = userDetails['linkedin'];
  github = userDetails['github'];
  emailid = userDetails['email'];
  uid = userDetails['uid'];
  // print(userDetails);
  return userDetails;
  // }
}

class _MobileHomePageState extends State<MobileHomePage> {
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
              //     // getMobileNavigationButton(size, context),
              //   ],
              // ),
              //!!! Custom Navigation Bar
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  getMobileAboutACM(size),
                  SizedBox(height: 10,),
                  getMobileEvent(size, context),
                  SizedBox(height: 10,),
                  getMobileBytesACM(size, context),
                  SizedBox(height: 10,),

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
