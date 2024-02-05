import 'package:get_storage/get_storage.dart';

Future<void> readyForGetStorage() async {
  await GetStorage.init();
}
