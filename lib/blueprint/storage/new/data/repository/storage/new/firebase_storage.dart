import '../../../../../../../util/start_app.dart';
import '../../../../domain/repository/storage/new/firebase_storage.dart';
import '../../../../domain/repository/storage/new/storage.dart';
import '../../../source/storage/new/class/basic.dart';

class NewStorageServer extends NewStorageServerInterface {
  @override
  Future<Uint8List?> get(String fileName) async {
    return await NewStorageHelper.fireStorage.get(fileName);
  }

  @override
  Future<String?> set(String fileName, Uint8List data) async {
    return await NewStorageHelper.fireStorage.set(fileName, data);
  }
}
