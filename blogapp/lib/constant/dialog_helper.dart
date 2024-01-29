import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import '../login/login.dart';

class DialogHelper {
  //show dialog
  static void showErrorDialog(
      {String title = 'Erreur', description = 'Something wen wrong'}) {
    Get.dialog(Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: Get.textTheme.titleSmall,
            ),
            Text(
              description,
              style: Get.textTheme.bodyMedium,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.isDialogOpen;
                  Get.deleteAll();
                  Get.back(result: true);
                  // Get.to(const LeadingPage());
                },
                child: const Text("Ok"))
          ],
        ),
      ),
    ));
  }

  static void show() {
    Get.defaultDialog(
      radius: 10.0,
      contentPadding: const EdgeInsets.all(20.0),
      title: 'title',
      middleText: 'content',
      textConfirm: 'Okay',
      confirm: OutlinedButton.icon(
        onPressed: () => Get.back(),
        icon: const Icon(
          Icons.check,
          color: Colors.blue,
        ),
        label: const Text(
          'Okay',
          style: TextStyle(color: Colors.blue),
        ),
      ),
      cancel: OutlinedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.abc),
        label: const Text(""),
      ),
    );
  }

  static void showNotif(
      {String title = 'Erreur', description = 'Something wen wrong'}) {
    Get.dialog(Dialog(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: Get.textTheme.titleSmall,
            ),
            Text(
              description,
              style: Get.textTheme.bodyMedium,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.isDialogOpen;
                  Get.back(result: true);
                  Get.deleteAll();
                },
                child: const Text("Ok"))
          ],
        ),
      ),
    ));
  }

  static void notifDefault(
      {String title = 'Erreur', description = 'Something wen wrong'}) {
    Get.dialog(Dialog(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: Get.textTheme.titleSmall,
            ),
            Text(
              description,
              style: Get.textTheme.displayMedium,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.isDialogOpen;
                  Get.back(result: true);
                  // Get.deleteAll();
                  // Get.to(const Login());
                },
                child: const Text("Ok"))
          ],
        ),
      ),
    ));
  }

  static void showLoading(String message) {
    Get.dialog(Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator.adaptive(),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              message,
              style: Get.textTheme.titleLarge,
            ),
          ],
        ),
      ),
    ));
    //   new Future.delayed(new Duration(seconds: 3), () {
    //   Navigator.pop(context); //pop dialog
    //   _login();
    // });
  }

  static void hideLoading() {
    Get.isDialogOpen;
    Get.back();
  }
}
