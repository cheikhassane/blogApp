import '../service/app_exception.dart';
import 'dialog_helper.dart';

abstract class BaseController {
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

  showLoading(String message) {
    DialogHelper.showLoading(message);
  }

  hideLoading() {
    DialogHelper.hideLoading();
  }
}
