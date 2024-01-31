import 'package:blogapp/post/controller/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  final postcontroller = Get.put(PostController());
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
              const Text(
                "Lists of Notifications",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Urbanist_bolt',
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              Card(
                elevation: 10,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: const ListTile(
                  title: Text(
                    "new article",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Urbanist_bolt',
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text(
                    "January 31,2024",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Urbanist_medium',
                      // fontWeight: FontWeight.normal,
                      fontSize: 12,
                    ),
                  ),
                  leading: Image(
                    image: AssetImage("assets/images/new.jpg"),
                    fit: BoxFit.cover,
                    height: 50,
                    width: 50,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Card(
                elevation: 10,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: const ListTile(
                  title: Text(
                    "new comment",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Urbanist_bolt',
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text(
                    "January 31,2024",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Urbanist_medium',
                      // fontWeight: FontWeight.normal,
                      fontSize: 12,
                    ),
                  ),
                  leading: Image(
                    image: AssetImage("assets/images/new.jpg"),
                    fit: BoxFit.cover,
                    height: 50,
                    width: 50,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
