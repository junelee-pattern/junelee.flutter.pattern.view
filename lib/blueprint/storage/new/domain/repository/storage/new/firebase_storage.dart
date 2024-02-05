import '../../../../../../../util/start_app.dart';

abstract class NewStorageServerInterface {
  Future<Uint8List?> get(String fileName);

  Future<String?> set(String fileName, Uint8List data);
}
