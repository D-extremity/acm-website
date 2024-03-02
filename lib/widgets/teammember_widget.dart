
import 'package:acm_website/widgets/logotitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';

CustomCard getMemberCard(Size size,Map<String,String> people) {
  return CustomCard(
    elevation: 8,
    width: size.width * 0.16,
    height: size.height * 0.42,
    borderRadius: 10,
    color: const Color.fromRGBO(178, 242, 242, 0.47),
    hoverColor: const Color.fromRGBO(63, 244, 244, 0.35),
    onTap: () {},
    child: Column(
      children: [
        const SizedBox(
          height: 5.2,
        ),
        SizedBox(
          width: size.width * 0.14,
          height: size.height * 0.26,
          child: Image.asset(
            "${people["image"]}",
            fit: BoxFit.cover,
          ),
        ),
        Text(
          "${people["name"]}",
          style: getTextStyle(size.width * 0.016),
        ),
        Text(
          "${people["role"]}",
          style: getTextStyle(size.width * 0.008),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {},
                icon: Image.asset(
                  "assets/github.png",
                  height: size.width * 0.0168,
                  width: size.width * 0.0168,
                )),
            IconButton(
                onPressed: () {},
                icon: Image.asset(
                  "assets/linkedin.png",
                  height: size.width * 0.0168,
                  width: size.width * 0.0168,
                )),
          ],
        )
      ],
    ),
  );
}
