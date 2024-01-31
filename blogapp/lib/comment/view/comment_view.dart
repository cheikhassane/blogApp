import 'dart:convert';

import 'package:blogapp/comment/model/comment_model.dart';
import 'package:blogapp/constant/base_controller.dart';
import 'package:blogapp/constant/dialog_helper.dart';
import 'package:blogapp/service/app_exception.dart';
import 'package:blogapp/service/netword_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentView extends StatefulWidget {
  final idpost;
  const CommentView({super.key, this.idpost});

  @override
  State<CommentView> createState() => _CommentViewState();
}

class _CommentViewState extends State<CommentView> implements BaseController {
  List<CommentModel> comments = [];
  Future<List<CommentModel>> getComments() async {
    var response = await NetworkService.get(
            'posts/${widget.idpost.toString()}/comments', "")
        .catchError(handleError);
    List dataComment = json.decode(response);
    comments = dataComment.map((e) => CommentModel.fromJson(e)).toList();
    if (widget.idpost != null) {
      return comments;
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              "Lists of Comments",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Urbanist_bolt',
                // fontWeight: FontWeight.normal,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            FutureBuilder<List<CommentModel>>(
              future: getComments(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator.adaptive();
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "Error: ${snapshot.error}",
                      style: const TextStyle(
                        fontFamily: 'Urbanist_bolt',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "No comments available",
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
                  comments = snapshot.data!;
                  // Render your UI based on comments list
                  return SizedBox(
                    height: 500,
                    child: ListView.builder(
                      itemCount: comments.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final listcomment = comments[index];
                        return ListTile(
                          title: Text(
                            listcomment.name,
                            style: const TextStyle(
                              fontFamily: 'Urbanist_semibolt',
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          leading: const CircleAvatar(
                            // radius: 30,
                            backgroundColor: Colors.transparent,
                            child: Image(
                              image: AssetImage("assets/images/photo.png"),
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          subtitle: Text(
                            listcomment.email,
                            style: const TextStyle(
                              fontFamily: 'Urbanist_semibolt',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          // Add other comment properties as needed
                        );
                      },
                    ),
                  );
                }
              },
            )
          ]),
        ),
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
