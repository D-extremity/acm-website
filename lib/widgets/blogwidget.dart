import 'package:acm_website/widgets/logotitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';

CustomCard getBlogWidget(Size size, Map<String, String> chatDetails) {
  return CustomCard(
    elevation: 8,
    width: size.width * 0.24,
    // height: size.height * 0.4,
    borderRadius: 10,
    color: const Color.fromRGBO(178, 242, 242, 0.47),
    hoverColor: const Color.fromRGBO(63, 244, 244, 0.35),
    onTap: () {},
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 5.2,
          ),
          Text(
            "Satyam Srivastav",
            style: getTextStyle(size.width * 0.018),
          ),
          Text(
            "26 February 2024 , 12:58",
            style: getTextStyle(size.width * 0.0092),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "ACM, or the Association for Computing Machinery, is a professional organization dedicated to advancing the field of computing. With over 100,000 members across the globe, ACM serves as a hub for researchers, practitioners, and educators in computing and related disciplines.",
            style: getTextStyle(size.width * 0.012),
          ),
        ],
      ),
    ),
  );
}
