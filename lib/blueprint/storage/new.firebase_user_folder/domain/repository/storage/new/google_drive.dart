import '../../../../../../../util/start_app.dart';

abstract class NewGoogleDriveInterface {
  Future<String?> getString();

  Future<void> setString(String data);
}
