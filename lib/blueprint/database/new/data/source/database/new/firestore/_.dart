import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../domain/entity/model/new/model.dart';

class NewModelFirestore {
  ////////////// config ///////////////
  CollectionReference objectDocRef() {
    return FirebaseFirestore.instance
        .collection('이런식으로')
        .doc('넣어주세요.')
        .collection('마지막은 collection 이어야합니다.');
  }

  //////////////////////////////////////

  Future<bool?> checkExist(String docId) async {
    if (!_ready()) return null;
    DocumentSnapshot<NewModel> documentSnapshot =
        await objectRef().doc(docId).get();
    return documentSnapshot.exists;
  }

  Future<String?> add(NewModel object) async {
    if (!_ready()) return null;
    object.DocId = object.DocId.replaceAll(
        "MyUid", FirebaseAuth.instance.currentUser!.uid);
    DocumentReference<NewModel> documentReference =
        await objectRef().add(object);
    return documentReference.id;
  }

  Future<NewModel?> get(String docId) async {
    if (!_ready()) return null;
    DocumentSnapshot<NewModel> documentSnapshot =
        await objectRef().doc(docId).get();
    NewModel? serverObject = documentSnapshot.data();
    if (serverObject != null) {
      serverObject.DocId = serverObject.DocId.replaceAll(
          FirebaseAuth.instance.currentUser!.uid, "MyUid");
    }
    return serverObject;
  }

  Future<List<NewModel?>?> getAll() async {
    if (!_ready()) return null;
    List<NewModel?> _ = [];
    QuerySnapshot<NewModel> querySnapshot = await objectRef().get();

    for (DocumentSnapshot<NewModel> doc in querySnapshot.docs) {
      NewModel? serverObject = doc.data();
      if (serverObject != null) {
        serverObject.DocId = serverObject.DocId.replaceAll(
            FirebaseAuth.instance.currentUser!.uid, "MyUid");
      }
      _.add(serverObject);
    }
    return _;
  }

  Future<void> upsert(NewModel object) async {
    if (!_ready()) return;
    object.DocId = object.DocId.replaceAll(
        "MyUid", FirebaseAuth.instance.currentUser!.uid);
    await objectRef().doc(object.DocId).set(object, SetOptions(merge: true));
  }

  delete(NewModel object) async {
    if (!_ready()) return null;
    object.DocId = object.DocId.replaceAll(
        "MyUid", FirebaseAuth.instance.currentUser!.uid);
    await objectRef().doc(object.DocId).delete();
  }

  // Future<List<NewModel>?> querySample1() async {
  //   if (!_ready()) return null;
  //   List<NewModel> result = [];
  //
  //   QuerySnapshot<NewModel> _ = await objectRef()
  //       .where('genre', isEqualTo: 'Sci-fi')
  //       .get();
  //   for (var element in _.docs) {
  //     NewModel serverObject = element.data();
  //     serverObject.DocId =
  //         serverObject.DocId.replaceAll(FirebaseAuth.instance.currentUser!.uid, "MyUid");
  //     result.add(serverObject);
  //   }
  //   return result;
  // }

  //////////////////////////////////////
  Map<String, Object?> toMap({required NewModel object, String? inputId}) {
    Map<String, Object?> map = <String, Object?>{};

    map["I000"] = object.I000;
    // map["I001"] = object.I001;
    // map["I002"] = object.I002;
    // map["I003"] = object.I003;
    // map["I004"] = object.I004;
    // map["I005"] = object.I005;
    // map["I006"] = object.I006;
    // map["I007"] = object.I007;
    // map["I008"] = object.I008;
    // map["I009"] = object.I009;
    // map["I010"] = object.I010;
    // map["I011"] = object.I011;
    // map["I012"] = object.I012;
    // map["I013"] = object.I013;
    // map["I014"] = object.I014;
    // map["I015"] = object.I015;
    // map["I016"] = object.I016;
    // map["I017"] = object.I017;
    // map["I018"] = object.I018;
    // map["I019"] = object.I019;
    // map["I020"] = object.I020;
    // map["I021"] = object.I021;
    // map["I022"] = object.I022;
    // map["I023"] = object.I023;
    // map["I024"] = object.I024;
    // map["I025"] = object.I025;
    // map["I026"] = object.I026;
    // map["I027"] = object.I027;
    // map["I028"] = object.I028;
    // map["I029"] = object.I029;
    // map["I030"] = object.I030;
    // map["I031"] = object.I031;
    // map["I032"] = object.I032;
    // map["I033"] = object.I033;
    // map["I034"] = object.I034;
    // map["I035"] = object.I035;
    // map["I036"] = object.I036;
    // map["I037"] = object.I037;
    // map["I038"] = object.I038;
    // map["I039"] = object.I039;
    // map["I040"] = object.I040;
    // map["I041"] = object.I041;
    // map["I042"] = object.I042;
    // map["I043"] = object.I043;
    // map["I044"] = object.I044;
    // map["I045"] = object.I045;
    // map["I046"] = object.I046;
    // map["I047"] = object.I047;
    // map["I048"] = object.I048;
    // map["I049"] = object.I049;
    // map["I050"] = object.I050;
    // map["I051"] = object.I051;
    // map["I052"] = object.I052;
    // map["I053"] = object.I053;
    // map["I054"] = object.I054;
    // map["I055"] = object.I055;
    // map["I056"] = object.I056;
    // map["I057"] = object.I057;
    // map["I058"] = object.I058;
    // map["I059"] = object.I059;
    // map["I060"] = object.I060;
    // map["I061"] = object.I061;
    // map["I062"] = object.I062;
    // map["I063"] = object.I063;
    // map["I064"] = object.I064;
    // map["I065"] = object.I065;
    // map["I066"] = object.I066;
    // map["I067"] = object.I067;
    // map["I068"] = object.I068;
    // map["I069"] = object.I069;
    // map["I070"] = object.I070;
    // map["I071"] = object.I071;
    // map["I072"] = object.I072;
    // map["I073"] = object.I073;
    // map["I074"] = object.I074;
    // map["I075"] = object.I075;
    // map["I076"] = object.I076;
    // map["I077"] = object.I077;
    // map["I078"] = object.I078;
    // map["I079"] = object.I079;
    // map["I080"] = object.I080;
    // map["I081"] = object.I081;
    // map["I082"] = object.I082;
    // map["I083"] = object.I083;
    // map["I084"] = object.I084;
    // map["I085"] = object.I085;
    // map["I086"] = object.I086;
    // map["I087"] = object.I087;
    // map["I088"] = object.I088;
    // map["I089"] = object.I089;
    // map["I090"] = object.I090;
    // map["I091"] = object.I091;
    // map["I092"] = object.I092;
    // map["I093"] = object.I093;
    // map["I094"] = object.I094;
    // map["I095"] = object.I095;
    // map["I096"] = object.I096;
    // map["I097"] = object.I097;
    // map["I098"] = object.I098;
    // map["I099"] = object.I099;
    // map["S000"] = object.S000;
    // map["S001"] = object.S001;
    // map["S002"] = object.S002;
    // map["S003"] = object.S003;
    // map["S004"] = object.S004;
    // map["S005"] = object.S005;
    // map["S006"] = object.S006;
    // map["S007"] = object.S007;
    // map["S008"] = object.S008;
    // map["S009"] = object.S009;
    // map["S010"] = object.S010;
    // map["S011"] = object.S011;
    // map["S012"] = object.S012;
    // map["S013"] = object.S013;
    // map["S014"] = object.S014;
    // map["S015"] = object.S015;
    // map["S016"] = object.S016;
    // map["S017"] = object.S017;
    // map["S018"] = object.S018;
    // map["S019"] = object.S019;
    // map["S020"] = object.S020;
    // map["S021"] = object.S021;
    // map["S022"] = object.S022;
    // map["S023"] = object.S023;
    // map["S024"] = object.S024;
    // map["S025"] = object.S025;
    // map["S026"] = object.S026;
    // map["S027"] = object.S027;
    // map["S028"] = object.S028;
    // map["S029"] = object.S029;
    // map["S030"] = object.S030;
    // map["S031"] = object.S031;
    // map["S032"] = object.S032;
    // map["S033"] = object.S033;
    // map["S034"] = object.S034;
    // map["S035"] = object.S035;
    // map["S036"] = object.S036;
    // map["S037"] = object.S037;
    // map["S038"] = object.S038;
    // map["S039"] = object.S039;
    // map["S040"] = object.S040;
    // map["S041"] = object.S041;
    // map["S042"] = object.S042;
    // map["S043"] = object.S043;
    // map["S044"] = object.S044;
    // map["S045"] = object.S045;
    // map["S046"] = object.S046;
    // map["S047"] = object.S047;
    // map["S048"] = object.S048;
    // map["S049"] = object.S049;
    // map["S050"] = object.S050;
    // map["S051"] = object.S051;
    // map["S052"] = object.S052;
    // map["S053"] = object.S053;
    // map["S054"] = object.S054;
    // map["S055"] = object.S055;
    // map["S056"] = object.S056;
    // map["S057"] = object.S057;
    // map["S058"] = object.S058;
    // map["S059"] = object.S059;
    // map["S060"] = object.S060;
    // map["S061"] = object.S061;
    // map["S062"] = object.S062;
    // map["S063"] = object.S063;
    // map["S064"] = object.S064;
    // map["S065"] = object.S065;
    // map["S066"] = object.S066;
    // map["S067"] = object.S067;
    // map["S068"] = object.S068;
    // map["S069"] = object.S069;
    // map["S070"] = object.S070;
    // map["S071"] = object.S071;
    // map["S072"] = object.S072;
    // map["S073"] = object.S073;
    // map["S074"] = object.S074;
    // map["S075"] = object.S075;
    // map["S076"] = object.S076;
    // map["S077"] = object.S077;
    // map["S078"] = object.S078;
    // map["S079"] = object.S079;
    // map["S080"] = object.S080;
    // map["S081"] = object.S081;
    // map["S082"] = object.S082;
    // map["S083"] = object.S083;
    // map["S084"] = object.S084;
    // map["S085"] = object.S085;
    // map["S086"] = object.S086;
    // map["S087"] = object.S087;
    // map["S088"] = object.S088;
    // map["S089"] = object.S089;
    // map["S090"] = object.S090;
    // map["S091"] = object.S091;
    // map["S092"] = object.S092;
    // map["S093"] = object.S093;
    // map["S094"] = object.S094;
    // map["S095"] = object.S095;
    // map["S096"] = object.S096;
    // map["S097"] = object.S097;
    // map["S098"] = object.S098;
    // map["S099"] = object.S099;
    // map["B000"] = object.B000 ? 1 : 0;
    // map["B001"] = object.B001 ? 1 : 0;
    // map["B002"] = object.B002 ? 1 : 0;
    // map["B003"] = object.B003 ? 1 : 0;
    // map["B004"] = object.B004 ? 1 : 0;
    // map["B005"] = object.B005 ? 1 : 0;
    // map["B006"] = object.B006 ? 1 : 0;
    // map["B007"] = object.B007 ? 1 : 0;
    // map["B008"] = object.B008 ? 1 : 0;
    // map["B009"] = object.B009 ? 1 : 0;
    // map["B010"] = object.B010 ? 1 : 0;
    // map["B011"] = object.B011 ? 1 : 0;
    // map["B012"] = object.B012 ? 1 : 0;
    // map["B013"] = object.B013 ? 1 : 0;
    // map["B014"] = object.B014 ? 1 : 0;
    // map["B015"] = object.B015 ? 1 : 0;
    // map["B016"] = object.B016 ? 1 : 0;
    // map["B017"] = object.B017 ? 1 : 0;
    // map["B018"] = object.B018 ? 1 : 0;
    // map["B019"] = object.B019 ? 1 : 0;
    // map["B020"] = object.B020 ? 1 : 0;
    // map["B021"] = object.B021 ? 1 : 0;
    // map["B022"] = object.B022 ? 1 : 0;
    // map["B023"] = object.B023 ? 1 : 0;
    // map["B024"] = object.B024 ? 1 : 0;
    // map["B025"] = object.B025 ? 1 : 0;
    // map["B026"] = object.B026 ? 1 : 0;
    // map["B027"] = object.B027 ? 1 : 0;
    // map["B028"] = object.B028 ? 1 : 0;
    // map["B029"] = object.B029 ? 1 : 0;
    // map["B030"] = object.B030 ? 1 : 0;
    // map["R000"] = object.R000;
    // map["R001"] = object.R001;
    // map["R002"] = object.R002;
    // map["R003"] = object.R003;
    // map["R004"] = object.R004;
    // map["R005"] = object.R005;
    // map["R006"] = object.R006;
    // map["R007"] = object.R007;
    // map["R008"] = object.R008;
    // map["R009"] = object.R009;
    // map["R010"] = object.R010;
    // map["R011"] = object.R011;
    // map["R012"] = object.R012;
    // map["R013"] = object.R013;
    // map["R014"] = object.R014;
    // map["R015"] = object.R015;
    // map["R016"] = object.R016;
    // map["R017"] = object.R017;
    // map["R018"] = object.R018;
    // map["R019"] = object.R019;
    // map["R020"] = object.R020;
    // map["R021"] = object.R021;
    // map["R022"] = object.R022;
    // map["R023"] = object.R023;
    // map["R024"] = object.R024;
    // map["R025"] = object.R025;
    // map["R026"] = object.R026;
    // map["R027"] = object.R027;
    // map["R028"] = object.R028;
    // map["R029"] = object.R029;
    // map["R030"] = object.R030;
    // map["L000"] = object.L000;
    // map["L001"] = object.L001;
    // map["L002"] = object.L002;
    // map["L003"] = object.L003;
    // map["L004"] = object.L004;
    // map["L005"] = object.L005;
    // map["L006"] = object.L006;
    // map["L007"] = object.L007;
    // map["L008"] = object.L008;
    // map["L009"] = object.L009;
    // map["L010"] = object.L010;
    // map["L011"] = object.L011;
    // map["L012"] = object.L012;
    // map["L013"] = object.L013;
    // map["L014"] = object.L014;
    // map["L015"] = object.L015;
    // map["L016"] = object.L016;
    // map["L017"] = object.L017;
    // map["L018"] = object.L018;
    // map["L019"] = object.L019;
    // map["L020"] = object.L020;
    // map["C000"] = object.C000.toString();
    // map["C000"] = object.C000.toString();
    // map["C001"] = object.C001.toString();
    // map["C002"] = object.C002.toString();
    // map["C003"] = object.C003.toString();
    // map["C004"] = object.C004.toString();
    // map["C005"] = object.C005.toString();
    // map["C006"] = object.C006.toString();
    // map["C007"] = object.C007.toString();
    // map["C008"] = object.C008.toString();
    // map["C009"] = object.C009.toString();
    // map["C010"] = object.C010.toString();
    // map["C011"] = object.C011.toString();
    // map["C012"] = object.C012.toString();
    // map["C013"] = object.C013.toString();
    // map["C014"] = object.C014.toString();
    // map["C015"] = object.C015.toString();
    // map["C016"] = object.C016.toString();
    // map["C017"] = object.C017.toString();
    // map["C018"] = object.C018.toString();
    // map["C019"] = object.C019.toString();
    // map["C020"] = object.C020.toString();
    // map["J000"] = jsonEncode(object.J000.map((model) => model.toString()).toList());
    // map["J001"] = jsonEncode(object.J001.map((model) => model.toString()).toList());
    // map["J002"] = jsonEncode(object.J002.map((model) => model.toString()).toList());
    // map["J003"] = jsonEncode(object.J003.map((model) => model.toString()).toList());
    // map["J004"] = jsonEncode(object.J004.map((model) => model.toString()).toList());
    // map["J005"] = jsonEncode(object.J005.map((model) => model.toString()).toList());
    // map["J006"] = jsonEncode(object.J006.map((model) => model.toString()).toList());
    // map["J007"] = jsonEncode(object.J007.map((model) => model.toString()).toList());
    // map["J008"] = jsonEncode(object.J008.map((model) => model.toString()).toList());
    // map["J009"] = jsonEncode(object.J009.map((model) => model.toString()).toList());
    // map["J010"] = jsonEncode(object.J010.map((model) => model.toString()).toList());
    // map["J011"] = jsonEncode(object.J011.map((model) => model.toString()).toList());
    // map["J012"] = jsonEncode(object.J012.map((model) => model.toString()).toList());
    // map["J013"] = jsonEncode(object.J013.map((model) => model.toString()).toList());
    // map["J014"] = jsonEncode(object.J014.map((model) => model.toString()).toList());
    // map["J015"] = jsonEncode(object.J015.map((model) => model.toString()).toList());
    // map["J016"] = jsonEncode(object.J016.map((model) => model.toString()).toList());
    // map["J017"] = jsonEncode(object.J017.map((model) => model.toString()).toList());
    // map["J018"] = jsonEncode(object.J018.map((model) => model.toString()).toList());
    // map["J019"] = jsonEncode(object.J019.map((model) => model.toString()).toList());
    // map["J020"] = jsonEncode(object.J020.map((model) => model.toString()).toList());
    // map["E000"] = object.E000.toStringValue();
    // map["E001"] = object.E001.toStringValue();
    // map["E002"] = object.E002.toStringValue();
    // map["E003"] = object.E003.toStringValue();
    // map["E004"] = object.E004.toStringValue();
    // map["E005"] = object.E005.toStringValue();
    // map["E006"] = object.E006.toStringValue();
    // map["E007"] = object.E007.toStringValue();
    // map["E008"] = object.E008.toStringValue();
    // map["E009"] = object.E009.toStringValue();
    // map["E010"] = object.E010.toStringValue();
    // map["E011"] = object.E011.toStringValue();
    // map["E012"] = object.E012.toStringValue();
    // map["E013"] = object.E013.toStringValue();
    // map["E014"] = object.E014.toStringValue();
    // map["E015"] = object.E015.toStringValue();
    // map["E016"] = object.E016.toStringValue();
    // map["E017"] = object.E017.toStringValue();
    // map["E018"] = object.E018.toStringValue();
    // map["E019"] = object.E019.toStringValue();
    // map["E020"] = object.E020.toStringValue();

    if (inputId != null) {
      map["DocId"] = inputId;
    }
    map["DocId"] = object.DocId;

    return map;
  }

  NewModel fromMap(Map<dynamic, dynamic> data) {
    NewModel object = NewModel();

    object.I000 = data["I000"] ?? 0;
    // object.I001 = data["I001"] ?? 0;
    // object.I002 = data["I002"] ?? 0;
    // object.I003 = data["I003"] ?? 0;
    // object.I004 = data["I004"] ?? 0;
    // object.I005 = data["I005"] ?? 0;
    // object.I006 = data["I006"] ?? 0;
    // object.I007 = data["I007"] ?? 0;
    // object.I008 = data["I008"] ?? 0;
    // object.I009 = data["I009"] ?? 0;
    // object.I010 = data["I010"] ?? 0;
    // object.I011 = data["I011"] ?? 0;
    // object.I012 = data["I012"] ?? 0;
    // object.I013 = data["I013"] ?? 0;
    // object.I014 = data["I014"] ?? 0;
    // object.I015 = data["I015"] ?? 0;
    // object.I016 = data["I016"] ?? 0;
    // object.I017 = data["I017"] ?? 0;
    // object.I018 = data["I018"] ?? 0;
    // object.I019 = data["I019"] ?? 0;
    // object.I020 = data["I020"] ?? 0;
    // object.I021 = data["I021"] ?? 0;
    // object.I022 = data["I022"] ?? 0;
    // object.I023 = data["I023"] ?? 0;
    // object.I024 = data["I024"] ?? 0;
    // object.I025 = data["I025"] ?? 0;
    // object.I026 = data["I026"] ?? 0;
    // object.I027 = data["I027"] ?? 0;
    // object.I028 = data["I028"] ?? 0;
    // object.I029 = data["I029"] ?? 0;
    // object.I030 = data["I030"] ?? 0;
    // object.I031 = data["I031"] ?? 0;
    // object.I032 = data["I032"] ?? 0;
    // object.I033 = data["I033"] ?? 0;
    // object.I034 = data["I034"] ?? 0;
    // object.I035 = data["I035"] ?? 0;
    // object.I036 = data["I036"] ?? 0;
    // object.I037 = data["I037"] ?? 0;
    // object.I038 = data["I038"] ?? 0;
    // object.I039 = data["I039"] ?? 0;
    // object.I040 = data["I040"] ?? 0;
    // object.I041 = data["I041"] ?? 0;
    // object.I042 = data["I042"] ?? 0;
    // object.I043 = data["I043"] ?? 0;
    // object.I044 = data["I044"] ?? 0;
    // object.I045 = data["I045"] ?? 0;
    // object.I046 = data["I046"] ?? 0;
    // object.I047 = data["I047"] ?? 0;
    // object.I048 = data["I048"] ?? 0;
    // object.I049 = data["I049"] ?? 0;
    // object.I050 = data["I050"] ?? 0;
    // object.I051 = data["I051"] ?? 0;
    // object.I052 = data["I052"] ?? 0;
    // object.I053 = data["I053"] ?? 0;
    // object.I054 = data["I054"] ?? 0;
    // object.I055 = data["I055"] ?? 0;
    // object.I056 = data["I056"] ?? 0;
    // object.I057 = data["I057"] ?? 0;
    // object.I058 = data["I058"] ?? 0;
    // object.I059 = data["I059"] ?? 0;
    // object.I060 = data["I060"] ?? 0;
    // object.I061 = data["I061"] ?? 0;
    // object.I062 = data["I062"] ?? 0;
    // object.I063 = data["I063"] ?? 0;
    // object.I064 = data["I064"] ?? 0;
    // object.I065 = data["I065"] ?? 0;
    // object.I066 = data["I066"] ?? 0;
    // object.I067 = data["I067"] ?? 0;
    // object.I068 = data["I068"] ?? 0;
    // object.I069 = data["I069"] ?? 0;
    // object.I070 = data["I070"] ?? 0;
    // object.I071 = data["I071"] ?? 0;
    // object.I072 = data["I072"] ?? 0;
    // object.I073 = data["I073"] ?? 0;
    // object.I074 = data["I074"] ?? 0;
    // object.I075 = data["I075"] ?? 0;
    // object.I076 = data["I076"] ?? 0;
    // object.I077 = data["I077"] ?? 0;
    // object.I078 = data["I078"] ?? 0;
    // object.I079 = data["I079"] ?? 0;
    // object.I080 = data["I080"] ?? 0;
    // object.I081 = data["I081"] ?? 0;
    // object.I082 = data["I082"] ?? 0;
    // object.I083 = data["I083"] ?? 0;
    // object.I084 = data["I084"] ?? 0;
    // object.I085 = data["I085"] ?? 0;
    // object.I086 = data["I086"] ?? 0;
    // object.I087 = data["I087"] ?? 0;
    // object.I088 = data["I088"] ?? 0;
    // object.I089 = data["I089"] ?? 0;
    // object.I090 = data["I090"] ?? 0;
    // object.I091 = data["I091"] ?? 0;
    // object.I092 = data["I092"] ?? 0;
    // object.I093 = data["I093"] ?? 0;
    // object.I094 = data["I094"] ?? 0;
    // object.I095 = data["I095"] ?? 0;
    // object.I096 = data["I096"] ?? 0;
    // object.I097 = data["I097"] ?? 0;
    // object.I098 = data["I098"] ?? 0;
    // object.I099 = data["I099"] ?? 0;
    // object.S000 = data["S000"] ?? "";
    // object.S001 = data["S001"] ?? "";
    // object.S002 = data["S002"] ?? "";
    // object.S003 = data["S003"] ?? "";
    // object.S004 = data["S004"] ?? "";
    // object.S005 = data["S005"] ?? "";
    // object.S006 = data["S006"] ?? "";
    // object.S007 = data["S007"] ?? "";
    // object.S008 = data["S008"] ?? "";
    // object.S009 = data["S009"] ?? "";
    // object.S010 = data["S010"] ?? "";
    // object.S011 = data["S011"] ?? "";
    // object.S012 = data["S012"] ?? "";
    // object.S013 = data["S013"] ?? "";
    // object.S014 = data["S014"] ?? "";
    // object.S015 = data["S015"] ?? "";
    // object.S016 = data["S016"] ?? "";
    // object.S017 = data["S017"] ?? "";
    // object.S018 = data["S018"] ?? "";
    // object.S019 = data["S019"] ?? "";
    // object.S020 = data["S020"] ?? "";
    // object.S021 = data["S021"] ?? "";
    // object.S022 = data["S022"] ?? "";
    // object.S023 = data["S023"] ?? "";
    // object.S024 = data["S024"] ?? "";
    // object.S025 = data["S025"] ?? "";
    // object.S026 = data["S026"] ?? "";
    // object.S027 = data["S027"] ?? "";
    // object.S028 = data["S028"] ?? "";
    // object.S029 = data["S029"] ?? "";
    // object.S030 = data["S030"] ?? "";
    // object.S031 = data["S031"] ?? "";
    // object.S032 = data["S032"] ?? "";
    // object.S033 = data["S033"] ?? "";
    // object.S034 = data["S034"] ?? "";
    // object.S035 = data["S035"] ?? "";
    // object.S036 = data["S036"] ?? "";
    // object.S037 = data["S037"] ?? "";
    // object.S038 = data["S038"] ?? "";
    // object.S039 = data["S039"] ?? "";
    // object.S040 = data["S040"] ?? "";
    // object.S041 = data["S041"] ?? "";
    // object.S042 = data["S042"] ?? "";
    // object.S043 = data["S043"] ?? "";
    // object.S044 = data["S044"] ?? "";
    // object.S045 = data["S045"] ?? "";
    // object.S046 = data["S046"] ?? "";
    // object.S047 = data["S047"] ?? "";
    // object.S048 = data["S048"] ?? "";
    // object.S049 = data["S049"] ?? "";
    // object.S050 = data["S050"] ?? "";
    // object.S051 = data["S051"] ?? "";
    // object.S052 = data["S052"] ?? "";
    // object.S053 = data["S053"] ?? "";
    // object.S054 = data["S054"] ?? "";
    // object.S055 = data["S055"] ?? "";
    // object.S056 = data["S056"] ?? "";
    // object.S057 = data["S057"] ?? "";
    // object.S058 = data["S058"] ?? "";
    // object.S059 = data["S059"] ?? "";
    // object.S060 = data["S060"] ?? "";
    // object.S061 = data["S061"] ?? "";
    // object.S062 = data["S062"] ?? "";
    // object.S063 = data["S063"] ?? "";
    // object.S064 = data["S064"] ?? "";
    // object.S065 = data["S065"] ?? "";
    // object.S066 = data["S066"] ?? "";
    // object.S067 = data["S067"] ?? "";
    // object.S068 = data["S068"] ?? "";
    // object.S069 = data["S069"] ?? "";
    // object.S070 = data["S070"] ?? "";
    // object.S071 = data["S071"] ?? "";
    // object.S072 = data["S072"] ?? "";
    // object.S073 = data["S073"] ?? "";
    // object.S074 = data["S074"] ?? "";
    // object.S075 = data["S075"] ?? "";
    // object.S076 = data["S076"] ?? "";
    // object.S077 = data["S077"] ?? "";
    // object.S078 = data["S078"] ?? "";
    // object.S079 = data["S079"] ?? "";
    // object.S080 = data["S080"] ?? "";
    // object.S081 = data["S081"] ?? "";
    // object.S082 = data["S082"] ?? "";
    // object.S083 = data["S083"] ?? "";
    // object.S084 = data["S084"] ?? "";
    // object.S085 = data["S085"] ?? "";
    // object.S086 = data["S086"] ?? "";
    // object.S087 = data["S087"] ?? "";
    // object.S088 = data["S088"] ?? "";
    // object.S089 = data["S089"] ?? "";
    // object.S090 = data["S090"] ?? "";
    // object.S091 = data["S091"] ?? "";
    // object.S092 = data["S092"] ?? "";
    // object.S093 = data["S093"] ?? "";
    // object.S094 = data["S094"] ?? "";
    // object.S095 = data["S095"] ?? "";
    // object.S096 = data["S096"] ?? "";
    // object.S097 = data["S097"] ?? "";
    // object.S098 = data["S098"] ?? "";
    // object.S099 = data["S099"] ?? "";
    // object.B000 = data["B000"] == 1;
    // object.B001 = data["B001"] == 1;
    // object.B002 = data["B002"] == 1;
    // object.B003 = data["B003"] == 1;
    // object.B004 = data["B004"] == 1;
    // object.B005 = data["B005"] == 1;
    // object.B006 = data["B006"] == 1;
    // object.B007 = data["B007"] == 1;
    // object.B008 = data["B008"] == 1;
    // object.B009 = data["B009"] == 1;
    // object.B010 = data["B010"] == 1;
    // object.B011 = data["B011"] == 1;
    // object.B012 = data["B012"] == 1;
    // object.B013 = data["B013"] == 1;
    // object.B014 = data["B014"] == 1;
    // object.B015 = data["B015"] == 1;
    // object.B016 = data["B016"] == 1;
    // object.B017 = data["B017"] == 1;
    // object.B018 = data["B018"] == 1;
    // object.B019 = data["B019"] == 1;
    // object.B020 = data["B020"] == 1;
    // object.B021 = data["B021"] == 1;
    // object.B022 = data["B022"] == 1;
    // object.B023 = data["B023"] == 1;
    // object.B024 = data["B024"] == 1;
    // object.B025 = data["B025"] == 1;
    // object.B026 = data["B026"] == 1;
    // object.B027 = data["B027"] == 1;
    // object.B028 = data["B028"] == 1;
    // object.B029 = data["B029"] == 1;
    // object.B030 = data["B030"] == 1;
    // object.R000 = data["R000"] ?? 0;
    // object.R001 = data["R001"] ?? 0;
    // object.R002 = data["R002"] ?? 0;
    // object.R003 = data["R003"] ?? 0;
    // object.R004 = data["R004"] ?? 0;
    // object.R005 = data["R005"] ?? 0;
    // object.R006 = data["R006"] ?? 0;
    // object.R007 = data["R007"] ?? 0;
    // object.R008 = data["R008"] ?? 0;
    // object.R009 = data["R009"] ?? 0;
    // object.R010 = data["R010"] ?? 0;
    // object.R011 = data["R011"] ?? 0;
    // object.R012 = data["R012"] ?? 0;
    // object.R013 = data["R013"] ?? 0;
    // object.R014 = data["R014"] ?? 0;
    // object.R015 = data["R015"] ?? 0;
    // object.R016 = data["R016"] ?? 0;
    // object.R017 = data["R017"] ?? 0;
    // object.R018 = data["R018"] ?? 0;
    // object.R019 = data["R019"] ?? 0;
    // object.R020 = data["R020"] ?? 0;
    // object.R021 = data["R021"] ?? 0;
    // object.R022 = data["R022"] ?? 0;
    // object.R023 = data["R023"] ?? 0;
    // object.R024 = data["R024"] ?? 0;
    // object.R025 = data["R025"] ?? 0;
    // object.R026 = data["R026"] ?? 0;
    // object.R027 = data["R027"] ?? 0;
    // object.R028 = data["R028"] ?? 0;
    // object.R029 = data["R029"] ?? 0;
    // object.R030 = data["R030"] ?? 0;
    // obj.L000 = List<String>.from(data['L000'] ?? []);
    // obj.L001 = List<String>.from(data['L001'] ?? []);
    // obj.L002 = List<String>.from(data['L002'] ?? []);
    // obj.L003 = List<String>.from(data['L003'] ?? []);
    // obj.L004 = List<String>.from(data['L004'] ?? []);
    // obj.L005 = List<String>.from(data['L005'] ?? []);
    // obj.L006 = List<String>.from(data['L006'] ?? []);
    // obj.L007 = List<String>.from(data['L007'] ?? []);
    // obj.L008 = List<String>.from(data['L008'] ?? []);
    // obj.L009 = List<String>.from(data['L009'] ?? []);
    // obj.L010 = List<String>.from(data['L010'] ?? []);
    // obj.L011 = List<String>.from(data['L011'] ?? []);
    // obj.L012 = List<String>.from(data['L012'] ?? []);
    // obj.L013 = List<String>.from(data['L013'] ?? []);
    // obj.L014 = List<String>.from(data['L014'] ?? []);
    // obj.L015 = List<String>.from(data['L015'] ?? []);
    // obj.L016 = List<String>.from(data['L016'] ?? []);
    // obj.L017 = List<String>.from(data['L017'] ?? []);
    // obj.L018 = List<String>.from(data['L018'] ?? []);
    // obj.L019 = List<String>.from(data['L019'] ?? []);
    // obj.L020 = List<String>.from(data['L020'] ?? []);
    // object.C000 = SomeModel.fromString(data["C000"] ?? SomeModel().toString());
    // object.C001 = SomeModel.fromString(data['C001'] ?? SomeModel().toString());
    // object.C002 = SomeModel.fromString(data['C002'] ?? SomeModel().toString());
    // object.C003 = SomeModel.fromString(data['C003'] ?? SomeModel().toString());
    // object.C004 = SomeModel.fromString(data['C004'] ?? SomeModel().toString());
    // object.C005 = SomeModel.fromString(data['C005'] ?? SomeModel().toString());
    // object.C006 = SomeModel.fromString(data['C006'] ?? SomeModel().toString());
    // object.C007 = SomeModel.fromString(data['C007'] ?? SomeModel().toString());
    // object.C008 = SomeModel.fromString(data['C008'] ?? SomeModel().toString());
    // object.C009 = SomeModel.fromString(data['C009'] ?? SomeModel().toString());
    // object.C010 = SomeModel.fromString(data['C010'] ?? SomeModel().toString());
    // object.C011 = SomeModel.fromString(data['C011'] ?? SomeModel().toString());
    // object.C012 = SomeModel.fromString(data['C012'] ?? SomeModel().toString());
    // object.C013 = SomeModel.fromString(data['C013'] ?? SomeModel().toString());
    // object.C014 = SomeModel.fromString(data['C014'] ?? SomeModel().toString());
    // object.C015 = SomeModel.fromString(data['C015'] ?? SomeModel().toString());
    // object.C016 = SomeModel.fromString(data['C016'] ?? SomeModel().toString());
    // object.C017 = SomeModel.fromString(data['C017'] ?? SomeModel().toString());
    // object.C018 = SomeModel.fromString(data['C018'] ?? SomeModel().toString());
    // object.C019 = SomeModel.fromString(data['C019'] ?? SomeModel().toString());
    // object.C020 = SomeModel.fromString(data['C020'] ?? SomeModel().toString());

    // object.J000 = List<String>.from(data['J000'] is String ? jsonDecode(data['J000']) : (data['J000'] ?? [])).data((item) => SomeModel.fromString(item)).toList();
    // object.J001 = List<String>.from(data['J001'] is String ? jsonDecode(data['J001']) : (data['J001'] ?? [])).data((item) => SomeModel.fromString(item)).toList();
    // object.J002 = List<String>.from(data['J002'] is String ? jsonDecode(data['J002']) : (data['J002'] ?? [])).data((item) => SomeModel.fromString(item)).toList();
    // object.J003 = List<String>.from(data['J003'] is String ? jsonDecode(data['J003']) : (data['J003'] ?? [])).data((item) => SomeModel.fromString(item)).toList();
    // object.J004 = List<String>.from(data['J004'] is String ? jsonDecode(data['J004']) : (data['J004'] ?? [])).data((item) => SomeModel.fromString(item)).toList();
    // object.J005 = List<String>.from(data['J005'] is String ? jsonDecode(data['J005']) : (data['J005'] ?? [])).data((item) => SomeModel.fromString(item)).toList();
    // object.J006 = List<String>.from(data['J006'] is String ? jsonDecode(data['J006']) : (data['J006'] ?? [])).data((item) => SomeModel.fromString(item)).toList();
    // object.J007 = List<String>.from(data['J007'] is String ? jsonDecode(data['J007']) : (data['J007'] ?? [])).data((item) => SomeModel.fromString(item)).toList();
    // object.J008 = List<String>.from(data['J008'] is String ? jsonDecode(data['J008']) : (data['J008'] ?? [])).data((item) => SomeModel.fromString(item)).toList();
    // object.J009 = List<String>.from(data['J009'] is String ? jsonDecode(data['J009']) : (data['J009'] ?? [])).data((item) => SomeModel.fromString(item)).toList();
    // object.J010 = List<String>.from(data['J010'] is String ? jsonDecode(data['J010']) : (data['J010'] ?? [])).data((item) => SomeModel.fromString(item)).toList();
    // object.J011 = List<String>.from(data['J011'] is String ? jsonDecode(data['J011']) : (data['J011'] ?? [])).data((item) => SomeModel.fromString(item)).toList();
    // object.J012 = List<String>.from(data['J012'] is String ? jsonDecode(data['J012']) : (data['J012'] ?? [])).data((item) => SomeModel.fromString(item)).toList();
    // object.J013 = List<String>.from(data['J013'] is String ? jsonDecode(data['J013']) : (data['J013'] ?? [])).data((item) => SomeModel.fromString(item)).toList();
    // object.J014 = List<String>.from(data['J014'] is String ? jsonDecode(data['J014']) : (data['J014'] ?? [])).data((item) => SomeModel.fromString(item)).toList();
    // object.J015 = List<String>.from(data['J015'] is String ? jsonDecode(data['J015']) : (data['J015'] ?? [])).data((item) => SomeModel.fromString(item)).toList();
    // object.J016 = List<String>.from(data['J016'] is String ? jsonDecode(data['J016']) : (data['J016'] ?? [])).data((item) => SomeModel.fromString(item)).toList();
    // object.J017 = List<String>.from(data['J017'] is String ? jsonDecode(data['J017']) : (data['J017'] ?? [])).data((item) => SomeModel.fromString(item)).toList();
    // object.J018 = List<String>.from(data['J018'] is String ? jsonDecode(data['J018']) : (data['J018'] ?? [])).data((item) => SomeModel.fromString(item)).toList();
    // object.J019 = List<String>.from(data['J019'] is String ? jsonDecode(data['J019']) : (data['J019'] ?? [])).data((item) => SomeModel.fromString(item)).toList();
    // object.J020 = List<String>.from(data['J020'] is String ? jsonDecode(data['J020']) : (data['J020'] ?? [])).data((item) => SomeModel.fromString(item)).toList();

    // object.E000 = SomeEnum.fromString(data["E000"] ?? SomeEnum.NotSelected.toStringValue());
    // object.E001 = SomeEnum.fromString(data["E001"] ?? SomeEnum.NotSelected.toStringValue());
    // object.E002 = SomeEnum.fromString(data["E002"] ?? SomeEnum.NotSelected.toStringValue());
    // object.E003 = SomeEnum.fromString(data["E003"] ?? SomeEnum.NotSelected.toStringValue());
    // object.E004 = SomeEnum.fromString(data["E004"] ?? SomeEnum.NotSelected.toStringValue());
    // object.E005 = SomeEnum.fromString(data["E005"] ?? SomeEnum.NotSelected.toStringValue());
    // object.E006 = SomeEnum.fromString(data["E006"] ?? SomeEnum.NotSelected.toStringValue());
    // object.E007 = SomeEnum.fromString(data["E007"] ?? SomeEnum.NotSelected.toStringValue());
    // object.E008 = SomeEnum.fromString(data["E008"] ?? SomeEnum.NotSelected.toStringValue());
    // object.E009 = SomeEnum.fromString(data["E009"] ?? SomeEnum.NotSelected.toStringValue());
    // object.E010 = SomeEnum.fromString(data["E010"] ?? SomeEnum.NotSelected.toStringValue());
    // object.E011 = SomeEnum.fromString(data["E011"] ?? SomeEnum.NotSelected.toStringValue());
    // object.E012 = SomeEnum.fromString(data["E012"] ?? SomeEnum.NotSelected.toStringValue());
    // object.E013 = SomeEnum.fromString(data["E013"] ?? SomeEnum.NotSelected.toStringValue());
    // object.E014 = SomeEnum.fromString(data["E014"] ?? SomeEnum.NotSelected.toStringValue());
    // object.E015 = SomeEnum.fromString(data["E015"] ?? SomeEnum.NotSelected.toStringValue());
    // object.E016 = SomeEnum.fromString(data["E016"] ?? SomeEnum.NotSelected.toStringValue());
    // object.E017 = SomeEnum.fromString(data["E017"] ?? SomeEnum.NotSelected.toStringValue());
    // object.E018 = SomeEnum.fromString(data["E018"] ?? SomeEnum.NotSelected.toStringValue());
    // object.E019 = SomeEnum.fromString(data["E019"] ?? SomeEnum.NotSelected.toStringValue());
    // object.E020 = SomeEnum.fromString(data["E020"] ?? SomeEnum.NotSelected.toStringValue());

    if (data["DocId"] != null) {
      object.DocId = data["DocId"];
    }

    return object;
  }

  //////////////////////////////////////
  bool _ready() {
    if (FirebaseAuth.instance.currentUser == null) return false;
    return true;
  }

  CollectionReference<NewModel> objectRef() {
    return objectDocRef().withConverter<NewModel>(
        fromFirestore: (snapshot, _) => fromMap(
              snapshot.data()!,
            ),
        toFirestore: (object, _) => toMap(object: object));
  }
}
