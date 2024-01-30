import 'dart:convert';

import 'package:blogapp/constant/base_controller.dart';
import 'package:blogapp/constant/dialog_helper.dart';
import 'package:blogapp/post/model/postid_model.dart';
// import 'package:blogapp/post/model/postid_model.dart';
import 'package:blogapp/service/app_exception.dart';
import 'package:blogapp/service/netword_service.dart';
import 'package:get/get.dart';

class PostIdController extends GetxController implements BaseController {
  RxBool isLoading = false.obs;
  // List<PostIdModel> postid = [];
  PostIdModel postid = PostIdModel();

  @override
  void onInit() {
    getPostId();
    super.onInit();
  }

  // void getPostId() async {
  //   isLoading(true);
  //   try {
  //     var response = await NetworkService.get(
  //         'posts/6', ""); // Use try-catch block to handle errors
  //     var datapostid = json.decode(response);

  //     // Assuming PostIdModel.fromJson is a factory method
  //     postid = PostIdModel.fromJson(datapostid);

  //     // print(postid.title);
  //   } catch (error) {
  //     handleError(error);
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  void getPostId() async {
    isLoading(true);
    var response = await NetworkService.get(
        'posts/6', ""); // Use try-catch block to handle errors
    var datapostid = json.decode(response);

    // Assuming PostIdModel.fromJson is a factory method
    postid = PostIdModel.fromJson(datapostid);
    isLoading(false);
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
