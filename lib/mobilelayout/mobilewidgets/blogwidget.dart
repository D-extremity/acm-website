import 'package:acm_website/mobilelayout/mobilepages/mobilebloguser.dart';
import 'package:acm_website/pages/blogpage.dart';
import 'package:acm_website/widgets/logotitle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';

CustomCard getMobileBlogWidget(Size size, Map<String, dynamic> chatDetails,BuildContext context) {
  final dateTime = (chatDetails['date'] as Timestamp).toDate();
  final d = dateTime.format(DateTimeFormats.american);
  return CustomCard(
    onTap: () async {
      final blogUserData = await getBlogUserDetails(chatDetails['uid']);
      Navigator.of(context).push(CupertinoPageRoute(
          builder: (context) => MobileBlogUserPage(detail: blogUserData)));
    },
    elevation: 8,
    // width: size.width * 0.04,
    // height: size.height * 0.2,
    borderRadius: 10,
    color: const Color.fromRGBO(178, 242, 242, 0.47),
    hoverColor: const Color.fromRGBO(63, 244, 244, 0.35),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 5.2,
          ),
          Text(
            chatDetails['name'],
            style: getTextStyle(size.height * 0.42),
          ),
          Text(
            d,
            style: getTextStyle(size.height * 0.184),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            chatDetails['blog'],
            style: getTextStyle(size.height * 0.36),
          ),
        ],
      ),
    ),
  );
}
