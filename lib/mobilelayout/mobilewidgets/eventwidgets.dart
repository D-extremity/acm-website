import 'package:acm_website/widgets/logotitle.dart';
import 'package:flutter/material.dart';

Widget getMobileEventWidget(Size size, Map<String, String> event) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Text(
            "${event["name"]}",
            style: getTextStyle(size.height * 0.1),
          ),
          SizedBox(
            width: size.width * 0.42,
            child: Text(
              "Date : ${event["date"]}",
              style: getTextStyle(size.height * 0.04),
            ),
          ),
      SizedBox(
        height: size.height * 0.46,
        width: size.width * 0.46,
        child: Image.asset("${event["image"]}"),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          SizedBox(
            width: size.width * 0.8,
            child: Text(
              "${event["des"]}",
              style: getTextStyle(size.width * 0.04),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: size.width * 0.242,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade600,
                    foregroundColor: Colors.blue.shade50,
                    shape: const LinearBorder()),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(Icons.info),
                    Text(
                      "Learn More",
                      style: getTextStyle(size.width * 0.02),
                    )
                  ],
                )),
          )
        ],
      ),
    ],
  );
}

Widget getMobileEventWidgetOdd(Size size, Map<String, String> event) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      // Lottie.asset("assets/events.json",
      //     height: size.height * 0.8, width: size.width * 0.4),

      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${event["name"]}",
            style: getTextStyle(size.width * 0.028),
          ),
          SizedBox(
            width: size.width * 0.4,
            child: Text(
              "Date : ${event["date"]}",
              style: getTextStyle(size.width * 0.012),
            ),
          ),
          SizedBox(
            width: size.width * 0.4,
            child: Text(
              "${event["des"]}",
              style: getTextStyle(size.width * 0.008),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: size.width * 0.112,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade600,
                    foregroundColor: Colors.blue.shade50,
                    shape: const LinearBorder()),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(Icons.info),
                    Text(
                      "Learn More",
                      style: getTextStyle(size.width * 0.01),
                    )
                  ],
                )),
          )
        ],
      ),
      SizedBox(
        height: size.height * 0.46,
        width: size.width * 0.26,
        child: Image.asset("${event["image"]}"),
      ),
    ],
  );
}
