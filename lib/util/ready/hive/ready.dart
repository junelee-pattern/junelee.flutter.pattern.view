import 'package:hive_flutter/hive_flutter.dart';

Future<void> readyForHive() async {
  await Hive.initFlutter();
}
