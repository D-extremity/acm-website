// ignore_for_file: use_build_context_synchronously

import 'package:acm_website/pages/homepage.dart';
import 'package:acm_website/utils/scaffoldtoast.dart';
import 'package:acm_website/widgets/blogwidget.dart';
import 'package:acm_website/widgets/logotitle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  TextEditingController getBlog = TextEditingController();
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
                            onPressed: () async {
                              if (!isloginpage) {
                                await uploadBlog(getBlog.text);
                                getBlog.text = "";
                                await getBlogList();
                                getScaffold("Blog Uploaded Successfully",
                                    Colors.green, context);
                              } else {
                                getScaffold("Login to post Bytes",
                                    Colors.orange, context);
                              }
                            },
                            icon: const Icon(Icons.send),
                          ),
                          controller: getBlog,
                        ),
                      ],
                    ),
                  ),
                  // getBlogWidget(size, {}),
                  SizedBox(
                    width: double.infinity,
                    height: 1000,
                    child: GridView.count(
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      // reverse: true,
                      primary: false,
                      children: [
                        for (int i = uploadedBlogs.length-1; i >-1; i--) ...[
                          getBlogWidget(size, uploadedBlogs[i].data()),
                        ]
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ]),
    ));
  }
}

Future<void> uploadBlog(String blog) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  await firestore.collection('blogs').doc().set({
    'blog': blog,
    'date': DateTime.now(),
    'name': name,
  });
}

List<QueryDocumentSnapshot<Map<String, dynamic>>> uploadedBlogs = [];
Future getBlogList() async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final snap = await firestore.collection("blogs").get();
  // print(snap.docs[0].data() as Map<String, dynamic>);
  return snap.docs;
}
