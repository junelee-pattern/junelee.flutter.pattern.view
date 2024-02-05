import 'dart:io';

import '../../../../../../../util/start_app.dart';
import '../../../../domain/repository/storage/new/storage.dart';
import '../../../source/storage/new/class/basic.dart';

class NewStorage extends NewStorageInterface {
  @override
  Future<File?> getSync(String userId, String fileName) async {
    return await NewStorageHelper.to.getSync(userId, fileName);
  }

  @override
  Future<bool> insertSync(
      String userId, String fileName, Uint8List? data) async {
    return await NewStorageHelper().insertSync(userId, fileName, data);
  }

  @override
  Future<bool> upsertSync(
      String userId, String fileName, Uint8List? data) async {
    return await NewStorageHelper.to.upsertSync(userId, fileName, data);
  }

  @override
  Future<String?> firebaseStorageUrl(String userId, String fileName) async {
    return await NewStorageHelper.fireStorage.url(userId, fileName);
  }
}
