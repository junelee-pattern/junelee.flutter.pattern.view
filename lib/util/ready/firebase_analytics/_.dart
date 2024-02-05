import '../../../../../main.dart';

Future<void> readyForFirebaseAnalytics() async {
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  await FirebaseAnalytics.instance.logAppOpen();
}
