import 'package:get_storage/get_storage.dart';

import '../../../../../domain/entity/model/new/model.dart';

class NewModelGetStorage {
  NewModel? get() {
    final box = GetStorage();

    String? json = box.read('NewModel');
    if (json == null) return null;

    return NewModel.fromString(json);
  }

  upsert(NewModel obj) {
    final box = GetStorage();
    String json = obj.toString();
    box.write('NewModel', json);
  }

  deleteAll() {
    final box = GetStorage();
    box.remove('NewModel');
  }
}
