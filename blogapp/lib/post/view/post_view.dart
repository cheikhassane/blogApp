import 'dart:convert';

import 'package:blogapp/constant/base_controller.dart';
import 'package:blogapp/constant/button_read.dart';
import 'package:blogapp/constant/dialog_helper.dart';
import 'package:blogapp/home/home_page.dart';
import 'package:blogapp/post/controller/post_controller.dart';
import 'package:blogapp/post/controller/postid_controller.dart';
import 'package:blogapp/post/model/post_model.dart';
import 'package:blogapp/post/model/postid_model.dart';
import 'package:blogapp/post/view/allpost_view.dart';
import 'package:blogapp/post/view/detail_post_view.dart';
import 'package:blogapp/service/app_exception.dart';
import 'package:blogapp/service/netword_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';

class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> implements BaseController {
  final postcontroller = Get.put(PostController());
  final postidcontroller = Get.put(PostIdController());
  RxBool isLoading = false.obs;

  List<PostModel> postid = [];
  PostIdModel postid2 = PostIdModel();
  var selectpost;

  Future<PostIdModel> getPostid() async {
    isLoading(true);
    try {
      var response = await NetworkService.getpost('posts/$selectpost', "");
      var datapostid = json.decode(response);

      // Assuming PostIdModel.fromJson is a factory method
      postid2 = PostIdModel.fromJson(datapostid);

      isLoading(false);
      return postid2;
    } catch (error) {
      handleError(error);
      isLoading(false);
      return Future.error("Failed to fetch post data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            appbarView(),
            buttonSearch(),
            const SizedBox(height: 3),
            imageView(),
            const SizedBox(height: 2),
            articleview(),
            const Text(
                "------------------------------------------------------------------"),
            selectpost != null ? searchpostid() : morearticle()
          ],
        ),
      ),
    );
  }

  Widget appbarView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Padding(
          padding: EdgeInsets.all(7.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hi Assane, ",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Urbanist_medium',
                  // fontWeight: FontWeight.normal,
                  fontSize: 13,
                ),
              ),
              Text(
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
        ),
        SizedBox(
          height: 50,
          width: 50,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
          ),
        ),
      ],
    );
  }

  Widget buttonSearch() {
    return Container(
      // height: 50.0,
      // width: 310.0,
      // width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 30, right: 30, top: 15),
      padding: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        // border: Border.all(width: 1.0, color: Colors.black),
        border: Border.all(
            color: Colors.black45, width: 1.0, style: BorderStyle.solid),
      ),
      child: Obx(
        () => postcontroller.isLoading.value
            ? const Center(child: CircularProgressIndicator.adaptive())
            : CustomSearchableDropDown(
                menuPadding: const EdgeInsets.only(
                    left: 20, right: 20, bottom: 65, top: 60),
                items: postcontroller.post,
                label: 'Rechercher',
                labelStyle: const TextStyle(
                    fontFamily: 'Urbanist_semibolt',
                    fontSize: 15.0,
                    color: Colors.black),
                showLabelInMenu: true,
                // showClearButton: true,
                suffixIcon: InkWell(
                  focusColor: Colors.black,
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => super.widget));
                    Get.to(const HomePage());
                  },
                  child: const Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                // labelAlign: TextAlign.center,
                dropdownItemStyle: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'Urbanist_semibolt',
                ),
                labelAlign: TextAlign.center,
                // labelStyle: TextStyle(fontSize: 11),
                dropDownMenuItems: postcontroller.post.map((item) {
                  return item.title;
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      selectpost = value.id;
                      // print(selectpluvio);
                    });
                  } else {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => super.widget));
                  }
                }),
      ),
    );
  }

  Widget imageView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 190),
          child: const Text(
            "Todays's Article",
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Urbanist_bolt',
              // fontWeight: FontWeight.normal,
              fontSize: 18,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 150,
          width: 300,
          // margin: const EdgeInsets.only(left: 30, right: 12),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            image: DecorationImage(
                image: AssetImage("assets/images/pict1.jpg"),
                fit: BoxFit.cover),
          ),
        ),
      ],
    );
  }

  Widget articleview() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ButtonRead(
            text: 'Read more',
            onClicked: () {
              Get.to(DetailPostView(
                title: postidcontroller.postid.title,
                body: postidcontroller.postid.body,
                idpost: postidcontroller.postid.id,
              ));
            },
          ),
          const SizedBox(height: 5),
          Obx(
            () => postidcontroller.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
                : Text(
                    "${postidcontroller.postid.title} ",
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Urbanist_bolt',
                      // fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
          ),
          const Text(
            "January 30,2024",
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Urbanist_medium',
              // fontWeight: FontWeight.normal,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }

  Widget morearticle() {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "More Articles",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Urbanist_bolt',
                  // fontWeight: FontWeight.normal,
                  fontSize: 18,
                ),
              ),
              TextButton(
                  onPressed: () {
                    Get.to(const AllPostView());
                  },
                  child: const Text(
                    "See All",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Urbanist_semibolt',
                      // fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ))
            ],
          ),
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
                      height: 300,
                      child: ListView.builder(
                        itemCount: postcontroller.post.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final listpost = postcontroller.post[index];
                          final title = listpost.title;
                          final body = listpost.body;
                          final idpost = listpost.id;
                          return Card(
                            elevation: 30,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                              onTap: () {
                                Get.to(DetailPostView(
                                  title: title,
                                  body: body,
                                  idpost: idpost,
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
                                image: AssetImage("assets/images/pict3.jpg"),
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
                          );
                        },
                      ),
                    )),
        ],
      ),
    );
  }

  Widget searchpostid() {
    return FutureBuilder(
      future: getPostid(),
      builder: (BuildContext context, AsyncSnapshot<PostIdModel> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator.adaptive());
        } else if (snapshot.hasError) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Error: ${snapshot.error}",
                style: const TextStyle(
                  fontFamily: 'Urbanist_bolt',
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          );
        } else if (!snapshot.hasData || snapshot.data == null) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Liste vide",
                style: TextStyle(
                  fontFamily: 'Urbanist_bolt',
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          );
        } else {
          var postItem = snapshot.data;
          return SizedBox(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 30,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  onTap: () {
                    Get.to(DetailPostView(
                      title: postItem.title,
                      body: postItem.body,
                      idpost: postItem.id,
                    ));
                  },
                  title: Text(
                    "${postItem!.title}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Urbanist_bolt',
                      fontSize: 12,
                    ),
                  ),
                  leading: const Image(
                    image: AssetImage("assets/images/pict3.jpg"),
                    fit: BoxFit.cover,
                  ),
                  subtitle: const Text(
                    "January 19, 2024",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Urbanist_medium',
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }

  @override
  void handleError(error) {
    if (error is BadRequestException) {
      var message = error.message;
      // show dialog
      DialogHelper.showErrorDialog(description: message);
    } else if (error is FetchDataException) {
      var message = error.message;
      // show dialog
      DialogHelper.showErrorDialog(description: message);
    } else if (error is ApiNotRespondingException) {
      // show dialog
      DialogHelper.showErrorDialog(
          description: 'Opps ! It took longer to respond');
    }
  }

  @override
  hideLoading() {
    DialogHelper.hideLoading();
    throw UnimplementedError();
  }

  @override
  showLoading(message) {
    DialogHelper.showLoading(message);
    throw UnimplementedError();
  }
}
