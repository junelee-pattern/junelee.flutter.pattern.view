import '../ready/firebase_core/ready.dart';
import '../ready/logger/ready.dart';

class ReadyAppIsolateEnvironmentConfig {
  Future<void> call() async {
    // WidgetsFlutterBinding.ensureInitialized();
    // await EasyLocalization.ensureInitialized();

    await readyForLogger();
    // await prepareSembastBasicDb();
    // await readyForPackageInfo();
    //
    await readyForFirebaseCore();
    //
    // await readyForEventBus();
    // await readyForEncryptedSharedPreferences();
    // await readyForHive();
    //
    //
    // await readyForAwesomeNotificationsBeforeMaterialAppStart();
    //
    // await readyForFirebaseDatabase();
    // await prepareBasicDb();
    // await versionListener();
    //
    // await readyForFirebaseAuth();
    // await readyForFirebaseMessaging();
  }
}
