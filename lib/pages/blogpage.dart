import 'package:acm_website/widgets/aboutacm.dart';
import 'package:acm_website/widgets/blogwidget.dart';
import 'package:acm_website/widgets/logotitle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
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
                  SizedBox(
                    height: size.height * 0.1,
                    width: size.width * 0.48,
                    child: Column(
                      children: [
                        CupertinoTextField(
                        prefix: const Row(
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.chat,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                          // minLines: 10,
                          // maxLines: 50,
                          maxLength: 500,

                          suffix: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.send),
                          ),
                        ),

                
                      ],
                    ),
                  ),
                  getBlogWidget(size, {}),
                ],
              ),
            ],
          ),
        )
      ]),
    ));
  }
}
