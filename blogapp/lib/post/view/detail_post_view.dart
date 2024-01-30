import 'package:blogapp/comment/view/comment_view.dart';
import 'package:blogapp/constant/buttons_comment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPostView extends StatefulWidget {
  final title;
  final body;
  final idpost;
  const DetailPostView({super.key, this.title, this.body, this.idpost});

  @override
  State<DetailPostView> createState() => _DetailPostViewState();
}

class _DetailPostViewState extends State<DetailPostView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back),
                color: Colors.black,
                iconSize: 30,
              ),
              const SizedBox(height: 10),
              const Text(
                "Details Articles",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Urbanist_bolt',
                  // fontWeight: FontWeight.normal,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 170,
                width: 320,
                // margin: const EdgeInsets.only(left: 30, right: 12),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                      image: AssetImage("assets/images/pict3.jpg"),
                      fit: BoxFit.cover),
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "January 30,2024",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Urbanist_semibolt',
                  // fontWeight: FontWeight.normal,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                widget.title,
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'Urbanist_bolt',
                  // fontWeight: FontWeight.normal,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                widget.body,
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'Urbanist_medium',
                  // fontWeight: FontWeight.normal,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                  child: ButtonComment(
                text: 'Read More Comments',
                onClicked: () {
                  Get.to(CommentView(
                    idpost: widget.idpost,
                  ));
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
