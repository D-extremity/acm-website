import 'package:acm_website/firebase_options.dart';
import 'package:acm_website/mobilelayout/mobilepages/mobilehomepage.dart'
    as mobile;
import 'package:acm_website/mobilelayout/mobilepages/mobileloginregispage.dart';
import 'package:acm_website/mobilelayout/mobilepages/mobileuserprofilepage.dart';
import 'package:acm_website/pages/homepage.dart' as web;
import 'package:acm_website/pages/loginregisterpage.dart';
import 'package:acm_website/pages/userprofilepage.dart';
import 'package:acm_website/responsiveui/responsive.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SafeArea(
                  child: Scaffold(
                body: Center(
                  child: Image.asset('assets/logo.jpg'),
                ),
              ));
            } else if (snapshot.hasData) {
              web.loginpage = UserProfilePage(
                detail: web.userDetails,
              );
              mobile.mobileloginpage = MobileUserProfilePage(
                detail: mobile.userDetails,
              );
              web.getAuth();
              mobile.getAuth();
              web.isloginpage = false;
              mobile.isMobileloginpage = false;

              // print(userDetails);
              return const ResponsiveLayout(
                  mobileLayout: mobile.MobileHomePage(), webLayout: web.HomePage());
            } else {
              web.loginpage = const LoginPage();
              web.isloginpage = true;
              mobile.mobileloginpage = const MobileLoginPage();
              mobile.isMobileloginpage = true;
              return const ResponsiveLayout(
                  mobileLayout: mobile.MobileHomePage(), webLayout: web.HomePage());
            }
          }),
      theme: ThemeData(useMaterial3: true),
    );
  }
}
