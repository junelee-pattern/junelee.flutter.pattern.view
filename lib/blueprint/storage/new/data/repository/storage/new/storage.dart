import 'dart:io';

import '../../../../../../../util/start_app.dart';
import '../../../../domain/repository/storage/new/storage.dart';
import '../../../source/storage/new/class/basic.dart';

class NewStorage extends NewStorageInterface {
  @override
  Future<File?> getSync(String fileName) async {
    return await NewStorageHelper.to.getSync(fileName);
  }

  @override
  Future<bool> insertSync(String fileName, Uint8List? data) async {
    return await NewStorageHelper().insertSync(fileName, data);
  }

  @override
  Future<bool> upsertSync(String fileName, Uint8List? data) async {
    return await NewStorageHelper.to.upsertSync(fileName, data);
  }

  @override
  Future<String?> firebaseStorageUrl(String fileName) async {
    return await NewStorageHelper.fireStorage.url(fileName);
  }
}
