import 'dart:convert';

import 'package:blogapp/constant/base_controller.dart';
import 'package:blogapp/constant/dialog_helper.dart';
import 'package:blogapp/post/model/post_model.dart';
import 'package:blogapp/service/app_exception.dart';
import 'package:blogapp/service/netword_service.dart';
import 'package:get/get.dart';

class PostController extends GetxController implements BaseController {
  RxBool isLoading = false.obs;
  List<PostModel> post = [];

  @override
  void onInit() {
    getPost();
    super.onInit();
  }

  void getPost() async {
    isLoading(true);
    var response =
        await NetworkService.get('posts', "").catchError(handleError);
    List datapost = json.decode(response);
    post = datapost.map((e) => PostModel.fromJson(e)).toList();
    // print(post);
    isLoading(false);
  }
  // void getPost() async {
  //   isLoading(true);
  //   try {
  //     var response = await NetworkService.get('posts', "");
  //     List<dynamic> datapost = json.decode(response);
  //     post = datapost.map((e) => PostModel.fromJson(e)).toList();
  //     // print(post);
  //   } catch (error) {
  //     handleError(error);
  //   } finally {
  //     isLoading(false);
  //   }
  // }

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
