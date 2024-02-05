import 'dart:io';

import '../../../../../../../util/start_app.dart';

abstract class NewStorageInterface {
  Future<File?> getSync(String fileName);

  Future<bool> insertSync(String fileName, Uint8List? data);

  Future<bool> upsertSync(String fileName, Uint8List? data);

  Future<String?> firebaseStorageUrl(String fileName);
}
