import 'dart:io';

import '../../../../../../../util/start_app.dart';
import '../../../../domain/repository/storage/new/storage.dart';
import '../../../../domain/repository/storage/new/storage_local.dart';
import '../../../source/storage/new/class/basic.dart';

class NewStorageLocal extends NewStorageLocalInterface {
  @override
  Future<File?> get(String fileName) async {
    return await NewStorageHelper.localStorage.get(fileName);
  }

  @override
  Future<File> setByData(String fileName, Uint8List data) async {
    return await NewStorageHelper.localStorage.setByData(fileName, data);
  }

  @override
  Future<File> setByString(String fileName, String text) async {
    return await NewStorageHelper.localStorage.setByString(fileName, text);
  }
}
