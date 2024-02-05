import '../../../../../../../util/start_app.dart';
import '../../../../domain/repository/storage/new/firebase_storage.dart';
import '../../../../domain/repository/storage/new/storage.dart';
import '../../../source/storage/new/class/basic.dart';

class NewStorageServer extends NewStorageServerInterface {
  @override
  Future<Uint8List?> get(String userId, String fileName) async {
    return await NewStorageHelper.fireStorage.get(userId, fileName);
  }

  @override
  Future<String?> set(String userId, String fileName, Uint8List data) async {
    return await NewStorageHelper.fireStorage.set(userId, fileName, data);
  }
}
