import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../../../../util/handler/file_managing/_.dart';
import '../../../../../../../util/start_app.dart';

class NewStorageConfig {
  static Future<String> localPath() async {
    return "${await FileManagingKit().appPath()}/NewStorage";
  }

  static String serverPath() {
    return "NewStorage";
  }
}
