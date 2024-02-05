import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../domain/entity/model/new/model.dart';

class NewModelSharedPreferences {
  Future<NewModel?> get() async {
    await _ready();

    String? json = prefs.getString('NewModel');

    if (json == null) return null;

    return NewModel.fromString(json);
  }

  Future<void> upsert(NewModel obj) async {
    await _ready();

    String json = obj.toString();

    await prefs.setString('NewModel', json);
  }

  Future<void> deleteAll() async {
    await _ready();

    await prefs.remove('NewModel');
  }

  //////////////////////////////////////

  static late SharedPreferences prefs;

  static bool _isOpened = false;

  _ready() async {
    if (!_isOpened) {
      await _open();
      _isOpened = true;
    }
  }

  _open() async {
    prefs = await SharedPreferences.getInstance();
  }
}
