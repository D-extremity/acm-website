// ignore_for_file: use_build_context_synchronously

import 'package:acm_website/mobilelayout/mobilepages/mobileblogpage.dart';
import 'package:acm_website/mobilelayout/mobilepages/mobileeventpage.dart';
import 'package:acm_website/mobilelayout/mobilepages/mobilehomepage.dart';
import 'package:acm_website/mobilelayout/mobilepages/mobileteampage.dart';
import 'package:acm_website/utils/scaffoldtoast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Map<String, dynamic> getMap = {};

// ignore: camel_case_types
class Mobilelogotitle extends StatelessWidget {
  const Mobilelogotitle({
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
              height: size.height * 0.24,
              width: size.width * 0.21,
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
                      fontSize: size.height * 0.0146,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "Academy of Business and Engineering Science",
                  style: TextStyle(
                      color: const Color.fromRGBO(0, 0, 0, 0.61),
                      fontSize: size.width * 0.0144,
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

int mobileselectedPage = 0;
// Row getMobileNavigationButton(Size size, BuildContext context) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.spaceAround,
//     children: [
//       ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           shape: const LinearBorder(),
//           foregroundColor: Colors.blue.shade700,
//           backgroundColor: Colors.blue.shade100,
//         ),
//         onPressed: () {
//           if (mobileselectedPage != 0) {
//             Navigator.of(context).push(CupertinoPageRoute(
//                 builder: (context) => const MobileHomePage()));
//             mobileselectedPage = 0;
//           }
//         },
//         child: InkWell(
//           child: Text(
//             "Home",
//             style: getTextStyle(size.width * 0.012),
//           ),
//         ),
//       ),
//       SizedBox(
//         width: size.width * 0.02,
//       ),
//       ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           shape: const LinearBorder(),
//           foregroundColor: Colors.blue.shade700,
//           backgroundColor: Colors.blue.shade100,
//         ),
//         onPressed: () async {
//           //!! Uncomment it after creating BlogPage
//           uploadedBlogs = await getBlogList();
//           if (mobileselectedPage != 1) {
//             Navigator.of(context).push(CupertinoPageRoute(
//                 builder: (context) => const MobileBlogPage()));
//             mobileselectedPage = 1;
//           }
//         },
//         child: InkWell(
//           child: Text(
//             "Bytes",
//             style: getTextStyle(size.width * 0.012),
//           ),
//         ),
//       ),
//       SizedBox(
//         width: size.width * 0.02,
//       ),
//       ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           shape: const LinearBorder(),
//           foregroundColor: Colors.blue.shade700,
//           backgroundColor: Colors.blue.shade100,
//         ),
//         onPressed: () {
//           //!! uncomment it after creating EventPage
//           if (mobileselectedPage != 2) {
//             Navigator.of(context).push(CupertinoPageRoute(
//                 builder: (context) => const MobileEventPage()));
//             mobileselectedPage = 2;
//           }
//         },
//         child: InkWell(
//           child: Text(
//             "Events",
//             style: getTextStyle(size.width * 0.012),
//           ),
//         ),
//       ),
//       SizedBox(
//         width: size.width * 0.02,
//       ),
//       ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           shape: const LinearBorder(),
//           foregroundColor: Colors.blue.shade700,
//           backgroundColor: Colors.blue.shade100,
//         ),
//         onPressed: () {
//           if (mobileselectedPage != 3) {
//             Navigator.of(context).push(CupertinoPageRoute(
//                 builder: (context) => const MobileTeamPage()));
//             mobileselectedPage = 3;
//           }
//         },
//         child: InkWell(
//             child: Text("Team", style: getTextStyle(size.width * 0.012))),
//       ),
//       SizedBox(
//         width: size.width * 0.02,
//       ),
//       ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           shape: const LinearBorder(),
//           foregroundColor: Colors.blue.shade700,
//           backgroundColor: Colors.blue.shade100,
//         ),
//         onPressed: () async {
//           if (!isMobileloginpage) {
//             getScaffold("Loading...", Colors.orange, context);
//             getMap = await getAuth();
//           }
//           //!! uncomment it after creating RegisterLogin Page
//           if (mobileselectedPage != 4) {
//             Navigator.of(context).push(
//                 CupertinoPageRoute(builder: (context) => mobileloginpage));
//             mobileselectedPage = 4;
//           }
//         },
//         child: InkWell(
//             child: isMobileloginpage
//                 ? Text(
//                     "Login/Register",
//                     style: getTextStyle(size.width * 0.012),
//                   )
//                 : Text(
//                     "Profile",
//                     style: getTextStyle(size.width * 0.012),
//                   )),
//       ),
//       SizedBox(
//         width: size.width * 0.02,
//       ),
//     ],
//   );
// }

TextStyle getTextStyle(double size) {
  return TextStyle(
      fontSize: size,
      color: const Color.fromRGBO(0, 0, 0, 0.61),
      fontWeight: FontWeight.w600);
}










Drawer getDrawer(Size size , BuildContext context) {
  return Drawer(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const LinearBorder(),
            foregroundColor: Colors.blue.shade700,
            backgroundColor: Colors.blue.shade100,
          ),
          onPressed: () {
            if (mobileselectedPage != 0) {
              Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) => const MobileHomePage()));
              mobileselectedPage = 0;
            }
          },
          child: InkWell(
            child: Text(
              "Home",
              style: getTextStyle(size.height * 0.042),
            ),
          ),
        ),
        SizedBox(
          width: size.height * 0.02,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const LinearBorder(),
            foregroundColor: Colors.blue.shade700,
            backgroundColor: Colors.blue.shade100,
          ),
          onPressed: () async {
            //!! Uncomment it after creating BlogPage
            uploadedBlogs = await getBlogList();
            if (mobileselectedPage != 1) {
              Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) => const MobileBlogPage()));
              mobileselectedPage = 1;
            }
          },
          child: InkWell(
            child: Text(
              "Bytes",
              style: getTextStyle(size.height * 0.042),
            ),
          ),
        ),
        SizedBox(
          width: size.height * 0.02,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const LinearBorder(),
            foregroundColor: Colors.blue.shade700,
            backgroundColor: Colors.blue.shade100,
          ),
          onPressed: () {
            //!! uncomment it after creating EventPage
            if (mobileselectedPage != 2) {
              Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) => const MobileEventPage()));
              mobileselectedPage = 2;
            }
          },
          child: InkWell(
            child: Text(
              "Events",
              style: getTextStyle(size.height * 0.042),
            ),
          ),
        ),
        SizedBox(
          width: size.height * 0.02,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const LinearBorder(),
            foregroundColor: Colors.blue.shade700,
            backgroundColor: Colors.blue.shade100,
          ),
          onPressed: () {
            if (mobileselectedPage != 3) {
              Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) => const MobileTeamPage()));
              mobileselectedPage = 3;
            }
          },
          child: InkWell(
              child: Text("Team", style: getTextStyle(size.height * 0.042))),
        ),
        SizedBox(
          width: size.height * 0.02,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const LinearBorder(),
            foregroundColor: Colors.blue.shade700,
            backgroundColor: Colors.blue.shade100,
          ),
          onPressed: () async {
            if (!isMobileloginpage) {
              getScaffold("Loading...", Colors.orange, context);
              getMap = await getAuth();
            }
            //!! uncomment it after creating RegisterLogin Page
            if (mobileselectedPage != 4) {
              Navigator.of(context).push(
                  CupertinoPageRoute(builder: (context) => mobileloginpage));
              mobileselectedPage = 4;
            }
          },
          child: InkWell(
              child: isMobileloginpage
                  ? Text(
                      "Login/Register",
                      style:getTextStyle(size.height * 0.042),
                    )
                  : Text(
                      "Profile",
                      style: getTextStyle(size.height * 0.042),
                    )),
        ),
        SizedBox(
          width: size.height * 0.02,
        ),
      ],
    ),
  );
}
