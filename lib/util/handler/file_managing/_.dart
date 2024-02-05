import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../../../util/start_app.dart';

class FileManagingKit {
  static Directory? applicationDocumentsDirectory;

  Future<String> appPath() async {
    applicationDocumentsDirectory ??= await getApplicationDocumentsDirectory();
    return applicationDocumentsDirectory!.path;
  }

  Future<MyFileByteSize> getFileByte(File file) async {
    int bytes = (await file.readAsBytes()).lengthInBytes;
    int kb = bytes ~/ 1024;
    int mb = kb ~/ 1024;
    int gb = mb ~/ 1024;
    int tb = gb ~/ 1024;
    return MyFileByteSize(bytes, kb, mb, gb, tb);
  }
}

class MyFileByteSize {
  MyFileByteSize(this.bytes, this.kb, this.mb, this.gb, this.tb);

  int bytes;
  int kb;
  int mb;
  int gb;
  int tb;
}