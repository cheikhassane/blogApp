import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxController {
  static final getstorage = GetStorage();
  String? selectreg;
  Future<StorageService> init() async {
    await GetStorage.init();
    selectreg = getstorage.read('selectreg');
    return this;
  }

  void write(String key, dynamic value) {
    getstorage.write(key, value);
  }
}
