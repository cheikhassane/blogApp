import 'package:blogapp/post/controller/post_controller.dart';
import 'package:blogapp/post/view/detail_post_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllPostView extends StatefulWidget {
  const AllPostView({super.key});

  @override
  State<AllPostView> createState() => _AllPostViewState();
}

class _AllPostViewState extends State<AllPostView> {
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
                "All Articles",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Urbanist_bolt',
                  // fontWeight: FontWeight.normal,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              Obx(() => postcontroller.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator.adaptive(),
                    )
                  : postcontroller.post.isEmpty
                      ? const Text(
                          "Veuillez vous connecter",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Urbanists_semibolt',
                            // fontWeight: FontWeight.normal,
                            fontSize: 12,
                          ),
                        )
                      : SizedBox(
                          height: 500,
                          child: ListView.builder(
                            itemCount: postcontroller.post.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final listpost = postcontroller.post[index];
                              final title = listpost.title;
                              final body = listpost.body;
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  elevation: 30,
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: ListTile(
                                    onTap: () {
                                      Get.to(DetailPostView(
                                        title: title,
                                        body: body,
                                      ));
                                    },
                                    title: Text(
                                      listpost.title,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Urbanist_bolt',
                                        // fontWeight: FontWeight.normal,
                                        fontSize: 12,
                                      ),
                                    ),
                                    leading: const Image(
                                      image:
                                          AssetImage("assets/images/pict3.jpg"),
                                      fit: BoxFit.cover,
                                    ),
                                    subtitle: const Text(
                                      "January 19,2024",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Urbanist_medium',
                                        // fontWeight: FontWeight.normal,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        )),
            ],
          ),
        ),
      ),
    );
  }
}
