import 'package:firebase_core/firebase_core.dart';

import '../../../../../../../../../firebase_options.dart';
import '../../start_app.dart';

Future<void> readyForFirebaseCore() async {
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
