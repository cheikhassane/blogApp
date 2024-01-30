import 'dart:convert';

import 'package:blogapp/constant/base_controller.dart';
import 'package:blogapp/constant/button2.dart';
import 'package:blogapp/constant/dialog_helper.dart';
import 'package:blogapp/home/home_page.dart';
import 'package:blogapp/post/controller/post_controller.dart';
import 'package:blogapp/post/controller/postid_controller.dart';
import 'package:blogapp/post/model/post_model.dart';
import 'package:blogapp/post/view/allpost_view.dart';
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

  List<PostModel> postid = [];
  var selectpost;

  Future<dynamic> getPostid() async {
    var response = await NetworkService.getpost('post/$selectpost', "")
        .catchError(handleError);
    List datapost = json.decode(response);
    postid = datapost.map((e) => PostModel.fromJson(e)).toList();
    // print(pluvio);
    if (selectpost != null) {
      return postid;
    } else {
      print(selectpost);
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
            morearticle()
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ButtonRead(
            text: 'Read more',
            onClicked: () {},
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
              fontSize: 14,
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
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              elevation: 30,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: ListTile(
                                onTap: () {},
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
                            ),
                          );
                        },
                      ),
                    )),
        ],
      ),
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
