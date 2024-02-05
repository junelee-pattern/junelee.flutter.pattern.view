import 'package:flutter/cupertino.dart';

import 'package:image_picker/image_picker.dart';

import '../../../../../../../../../../../../util/start_app.dart';
import '../../../vm/_/action/add_photo_on_keyboard.dart';
import '../../../vm/_/action/focus_keyboard.dart';

clickAddPhotoButtonUserAction(BuildContext context) async {
  final ImagePicker _picker = ImagePicker();
  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

  log(image!.path);

  addPhotoOnKeyboardAction(image.path);
}
