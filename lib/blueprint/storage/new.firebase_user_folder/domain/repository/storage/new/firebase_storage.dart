import '../../../../../../../util/start_app.dart';

abstract class NewStorageServerInterface {
  Future<Uint8List?> get(String userId, String fileName);

  Future<String?> set(String userId, String fileName, Uint8List data);
}
