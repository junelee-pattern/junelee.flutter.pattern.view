import 'package:google_mobile_ads/google_mobile_ads.dart';

Future<void> readyForGoogleMobileAds() async {
  MobileAds.instance.initialize();
}
