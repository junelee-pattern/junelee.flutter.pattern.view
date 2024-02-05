import 'dart:io';

import '../../../../../../../util/start_app.dart';

abstract class NewStorageLocalInterface {
  Future<File?> get(String fileName);

  Future<File> setByData(String fileName, Uint8List data);

  Future<File> setByString(String fileName, String text);
}
