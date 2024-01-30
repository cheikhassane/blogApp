import 'package:flutter/material.dart';

class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [const SizedBox(height: 50), appbarView()],
        ),
      ),
    );
  }

  Widget appbarView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 240),
              child: const Text(
                "Hi Assane, ",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Urbanist_medium',
                  // fontWeight: FontWeight.normal,
                  fontSize: 13,
                ),
              ),
            ),
            const Text(
              "Good Morning !",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Urbanist_bolt',
                // fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 40,
          width: 40,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
          ),
        )
      ],
    );
  }
}
