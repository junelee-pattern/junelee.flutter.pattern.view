import 'dart:io';

import '../../../../../../../util/start_app.dart';

abstract class NewStorageInterface {
  Future<File?> getSync(String userId, String fileName);

  Future<bool> insertSync(String userId, String fileName, Uint8List? data);

  Future<bool> upsertSync(String userId, String fileName, Uint8List? data);

  Future<String?> firebaseStorageUrl(String userId, String fileName);
}
