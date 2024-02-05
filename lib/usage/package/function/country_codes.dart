import 'package:country_codes/country_codes.dart';
import 'package:flutter/material.dart';

import '../../../util/start_app.dart';

/*
  String getDialCode() {
    final CountryDetails details = CountryCodes.detailsForLocale();
    return details.dialCode ?? "+1";
  }

  String getCountryCode() {
    final CountryDetails details = CountryCodes.detailsForLocale();
    final Locale? deviceLocale = CountryCodes.getDeviceLocale();
    return details.alpha2Code ??
        deviceLocale?.countryCode ??
        details.alpha3Code ??
        "US";
  }

  String getAlpha2CountryCode() {
    final CountryDetails details = CountryCodes.detailsForLocale();
    return details.alpha2Code ?? "US";
  }

  // String getCountryCode() {
  //   final Locale? deviceLocale = CountryCodes.getDeviceLocale();
  //   return deviceLocale?.countryCode ?? "US";
  // }

  String getAlpha3CountryCode() {
    final CountryDetails details = CountryCodes.detailsForLocale();
    return details.alpha3Code ?? "US";
  }

  String getCountryName() {
    final CountryDetails details = CountryCodes.detailsForLocale();
    return details.name ?? "US";
  }

  String getCountryLocalizedName() {
    final CountryDetails details = CountryCodes.detailsForLocale();
    return details.localizedName ?? "US";
  }
 */
_button00(BuildContext context) async {
  // get dial code
  final CountryDetails details = CountryCodes.detailsForLocale();
  final String dialCode = details.dialCode ?? "+1";
  log(dialCode);
}

_button01(BuildContext context) async {
  // get country code
  final CountryDetails details = CountryCodes.detailsForLocale();
  final Locale? deviceLocale = CountryCodes.getDeviceLocale();
  final String countryCode = details.alpha2Code ??
      deviceLocale?.countryCode ??
      details.alpha3Code ??
      "US";
  log(countryCode);
}

_button02(BuildContext context) async {
  // get alpha2 country code
  final CountryDetails details = CountryCodes.detailsForLocale();
  final String alpha2CountryCode = details.alpha2Code ?? "US";
  log(alpha2CountryCode);
}

_button03(BuildContext context) async {
  // get alpha3 country code
  final CountryDetails details = CountryCodes.detailsForLocale();
  final String alpha3CountryCode = details.alpha3Code ?? "US";
  log(alpha3CountryCode);
}

_button04(BuildContext context) async {
  // get country name
  final CountryDetails details = CountryCodes.detailsForLocale();
  final String countryName = details.name ?? "US";
  log(countryName);
}

_button05(BuildContext context) async {
  // get country localized name
  final CountryDetails details = CountryCodes.detailsForLocale();
  final String countryLocalizedName = details.localizedName ?? "US";
  log(countryLocalizedName);
}

_button06(BuildContext context) async {}

_button07(BuildContext context) async {}

_button08(BuildContext context) async {}

_button09(BuildContext context) async {}

_button10(BuildContext context) async {}

_button11(BuildContext context) async {}

_button12(BuildContext context) async {}

_button13(BuildContext context) async {}

_button14(BuildContext context) async {}

_button15(BuildContext context) async {}

_button16(BuildContext context) async {}

_button17(BuildContext context) async {}

_button18(BuildContext context) async {}

_button19(BuildContext context) async {}

_button20(BuildContext context) async {}

_button21(BuildContext context) async {}

_button22(BuildContext context) async {}

_button23(BuildContext context) async {}

_button24(BuildContext context) async {}

_button25(BuildContext context) async {}

_button26(BuildContext context) async {}

_button27(BuildContext context) async {}

_button28(BuildContext context) async {}

_button29(BuildContext context) async {}

_button30(BuildContext context) async {}

_button31(BuildContext context) async {}

_button32(BuildContext context) async {}

_button33(BuildContext context) async {}

_button34(BuildContext context) async {}

_button35(BuildContext context) async {}

_button36(BuildContext context) async {}

_button37(BuildContext context) async {}

_button38(BuildContext context) async {}

_button39(BuildContext context) async {}

_button40(BuildContext context) async {}

_button41(BuildContext context) async {}

_button42(BuildContext context) async {}

_button43(BuildContext context) async {}

_button44(BuildContext context) async {}

_button45(BuildContext context) async {}

_button46(BuildContext context) async {}

_button47(BuildContext context) async {}

_button48(BuildContext context) async {}

_button49(BuildContext context) async {}

_button50(BuildContext context) async {}

_button51(BuildContext context) async {}

_button52(BuildContext context) async {}

_button53(BuildContext context) async {}

_button54(BuildContext context) async {}

_button55(BuildContext context) async {}

_button56(BuildContext context) async {}

_button57(BuildContext context) async {}

_button58(BuildContext context) async {}

_button59(BuildContext context) async {}

_button60(BuildContext context) async {}

_button61(BuildContext context) async {}

_button62(BuildContext context) async {}

_button63(BuildContext context) async {}

_button64(BuildContext context) async {}

_button65(BuildContext context) async {}

_button66(BuildContext context) async {}

_button67(BuildContext context) async {}

_button68(BuildContext context) async {}

_button69(BuildContext context) async {}

_button70(BuildContext context) async {}

_button71(BuildContext context) async {}

_button72(BuildContext context) async {}

_button73(BuildContext context) async {}

_button74(BuildContext context) async {}

_button75(BuildContext context) async {}

_button76(BuildContext context) async {}

_button77(BuildContext context) async {}

_button78(BuildContext context) async {}

_button79(BuildContext context) async {}

_button80(BuildContext context) async {}

_button81(BuildContext context) async {}

_button82(BuildContext context) async {}

_button83(BuildContext context) async {}

_button84(BuildContext context) async {}

_button85(BuildContext context) async {}

_button86(BuildContext context) async {}

_button87(BuildContext context) async {}

_button88(BuildContext context) async {}

_button89(BuildContext context) async {}

_button90(BuildContext context) async {}

_button91(BuildContext context) async {}

_button92(BuildContext context) async {}

_button93(BuildContext context) async {}

_button94(BuildContext context) async {}

_button95(BuildContext context) async {}

_button96(BuildContext context) async {}

_button97(BuildContext context) async {}

_button98(BuildContext context) async {}

_button99(BuildContext context) async {}

String _button00Name = "00";
String _button01Name = "01";
String _button02Name = "02";
String _button03Name = "03";
String _button04Name = "04";
String _button05Name = "05";
String _button06Name = "06";
String _button07Name = "07";
String _button08Name = "08";
String _button09Name = "09";
String _button10Name = "10";
String _button11Name = "11";
String _button12Name = "12";
String _button13Name = "13";
String _button14Name = "14";
String _button15Name = "15";
String _button16Name = "16";
String _button17Name = "17";
String _button18Name = "18";
String _button19Name = "19";
String _button20Name = "20";
String _button21Name = "21";
String _button22Name = "22";
String _button23Name = "23";
String _button24Name = "24";
String _button25Name = "25";
String _button26Name = "26";
String _button27Name = "27";
String _button28Name = "28";
String _button29Name = "29";
String _button30Name = "30";
String _button31Name = "31";
String _button32Name = "32";
String _button33Name = "33";
String _button34Name = "34";
String _button35Name = "35";
String _button36Name = "36";
String _button37Name = "37";
String _button38Name = "38";
String _button39Name = "39";
String _button40Name = "40";
String _button41Name = "41";
String _button42Name = "42";
String _button43Name = "43";
String _button44Name = "44";
String _button45Name = "45";
String _button46Name = "46";
String _button47Name = "47";
String _button48Name = "48";
String _button49Name = "49";
String _button50Name = "50";
String _button51Name = "51";
String _button52Name = "52";
String _button53Name = "53";
String _button54Name = "54";
String _button55Name = "55";
String _button56Name = "56";
String _button57Name = "57";
String _button58Name = "58";
String _button59Name = "59";
String _button60Name = "60";
String _button61Name = "61";
String _button62Name = "62";
String _button63Name = "63";
String _button64Name = "64";
String _button65Name = "65";
String _button66Name = "66";
String _button67Name = "67";
String _button68Name = "68";
String _button69Name = "69";
String _button70Name = "70";
String _button71Name = "71";
String _button72Name = "72";
String _button73Name = "73";
String _button74Name = "74";
String _button75Name = "75";
String _button76Name = "76";
String _button77Name = "77";
String _button78Name = "78";
String _button79Name = "79";
String _button80Name = "80";
String _button81Name = "81";
String _button82Name = "82";
String _button83Name = "83";
String _button84Name = "84";
String _button85Name = "85";
String _button86Name = "86";
String _button87Name = "87";
String _button88Name = "88";
String _button89Name = "89";
String _button90Name = "90";
String _button91Name = "91";
String _button92Name = "92";
String _button93Name = "93";
String _button94Name = "94";
String _button95Name = "95";
String _button96Name = "96";
String _button97Name = "97";
String _button98Name = "98";
String _button99Name = "99";

main() async {
  return await startApp(
      home: FunctionNoteKit(
    button00: _button00,
    button01: _button01,
    button02: _button02,
    button03: _button03,
    button04: _button04,
    button05: _button05,
    button06: _button06,
    button07: _button07,
    button08: _button08,
    button09: _button09,
    button10: _button10,
    button11: _button11,
    button12: _button12,
    button13: _button13,
    button14: _button14,
    button15: _button15,
    button16: _button16,
    button17: _button17,
    button18: _button18,
    button19: _button19,
    button20: _button20,
    button21: _button21,
    button22: _button22,
    button23: _button23,
    button24: _button24,
    button25: _button25,
    button26: _button26,
    button27: _button27,
    button28: _button28,
    button29: _button29,
    button30: _button30,
    button31: _button31,
    button32: _button32,
    button33: _button33,
    button34: _button34,
    button35: _button35,
    button36: _button36,
    button37: _button37,
    button38: _button38,
    button39: _button39,
    button40: _button40,
    button41: _button41,
    button42: _button42,
    button43: _button43,
    button44: _button44,
    button45: _button45,
    button46: _button46,
    button47: _button47,
    button48: _button48,
    button49: _button49,
    button50: _button50,
    button51: _button51,
    button52: _button52,
    button53: _button53,
    button54: _button54,
    button55: _button55,
    button56: _button56,
    button57: _button57,
    button58: _button58,
    button59: _button59,
    button60: _button60,
    button61: _button61,
    button62: _button62,
    button63: _button63,
    button64: _button64,
    button65: _button65,
    button66: _button66,
    button67: _button67,
    button68: _button68,
    button69: _button69,
    button70: _button70,
    button71: _button71,
    button72: _button72,
    button73: _button73,
    button74: _button74,
    button75: _button75,
    button76: _button76,
    button77: _button77,
    button78: _button78,
    button79: _button79,
    button80: _button80,
    button81: _button81,
    button82: _button82,
    button83: _button83,
    button84: _button84,
    button85: _button85,
    button86: _button86,
    button87: _button87,
    button88: _button88,
    button89: _button89,
    button90: _button90,
    button91: _button91,
    button92: _button92,
    button93: _button93,
    button94: _button94,
    button95: _button95,
    button96: _button96,
    button97: _button97,
    button98: _button98,
    button99: _button99,
    buttonName00: _button00Name,
    buttonName01: _button01Name,
    buttonName02: _button02Name,
    buttonName03: _button03Name,
    buttonName04: _button04Name,
    buttonName05: _button05Name,
    buttonName06: _button06Name,
    buttonName07: _button07Name,
    buttonName08: _button08Name,
    buttonName09: _button09Name,
    buttonName10: _button10Name,
    buttonName11: _button11Name,
    buttonName12: _button12Name,
    buttonName13: _button13Name,
    buttonName14: _button14Name,
    buttonName15: _button15Name,
    buttonName16: _button16Name,
    buttonName17: _button17Name,
    buttonName18: _button18Name,
    buttonName19: _button19Name,
    buttonName20: _button20Name,
    buttonName21: _button21Name,
    buttonName22: _button22Name,
    buttonName23: _button23Name,
    buttonName24: _button24Name,
    buttonName25: _button25Name,
    buttonName26: _button26Name,
    buttonName27: _button27Name,
    buttonName28: _button28Name,
    buttonName29: _button29Name,
    buttonName30: _button30Name,
    buttonName31: _button31Name,
    buttonName32: _button32Name,
    buttonName33: _button33Name,
    buttonName34: _button34Name,
    buttonName35: _button35Name,
    buttonName36: _button36Name,
    buttonName37: _button37Name,
    buttonName38: _button38Name,
    buttonName39: _button39Name,
    buttonName40: _button40Name,
    buttonName41: _button41Name,
    buttonName42: _button42Name,
    buttonName43: _button43Name,
    buttonName44: _button44Name,
    buttonName45: _button45Name,
    buttonName46: _button46Name,
    buttonName47: _button47Name,
    buttonName48: _button48Name,
    buttonName49: _button49Name,
    buttonName50: _button50Name,
    buttonName51: _button51Name,
    buttonName52: _button52Name,
    buttonName53: _button53Name,
    buttonName54: _button54Name,
    buttonName55: _button55Name,
    buttonName56: _button56Name,
    buttonName57: _button57Name,
    buttonName58: _button58Name,
    buttonName59: _button59Name,
    buttonName60: _button60Name,
    buttonName61: _button61Name,
    buttonName62: _button62Name,
    buttonName63: _button63Name,
    buttonName64: _button64Name,
    buttonName65: _button65Name,
    buttonName66: _button66Name,
    buttonName67: _button67Name,
    buttonName68: _button68Name,
    buttonName69: _button69Name,
    buttonName70: _button70Name,
    buttonName71: _button71Name,
    buttonName72: _button72Name,
    buttonName73: _button73Name,
    buttonName74: _button74Name,
    buttonName75: _button75Name,
    buttonName76: _button76Name,
    buttonName77: _button77Name,
    buttonName78: _button78Name,
    buttonName79: _button79Name,
    buttonName80: _button80Name,
    buttonName81: _button81Name,
    buttonName82: _button82Name,
    buttonName83: _button83Name,
    buttonName84: _button84Name,
    buttonName85: _button85Name,
    buttonName86: _button86Name,
    buttonName87: _button87Name,
    buttonName88: _button88Name,
    buttonName89: _button89Name,
    buttonName90: _button90Name,
    buttonName91: _button91Name,
    buttonName92: _button92Name,
    buttonName93: _button93Name,
    buttonName94: _button94Name,
    buttonName95: _button95Name,
    buttonName96: _button96Name,
    buttonName97: _button97Name,
    buttonName98: _button98Name,
    buttonName99: _button99Name,
  ));
}
