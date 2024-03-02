import 'package:acm_website/firebase_options.dart';
import 'package:acm_website/pages/homepage.dart';
import 'package:acm_website/pages/loginregisterpage.dart';
import 'package:acm_website/pages/userprofilepage.dart';
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
              loginpage = UserProfilePage(detail: userDetails,);
              getAuth();
              isloginpage = false;
              // print(userDetails);
              return const HomePage();
            } else {
              loginpage = const LoginPage();
              isloginpage = true;
              return const HomePage();
            }
          }),
      theme: ThemeData(useMaterial3: true),
    );
  }
}
