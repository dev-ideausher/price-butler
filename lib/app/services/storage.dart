import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'enigma.dart';

class GetStorageService extends GetxService {
  static final _runData = GetStorage('runData');
  bool get getisCreator => _runData.read('isCreator') ?? false;
  set setisCreator(bool val) => _runData.write('isCreator', val);
  Future<GetStorageService> initState() async {
    await GetStorage.init('runData');
    return this;
  }

  String get getEncjwToken =>
      decryptAESCryptoJS(_runData.read('jwToken') ?? '') ?? '';
  set setEncjwToken(String val) =>
      _runData.write('jwToken', encryptAESCryptoJS(val));

  void logout() {
    _runData.erase();
  }
}
