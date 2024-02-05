import 'package:get_storage/get_storage.dart';

import '../../../util/start_app.dart';

class GetStorageKit {
String getString(String key) {
final box = GetStorage();
String? result = box.read(key);
return result ?? "";
}

int getInt(String key) {
final box = GetStorage();
int? result = box.read(key);
return result ?? 0;
}

num getNum(String key) {
final box = GetStorage();
num? result = box.read(key);
return result ?? 0;
}

bool getBool(String key) {
final box = GetStorage();
bool? result = box.read(key);
return result ?? false;
}

void setString(String key, String value) {
final box = GetStorage();
box.write(key, value);
}

void setInt(String key, int value) {
final box = GetStorage();
box.write(key, value);
}

void setNum(String key, num value) {
final box = GetStorage();
box.write(key, value);
}

void setBool(String key, bool value) {
final box = GetStorage();
box.write(key, value);
}
}

