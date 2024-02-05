import 'package:country_codes/country_codes.dart';

Future<void> readyForCountryCodes() async {
  await CountryCodes.init();
}
