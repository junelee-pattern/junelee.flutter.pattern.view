import 'dart:convert';
import 'dart:io';

import 'package:get_storage/get_storage.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../../domain/entity/model/new/model.dart';
import 'util/managing_table.dart';

class NewModelSqflite {
  Future<NewModel?> get(String docId) async {
    await _ready();
    List<Map> maps = await NewModelDb.query('NewModel',
        // columns: [_columnId, s1, s2],//한정해야할필요가 있을때만 적용
        where: 'DocId = ?',
        whereArgs: [docId]);
    if (maps.isNotEmpty) {
      return fromMap(maps.first);
    }
    return null;
  }

  // Future<NewModel?> getByI000(int value) async {
  //   await _ready();
  //   List<Map> maps = await NewModelDb.query('NewModel',
  //       where: 'I000 = ?', whereArgs: [value]);
  //   if (maps.isNotEmpty) {
  //     return fromMap(maps.first);
  //   }
  //   return null;
  // }

  Future<List<NewModel>> getAll() async {
    await _ready();

    List<Map> maps = await NewModelDb.query('NewModel');
    List<NewModel> result = [];

    if (maps.isNotEmpty) {
      for (var element in maps) {
        result.add(fromMap(element));
      }
      return result;
    }
    return [];
  }

  Future<List<NewModel>> getWhere(String where) async {
    await _ready();

    List<Map> maps = await NewModelDb.query(
      'NewModel',
      where: where,
    );
    List<NewModel> result = [];

    if (maps.isNotEmpty) {
      for (var element in maps) {
        result.add(fromMap(element));
      }
      return result;
    }
    return [];
  }

  Future<List<NewModel>> queryMoreThenUsingI000(int time) async {
    await _ready();

    List<Map> maps = await NewModelDb.query('NewModel',
        where: 'I000 > ?', whereArgs: [time]);
    List<NewModel> result = [];

    if (maps.isNotEmpty) {
      for (var element in maps) {
        result.add(fromMap(element));
      }
      return result;
    }
    return [];
  }

  Future<int?> getRowCount() async {
    await _ready();
    return Sqflite.firstIntValue(
        await NewModelDb.rawQuery('SELECT COUNT(*) FROM NewModel'));
  }

  Future<void> upsert(NewModel newObject) async {
    var oldObject = await get(newObject.DocId);

    if (oldObject != null) {
      await update(newObject, oldObject);
    } else {
      await insert(newObject);
    }
  }

  insertBulk(List<NewModel> objects) async {
    if (objects.isEmpty) return;
    await _ready();

    Batch batch = NewModelDb.batch();

    // for loop with index
    for (var i = 0; i < objects.length; i++) {
      var element = objects[i];
      batch.insert('NewModel', toMap(object: element));
    }

    await batch.commit(noResult: true);
  }

  updateBulk(List<NewModel> objects) async {
    if (objects.isEmpty) return;
    await _ready();

    Batch batch = NewModelDb.batch();

    for (var i = 0; i < objects.length; i++) {
      var element = objects[i];
      batch.update('NewModel', toMap(object: element),
          where: 'DocId = ?', whereArgs: [element.DocId]);
    }

    await batch.commit(noResult: true);
  }

  Future<int> insert(NewModel object) async {
    await _ready();

    return await NewModelDb.insert('NewModel', toMap(object: object));
  }

  Future<int> update(NewModel object, NewModel oldObject) async {
    await _ready();

    return await NewModelDb.update('NewModel', toMap(object: object),
        where: 'DocId = ?', whereArgs: [oldObject.DocId]);
  }

  Future<void> delete(NewModel object) async {
    await _ready();

    if (await get(object.DocId) == null) return;

    await NewModelDb.delete('NewModel',
        where: 'DocId = ?', whereArgs: [object.DocId]);
  }

  Future<void> deleteAll() async {
    await _ready();
    await NewModelDb.delete('NewModel');
  }

  ///////////////////////////////////////
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
    // map["L000"] = jsonEncode(object.L000);
    // map["L001"] = jsonEncode(object.L001);
    // map["L002"] = jsonEncode(object.L002);
    // map["L003"] = jsonEncode(object.L003);
    // map["L004"] = jsonEncode(object.L004);
    // map["L005"] = jsonEncode(object.L005);
    // map["L006"] = jsonEncode(object.L006);
    // map["L007"] = jsonEncode(object.L007);
    // map["L008"] = jsonEncode(object.L008);
    // map["L009"] = jsonEncode(object.L009);
    // map["L010"] = jsonEncode(object.L010);
    // map["L011"] = jsonEncode(object.L011);
    // map["L012"] = jsonEncode(object.L012);
    // map["L013"] = jsonEncode(object.L013);
    // map["L014"] = jsonEncode(object.L014);
    // map["L015"] = jsonEncode(object.L015);
    // map["L016"] = jsonEncode(object.L016);
    // map["L017"] = jsonEncode(object.L017);
    // map["L018"] = jsonEncode(object.L018);
    // map["L019"] = jsonEncode(object.L019);
    // map["L020"] = jsonEncode(object.L020);
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

  NewModel fromMap(Map<dynamic, dynamic> map) {
    NewModel object = NewModel();

    object.I000 = map["I000"] ?? 0;
    // object.I001 = map["I001"] ?? 0;
    // object.I002 = map["I002"] ?? 0;
    // object.I003 = map["I003"] ?? 0;
    // object.I004 = map["I004"] ?? 0;
    // object.I005 = map["I005"] ?? 0;
    // object.I006 = map["I006"] ?? 0;
    // object.I007 = map["I007"] ?? 0;
    // object.I008 = map["I008"] ?? 0;
    // object.I009 = map["I009"] ?? 0;
    // object.I010 = map["I010"] ?? 0;
    // object.I011 = map["I011"] ?? 0;
    // object.I012 = map["I012"] ?? 0;
    // object.I013 = map["I013"] ?? 0;
    // object.I014 = map["I014"] ?? 0;
    // object.I015 = map["I015"] ?? 0;
    // object.I016 = map["I016"] ?? 0;
    // object.I017 = map["I017"] ?? 0;
    // object.I018 = map["I018"] ?? 0;
    // object.I019 = map["I019"] ?? 0;
    // object.I020 = map["I020"] ?? 0;
    // object.I021 = map["I021"] ?? 0;
    // object.I022 = map["I022"] ?? 0;
    // object.I023 = map["I023"] ?? 0;
    // object.I024 = map["I024"] ?? 0;
    // object.I025 = map["I025"] ?? 0;
    // object.I026 = map["I026"] ?? 0;
    // object.I027 = map["I027"] ?? 0;
    // object.I028 = map["I028"] ?? 0;
    // object.I029 = map["I029"] ?? 0;
    // object.I030 = map["I030"] ?? 0;
    // object.I031 = map["I031"] ?? 0;
    // object.I032 = map["I032"] ?? 0;
    // object.I033 = map["I033"] ?? 0;
    // object.I034 = map["I034"] ?? 0;
    // object.I035 = map["I035"] ?? 0;
    // object.I036 = map["I036"] ?? 0;
    // object.I037 = map["I037"] ?? 0;
    // object.I038 = map["I038"] ?? 0;
    // object.I039 = map["I039"] ?? 0;
    // object.I040 = map["I040"] ?? 0;
    // object.I041 = map["I041"] ?? 0;
    // object.I042 = map["I042"] ?? 0;
    // object.I043 = map["I043"] ?? 0;
    // object.I044 = map["I044"] ?? 0;
    // object.I045 = map["I045"] ?? 0;
    // object.I046 = map["I046"] ?? 0;
    // object.I047 = map["I047"] ?? 0;
    // object.I048 = map["I048"] ?? 0;
    // object.I049 = map["I049"] ?? 0;
    // object.I050 = map["I050"] ?? 0;
    // object.I051 = map["I051"] ?? 0;
    // object.I052 = map["I052"] ?? 0;
    // object.I053 = map["I053"] ?? 0;
    // object.I054 = map["I054"] ?? 0;
    // object.I055 = map["I055"] ?? 0;
    // object.I056 = map["I056"] ?? 0;
    // object.I057 = map["I057"] ?? 0;
    // object.I058 = map["I058"] ?? 0;
    // object.I059 = map["I059"] ?? 0;
    // object.I060 = map["I060"] ?? 0;
    // object.I061 = map["I061"] ?? 0;
    // object.I062 = map["I062"] ?? 0;
    // object.I063 = map["I063"] ?? 0;
    // object.I064 = map["I064"] ?? 0;
    // object.I065 = map["I065"] ?? 0;
    // object.I066 = map["I066"] ?? 0;
    // object.I067 = map["I067"] ?? 0;
    // object.I068 = map["I068"] ?? 0;
    // object.I069 = map["I069"] ?? 0;
    // object.I070 = map["I070"] ?? 0;
    // object.I071 = map["I071"] ?? 0;
    // object.I072 = map["I072"] ?? 0;
    // object.I073 = map["I073"] ?? 0;
    // object.I074 = map["I074"] ?? 0;
    // object.I075 = map["I075"] ?? 0;
    // object.I076 = map["I076"] ?? 0;
    // object.I077 = map["I077"] ?? 0;
    // object.I078 = map["I078"] ?? 0;
    // object.I079 = map["I079"] ?? 0;
    // object.I080 = map["I080"] ?? 0;
    // object.I081 = map["I081"] ?? 0;
    // object.I082 = map["I082"] ?? 0;
    // object.I083 = map["I083"] ?? 0;
    // object.I084 = map["I084"] ?? 0;
    // object.I085 = map["I085"] ?? 0;
    // object.I086 = map["I086"] ?? 0;
    // object.I087 = map["I087"] ?? 0;
    // object.I088 = map["I088"] ?? 0;
    // object.I089 = map["I089"] ?? 0;
    // object.I090 = map["I090"] ?? 0;
    // object.I091 = map["I091"] ?? 0;
    // object.I092 = map["I092"] ?? 0;
    // object.I093 = map["I093"] ?? 0;
    // object.I094 = map["I094"] ?? 0;
    // object.I095 = map["I095"] ?? 0;
    // object.I096 = map["I096"] ?? 0;
    // object.I097 = map["I097"] ?? 0;
    // object.I098 = map["I098"] ?? 0;
    // object.I099 = map["I099"] ?? 0;
    // object.S000 = map["S000"] ?? "";
    // object.S001 = map["S001"] ?? "";
    // object.S002 = map["S002"] ?? "";
    // object.S003 = map["S003"] ?? "";
    // object.S004 = map["S004"] ?? "";
    // object.S005 = map["S005"] ?? "";
    // object.S006 = map["S006"] ?? "";
    // object.S007 = map["S007"] ?? "";
    // object.S008 = map["S008"] ?? "";
    // object.S009 = map["S009"] ?? "";
    // object.S010 = map["S010"] ?? "";
    // object.S011 = map["S011"] ?? "";
    // object.S012 = map["S012"] ?? "";
    // object.S013 = map["S013"] ?? "";
    // object.S014 = map["S014"] ?? "";
    // object.S015 = map["S015"] ?? "";
    // object.S016 = map["S016"] ?? "";
    // object.S017 = map["S017"] ?? "";
    // object.S018 = map["S018"] ?? "";
    // object.S019 = map["S019"] ?? "";
    // object.S020 = map["S020"] ?? "";
    // object.S021 = map["S021"] ?? "";
    // object.S022 = map["S022"] ?? "";
    // object.S023 = map["S023"] ?? "";
    // object.S024 = map["S024"] ?? "";
    // object.S025 = map["S025"] ?? "";
    // object.S026 = map["S026"] ?? "";
    // object.S027 = map["S027"] ?? "";
    // object.S028 = map["S028"] ?? "";
    // object.S029 = map["S029"] ?? "";
    // object.S030 = map["S030"] ?? "";
    // object.S031 = map["S031"] ?? "";
    // object.S032 = map["S032"] ?? "";
    // object.S033 = map["S033"] ?? "";
    // object.S034 = map["S034"] ?? "";
    // object.S035 = map["S035"] ?? "";
    // object.S036 = map["S036"] ?? "";
    // object.S037 = map["S037"] ?? "";
    // object.S038 = map["S038"] ?? "";
    // object.S039 = map["S039"] ?? "";
    // object.S040 = map["S040"] ?? "";
    // object.S041 = map["S041"] ?? "";
    // object.S042 = map["S042"] ?? "";
    // object.S043 = map["S043"] ?? "";
    // object.S044 = map["S044"] ?? "";
    // object.S045 = map["S045"] ?? "";
    // object.S046 = map["S046"] ?? "";
    // object.S047 = map["S047"] ?? "";
    // object.S048 = map["S048"] ?? "";
    // object.S049 = map["S049"] ?? "";
    // object.S050 = map["S050"] ?? "";
    // object.S051 = map["S051"] ?? "";
    // object.S052 = map["S052"] ?? "";
    // object.S053 = map["S053"] ?? "";
    // object.S054 = map["S054"] ?? "";
    // object.S055 = map["S055"] ?? "";
    // object.S056 = map["S056"] ?? "";
    // object.S057 = map["S057"] ?? "";
    // object.S058 = map["S058"] ?? "";
    // object.S059 = map["S059"] ?? "";
    // object.S060 = map["S060"] ?? "";
    // object.S061 = map["S061"] ?? "";
    // object.S062 = map["S062"] ?? "";
    // object.S063 = map["S063"] ?? "";
    // object.S064 = map["S064"] ?? "";
    // object.S065 = map["S065"] ?? "";
    // object.S066 = map["S066"] ?? "";
    // object.S067 = map["S067"] ?? "";
    // object.S068 = map["S068"] ?? "";
    // object.S069 = map["S069"] ?? "";
    // object.S070 = map["S070"] ?? "";
    // object.S071 = map["S071"] ?? "";
    // object.S072 = map["S072"] ?? "";
    // object.S073 = map["S073"] ?? "";
    // object.S074 = map["S074"] ?? "";
    // object.S075 = map["S075"] ?? "";
    // object.S076 = map["S076"] ?? "";
    // object.S077 = map["S077"] ?? "";
    // object.S078 = map["S078"] ?? "";
    // object.S079 = map["S079"] ?? "";
    // object.S080 = map["S080"] ?? "";
    // object.S081 = map["S081"] ?? "";
    // object.S082 = map["S082"] ?? "";
    // object.S083 = map["S083"] ?? "";
    // object.S084 = map["S084"] ?? "";
    // object.S085 = map["S085"] ?? "";
    // object.S086 = map["S086"] ?? "";
    // object.S087 = map["S087"] ?? "";
    // object.S088 = map["S088"] ?? "";
    // object.S089 = map["S089"] ?? "";
    // object.S090 = map["S090"] ?? "";
    // object.S091 = map["S091"] ?? "";
    // object.S092 = map["S092"] ?? "";
    // object.S093 = map["S093"] ?? "";
    // object.S094 = map["S094"] ?? "";
    // object.S095 = map["S095"] ?? "";
    // object.S096 = map["S096"] ?? "";
    // object.S097 = map["S097"] ?? "";
    // object.S098 = map["S098"] ?? "";
    // object.S099 = map["S099"] ?? "";
    // object.B000 = map["B000"] == 1;
    // object.B001 = map["B001"] == 1;
    // object.B002 = map["B002"] == 1;
    // object.B003 = map["B003"] == 1;
    // object.B004 = map["B004"] == 1;
    // object.B005 = map["B005"] == 1;
    // object.B006 = map["B006"] == 1;
    // object.B007 = map["B007"] == 1;
    // object.B008 = map["B008"] == 1;
    // object.B009 = map["B009"] == 1;
    // object.B010 = map["B010"] == 1;
    // object.B011 = map["B011"] == 1;
    // object.B012 = map["B012"] == 1;
    // object.B013 = map["B013"] == 1;
    // object.B014 = map["B014"] == 1;
    // object.B015 = map["B015"] == 1;
    // object.B016 = map["B016"] == 1;
    // object.B017 = map["B017"] == 1;
    // object.B018 = map["B018"] == 1;
    // object.B019 = map["B019"] == 1;
    // object.B020 = map["B020"] == 1;
    // object.B021 = map["B021"] == 1;
    // object.B022 = map["B022"] == 1;
    // object.B023 = map["B023"] == 1;
    // object.B024 = map["B024"] == 1;
    // object.B025 = map["B025"] == 1;
    // object.B026 = map["B026"] == 1;
    // object.B027 = map["B027"] == 1;
    // object.B028 = map["B028"] == 1;
    // object.B029 = map["B029"] == 1;
    // object.B030 = map["B030"] == 1;
    // object.R000 = map["R000"] ?? 0;
    // object.R001 = map["R001"] ?? 0;
    // object.R002 = map["R002"] ?? 0;
    // object.R003 = map["R003"] ?? 0;
    // object.R004 = map["R004"] ?? 0;
    // object.R005 = map["R005"] ?? 0;
    // object.R006 = map["R006"] ?? 0;
    // object.R007 = map["R007"] ?? 0;
    // object.R008 = map["R008"] ?? 0;
    // object.R009 = map["R009"] ?? 0;
    // object.R010 = map["R010"] ?? 0;
    // object.R011 = map["R011"] ?? 0;
    // object.R012 = map["R012"] ?? 0;
    // object.R013 = map["R013"] ?? 0;
    // object.R014 = map["R014"] ?? 0;
    // object.R015 = map["R015"] ?? 0;
    // object.R016 = map["R016"] ?? 0;
    // object.R017 = map["R017"] ?? 0;
    // object.R018 = map["R018"] ?? 0;
    // object.R019 = map["R019"] ?? 0;
    // object.R020 = map["R020"] ?? 0;
    // object.R021 = map["R021"] ?? 0;
    // object.R022 = map["R022"] ?? 0;
    // object.R023 = map["R023"] ?? 0;
    // object.R024 = map["R024"] ?? 0;
    // object.R025 = map["R025"] ?? 0;
    // object.R026 = map["R026"] ?? 0;
    // object.R027 = map["R027"] ?? 0;
    // object.R028 = map["R028"] ?? 0;
    // object.R029 = map["R029"] ?? 0;
    // object.R030 = map["R030"] ?? 0;
    // object.L000 = jsonDecode(map["L000"] ?? "[]");
    // object.L001 = jsonDecode(map["L001"] ?? "[]");
    // object.L002 = jsonDecode(map["L002"] ?? "[]");
    // object.L003 = jsonDecode(map["L003"] ?? "[]");
    // object.L004 = jsonDecode(map["L004"] ?? "[]");
    // object.L005 = jsonDecode(map["L005"] ?? "[]");
    // object.L006 = jsonDecode(map["L006"] ?? "[]");
    // object.L007 = jsonDecode(map["L007"] ?? "[]");
    // object.L008 = jsonDecode(map["L008"] ?? "[]");
    // object.L009 = jsonDecode(map["L009"] ?? "[]");
    // object.L010 = jsonDecode(map["L010"] ?? "[]");
    // object.L011 = jsonDecode(map["L011"] ?? "[]");
    // object.L012 = jsonDecode(map["L012"] ?? "[]");
    // object.L013 = jsonDecode(map["L013"] ?? "[]");
    // object.L014 = jsonDecode(map["L014"] ?? "[]");
    // object.L015 = jsonDecode(map["L015"] ?? "[]");
    // object.L016 = jsonDecode(map["L016"] ?? "[]");
    // object.L017 = jsonDecode(map["L017"] ?? "[]");
    // object.L018 = jsonDecode(map["L018"] ?? "[]");
    // object.L019 = jsonDecode(map["L019"] ?? "[]");
    // object.L020 = jsonDecode(map["L020"] ?? "[]");
    // object.C000 = SomeModel.fromString(map["C000"] ?? SomeModel().toString());
    // object.C001 = SomeModel.fromString(map['C001'] ?? SomeModel().toString());
    // object.C002 = SomeModel.fromString(map['C002'] ?? SomeModel().toString());
    // object.C003 = SomeModel.fromString(map['C003'] ?? SomeModel().toString());
    // object.C004 = SomeModel.fromString(map['C004'] ?? SomeModel().toString());
    // object.C005 = SomeModel.fromString(map['C005'] ?? SomeModel().toString());
    // object.C006 = SomeModel.fromString(map['C006'] ?? SomeModel().toString());
    // object.C007 = SomeModel.fromString(map['C007'] ?? SomeModel().toString());
    // object.C008 = SomeModel.fromString(map['C008'] ?? SomeModel().toString());
    // object.C009 = SomeModel.fromString(map['C009'] ?? SomeModel().toString());
    // object.C010 = SomeModel.fromString(map['C010'] ?? SomeModel().toString());
    // object.C011 = SomeModel.fromString(map['C011'] ?? SomeModel().toString());
    // object.C012 = SomeModel.fromString(map['C012'] ?? SomeModel().toString());
    // object.C013 = SomeModel.fromString(map['C013'] ?? SomeModel().toString());
    // object.C014 = SomeModel.fromString(map['C014'] ?? SomeModel().toString());
    // object.C015 = SomeModel.fromString(map['C015'] ?? SomeModel().toString());
    // object.C016 = SomeModel.fromString(map['C016'] ?? SomeModel().toString());
    // object.C017 = SomeModel.fromString(map['C017'] ?? SomeModel().toString());
    // object.C018 = SomeModel.fromString(map['C018'] ?? SomeModel().toString());
    // object.C019 = SomeModel.fromString(map['C019'] ?? SomeModel().toString());
    // object.C020 = SomeModel.fromString(map['C020'] ?? SomeModel().toString());

    // object.J000 = (jsonDecode(map["J000"] ?? "[]") as List).map((item) => SomeModel.fromString(item)).toList();
    // object.J001 = (jsonDecode(map["J001"] ?? "[]") as List).map((item) => SomeModel.fromString(item)).toList();
    // object.J002 = (jsonDecode(map["J002"] ?? "[]") as List).map((item) => SomeModel.fromString(item)).toList();
    // object.J003 = (jsonDecode(map["J003"] ?? "[]") as List).map((item) => SomeModel.fromString(item)).toList();
    // object.J004 = (jsonDecode(map["J004"] ?? "[]") as List).map((item) => SomeModel.fromString(item)).toList();
    // object.J005 = (jsonDecode(map["J005"] ?? "[]") as List).map((item) => SomeModel.fromString(item)).toList();
    // object.J006 = (jsonDecode(map["J006"] ?? "[]") as List).map((item) => SomeModel.fromString(item)).toList();
    // object.J007 = (jsonDecode(map["J007"] ?? "[]") as List).map((item) => SomeModel.fromString(item)).toList();
    // object.J008 = (jsonDecode(map["J008"] ?? "[]") as List).map((item) => SomeModel.fromString(item)).toList();
    // object.J009 = (jsonDecode(map["J009"] ?? "[]") as List).map((item) => SomeModel.fromString(item)).toList();
    // object.J010 = (jsonDecode(map["J010"] ?? "[]") as List).map((item) => SomeModel.fromString(item)).toList();
    // object.J011 = (jsonDecode(map["J011"] ?? "[]") as List).map((item) => SomeModel.fromString(item)).toList();
    // object.J012 = (jsonDecode(map["J012"] ?? "[]") as List).map((item) => SomeModel.fromString(item)).toList();
    // object.J013 = (jsonDecode(map["J013"] ?? "[]") as List).map((item) => SomeModel.fromString(item)).toList();
    // object.J014 = (jsonDecode(map["J014"] ?? "[]") as List).map((item) => SomeModel.fromString(item)).toList();
    // object.J015 = (jsonDecode(map["J015"] ?? "[]") as List).map((item) => SomeModel.fromString(item)).toList();
    // object.J016 = (jsonDecode(map["J016"] ?? "[]") as List).map((item) => SomeModel.fromString(item)).toList();
    // object.J017 = (jsonDecode(map["J017"] ?? "[]") as List).map((item) => SomeModel.fromString(item)).toList();
    // object.J018 = (jsonDecode(map["J018"] ?? "[]") as List).map((item) => SomeModel.fromString(item)).toList();
    // object.J019 = (jsonDecode(map["J019"] ?? "[]") as List).map((item) => SomeModel.fromString(item)).toList();
    // object.J020 = (jsonDecode(map["J020"] ?? "[]") as List).map((item) => SomeModel.fromString(item)).toList();

    // object.E000 = SomeEnum.fromString(map["E000"] ?? SomeEnum.NotSelected.toStringValue());
    // object.E001 = SomeEnum.fromString(map["E001"] ?? SomeEnum.NotSelected.toStringValue());
    // object.E002 = SomeEnum.fromString(map["E002"] ?? SomeEnum.NotSelected.toStringValue());
    // object.E003 = SomeEnum.fromString(map["E003"] ?? SomeEnum.NotSelected.toStringValue());
    // object.E004 = SomeEnum.fromString(map["E004"] ?? SomeEnum.NotSelected.toStringValue());
    // object.E005 = SomeEnum.fromString(map["E005"] ?? SomeEnum.NotSelected.toStringValue());
    // object.E006 = SomeEnum.fromString(map["E006"] ?? SomeEnum.NotSelected.toStringValue());
    // object.E007 = SomeEnum.fromString(map["E007"] ?? SomeEnum.NotSelected.toStringValue());
    // object.E008 = SomeEnum.fromString(map["E008"] ?? SomeEnum.NotSelected.toStringValue());
    // object.E009 = SomeEnum.fromString(map["E009"] ?? SomeEnum.NotSelected.toStringValue());
    // object.E010 = SomeEnum.fromString(map["E010"] ?? SomeEnum.NotSelected.toStringValue());
    // object.E011 = SomeEnum.fromString(map["E011"] ?? SomeEnum.NotSelected.toStringValue());
    // object.E012 = SomeEnum.fromString(map["E012"] ?? SomeEnum.NotSelected.toStringValue());
    // object.E013 = SomeEnum.fromString(map["E013"] ?? SomeEnum.NotSelected.toStringValue());
    // object.E014 = SomeEnum.fromString(map["E014"] ?? SomeEnum.NotSelected.toStringValue());
    // object.E015 = SomeEnum.fromString(map["E015"] ?? SomeEnum.NotSelected.toStringValue());
    // object.E016 = SomeEnum.fromString(map["E016"] ?? SomeEnum.NotSelected.toStringValue());
    // object.E017 = SomeEnum.fromString(map["E017"] ?? SomeEnum.NotSelected.toStringValue());
    // object.E018 = SomeEnum.fromString(map["E018"] ?? SomeEnum.NotSelected.toStringValue());
    // object.E019 = SomeEnum.fromString(map["E019"] ?? SomeEnum.NotSelected.toStringValue());
    // object.E020 = SomeEnum.fromString(map["E020"] ?? SomeEnum.NotSelected.toStringValue());

    if (map["DocId"] != null) {
      object.DocId = map["DocId"];
    }

    return object;
  }

  /// 준비중
  ///////////////////////////////////////
  static late Database NewModelDb;

  static bool _isOpened = false;
  static bool _isDbOpened = false;
  static const String _dbName = "NewModel.db";

  _ready() async {
    if (!_isOpened) {
      await _open();
      _isOpened = true;
    }
  }

  Future _open() async {
    await _prepare();
    await NewModelDb.transaction((txn) async {
      // Ok
      await txn.execute("create table if not exists NewModel ("
          "DocId text primary key not null"
          ",I000 integer not null"
          // ",I001 integer not null"
          // ",I002 integer not null"
          // ",I003 integer not null"
          // ",I004 integer not null"
          // ",I005 integer not null"
          // ",I006 integer not null"
          // ",I007 integer not null"
          // ",I008 integer not null"
          // ",I009 integer not null"
          // ",I010 integer not null"
          // ",I011 integer not null"
          // ",I012 integer not null"
          // ",I013 integer not null"
          // ",I014 integer not null"
          // ",I015 integer not null"
          // ",I016 integer not null"
          // ",I017 integer not null"
          // ",I018 integer not null"
          // ",I019 integer not null"
          // ",I020 integer not null"
          // ",I021 integer not null"
          // ",I022 integer not null"
          // ",I023 integer not null"
          // ",I024 integer not null"
          // ",I025 integer not null"
          // ",I026 integer not null"
          // ",I027 integer not null"
          // ",I028 integer not null"
          // ",I029 integer not null"
          // ",I030 integer not null"
          // ",I031 integer not null"
          // ",I032 integer not null"
          // ",I033 integer not null"
          // ",I034 integer not null"
          // ",I035 integer not null"
          // ",I036 integer not null"
          // ",I037 integer not null"
          // ",I038 integer not null"
          // ",I039 integer not null"
          // ",I040 integer not null"
          // ",I041 integer not null"
          // ",I042 integer not null"
          // ",I043 integer not null"
          // ",I044 integer not null"
          // ",I045 integer not null"
          // ",I046 integer not null"
          // ",I047 integer not null"
          // ",I048 integer not null"
          // ",I049 integer not null"
          // ",I050 integer not null"
          // ",I051 integer not null"
          // ",I052 integer not null"
          // ",I053 integer not null"
          // ",I054 integer not null"
          // ",I055 integer not null"
          // ",I056 integer not null"
          // ",I057 integer not null"
          // ",I058 integer not null"
          // ",I059 integer not null"
          // ",I060 integer not null"
          // ",I061 integer not null"
          // ",I062 integer not null"
          // ",I063 integer not null"
          // ",I064 integer not null"
          // ",I065 integer not null"
          // ",I066 integer not null"
          // ",I067 integer not null"
          // ",I068 integer not null"
          // ",I069 integer not null"
          // ",I070 integer not null"
          // ",I071 integer not null"
          // ",I072 integer not null"
          // ",I073 integer not null"
          // ",I074 integer not null"
          // ",I075 integer not null"
          // ",I076 integer not null"
          // ",I077 integer not null"
          // ",I078 integer not null"
          // ",I079 integer not null"
          // ",I080 integer not null"
          // ",I081 integer not null"
          // ",I082 integer not null"
          // ",I083 integer not null"
          // ",I084 integer not null"
          // ",I085 integer not null"
          // ",I086 integer not null"
          // ",I087 integer not null"
          // ",I088 integer not null"
          // ",I089 integer not null"
          // ",I090 integer not null"
          // ",I091 integer not null"
          // ",I092 integer not null"
          // ",I093 integer not null"
          // ",I094 integer not null"
          // ",I095 integer not null"
          // ",I096 integer not null"
          // ",I097 integer not null"
          // ",I098 integer not null"
          // ",I099 integer not null"
          // ",S000 text not null"
          // ",S001 text not null"
          // ",S002 text not null"
          // ",S003 text not null"
          // ",S004 text not null"
          // ",S005 text not null"
          // ",S006 text not null"
          // ",S007 text not null"
          // ",S008 text not null"
          // ",S009 text not null"
          // ",S010 text not null"
          // ",S011 text not null"
          // ",S012 text not null"
          // ",S013 text not null"
          // ",S014 text not null"
          // ",S015 text not null"
          // ",S016 text not null"
          // ",S017 text not null"
          // ",S018 text not null"
          // ",S019 text not null"
          // ",S020 text not null"
          // ",S021 text not null"
          // ",S022 text not null"
          // ",S023 text not null"
          // ",S024 text not null"
          // ",S025 text not null"
          // ",S026 text not null"
          // ",S027 text not null"
          // ",S028 text not null"
          // ",S029 text not null"
          // ",S030 text not null"
          // ",S031 text not null"
          // ",S032 text not null"
          // ",S033 text not null"
          // ",S034 text not null"
          // ",S035 text not null"
          // ",S036 text not null"
          // ",S037 text not null"
          // ",S038 text not null"
          // ",S039 text not null"
          // ",S040 text not null"
          // ",S041 text not null"
          // ",S042 text not null"
          // ",S043 text not null"
          // ",S044 text not null"
          // ",S045 text not null"
          // ",S046 text not null"
          // ",S047 text not null"
          // ",S048 text not null"
          // ",S049 text not null"
          // ",S050 text not null"
          // ",S051 text not null"
          // ",S052 text not null"
          // ",S053 text not null"
          // ",S054 text not null"
          // ",S055 text not null"
          // ",S056 text not null"
          // ",S057 text not null"
          // ",S058 text not null"
          // ",S059 text not null"
          // ",S060 text not null"
          // ",S061 text not null"
          // ",S062 text not null"
          // ",S063 text not null"
          // ",S064 text not null"
          // ",S065 text not null"
          // ",S066 text not null"
          // ",S067 text not null"
          // ",S068 text not null"
          // ",S069 text not null"
          // ",S070 text not null"
          // ",S071 text not null"
          // ",S072 text not null"
          // ",S073 text not null"
          // ",S074 text not null"
          // ",S075 text not null"
          // ",S076 text not null"
          // ",S077 text not null"
          // ",S078 text not null"
          // ",S079 text not null"
          // ",S080 text not null"
          // ",S081 text not null"
          // ",S082 text not null"
          // ",S083 text not null"
          // ",S084 text not null"
          // ",S085 text not null"
          // ",S086 text not null"
          // ",S087 text not null"
          // ",S088 text not null"
          // ",S089 text not null"
          // ",S090 text not null"
          // ",S091 text not null"
          // ",S092 text not null"
          // ",S093 text not null"
          // ",S094 text not null"
          // ",S095 text not null"
          // ",S096 text not null"
          // ",S097 text not null"
          // ",S098 text not null"
          // ",S099 text not null"
          // ",B000 integer not null"
          // ",B001 integer not null"
          // ",B002 integer not null"
          // ",B003 integer not null"
          // ",B004 integer not null"
          // ",B005 integer not null"
          // ",B006 integer not null"
          // ",B007 integer not null"
          // ",B008 integer not null"
          // ",B009 integer not null"
          // ",B010 integer not null"
          // ",B011 integer not null"
          // ",B012 integer not null"
          // ",B013 integer not null"
          // ",B014 integer not null"
          // ",B015 integer not null"
          // ",B016 integer not null"
          // ",B017 integer not null"
          // ",B018 integer not null"
          // ",B019 integer not null"
          // ",B020 integer not null"
          // ",B021 integer not null"
          // ",B022 integer not null"
          // ",B023 integer not null"
          // ",B024 integer not null"
          // ",B025 integer not null"
          // ",B026 integer not null"
          // ",B027 integer not null"
          // ",B028 integer not null"
          // ",B029 integer not null"
          // ",B030 integer not null"
          // ",R000 real not null"
          // ",R001 real not null"
          // ",R002 real not null"
          // ",R003 real not null"
          // ",R004 real not null"
          // ",R005 real not null"
          // ",R006 real not null"
          // ",R007 real not null"
          // ",R008 real not null"
          // ",R009 real not null"
          // ",R010 real not null"
          // ",R011 real not null"
          // ",R012 real not null"
          // ",R013 real not null"
          // ",R014 real not null"
          // ",R015 real not null"
          // ",R016 real not null"
          // ",R017 real not null"
          // ",R018 real not null"
          // ",R019 real not null"
          // ",R020 real not null"
          // ",R021 real not null"
          // ",R022 real not null"
          // ",R023 real not null"
          // ",R024 real not null"
          // ",R025 real not null"
          // ",R026 real not null"
          // ",R027 real not null"
          // ",R028 real not null"
          // ",R029 real not null"
          // ",R030 real not null"
          // ",L000 text not null"
          // ",L001 text not null"
          // ",L002 text not null"
          // ",L003 text not null"
          // ",L004 text not null"
          // ",L005 text not null"
          // ",L006 text not null"
          // ",L007 text not null"
          // ",L008 text not null"
          // ",L009 text not null"
          // ",L010 text not null"
          // ",L011 text not null"
          // ",L012 text not null"
          // ",L013 text not null"
          // ",L014 text not null"
          // ",L015 text not null"
          // ",L016 text not null"
          // ",L017 text not null"
          // ",L018 text not null"
          // ",L019 text not null"
          // ",L020 text not null"
          // ",C000 text not null"
          // ",C001 text not null"
          // ",C002 text not null"
          // ",C003 text not null"
          // ",C004 text not null"
          // ",C005 text not null"
          // ",C006 text not null"
          // ",C007 text not null"
          // ",C008 text not null"
          // ",C009 text not null"
          // ",C010 text not null"
          // ",C011 text not null"
          // ",C012 text not null"
          // ",C013 text not null"
          // ",C014 text not null"
          // ",C015 text not null"
          // ",C016 text not null"
          // ",C017 text not null"
          // ",C018 text not null"
          // ",C019 text not null"
          // ",C020 text not null"
          // ",J000 text not null"
          // ",J001 text not null"
          // ",J002 text not null"
          // ",J003 text not null"
          // ",J004 text not null"
          // ",J005 text not null"
          // ",J006 text not null"
          // ",J007 text not null"
          // ",J008 text not null"
          // ",J009 text not null"
          // ",J010 text not null"
          // ",J011 text not null"
          // ",J012 text not null"
          // ",J013 text not null"
          // ",J014 text not null"
          // ",J015 text not null"
          // ",J016 text not null"
          // ",J017 text not null"
          // ",J018 text not null"
          // ",J019 text not null"
          // ",J020 text not null"
          // ",E000 text not null"
          // ",E001 text not null"
          // ",E002 text not null"
          // ",E003 text not null"
          // ",E004 text not null"
          // ",E005 text not null"
          // ",E006 text not null"
          // ",E007 text not null"
          // ",E008 text not null"
          // ",E009 text not null"
          // ",E010 text not null"
          // ",E011 text not null"
          // ",E012 text not null"
          // ",E013 text not null"
          // ",E014 text not null"
          // ",E015 text not null"
          // ",E016 text not null"
          // ",E017 text not null"
          // ",E018 text not null"
          // ",E019 text not null"
          // ",E020 text not null"
          ")");
    });

    await _handleColumnChanged();

    await createIndexing(NewModelDb);
  }

  _handleColumnChanged() async {
    var _ = ManagingSqfliteTableNewModel().get();

    var columns = paramListNewModel.map((e) => e[0].toString()).toList();
    if (_.UpdateMillis == 0) {
      // 만약 한번도 작동한 적이 없다면 바로 컬럼에 넣어줍니다.
      _.Version = 1;
      _.UpdateMillis = DateTime.now().millisecondsSinceEpoch;
      _.Columns = columns;
      ManagingSqfliteTableNewModel().upsert(_);
    }

    // 기존 컬럼과의 비교를 해줍니다. (없어진건 삭제하고 새로나온건 추가하는식으로 가자)
    // 기존꺼에만 있는 파라미터 리스트(즉 삭제해야하는 부분)
    var needDeleteParams =
        _.Columns.where((item) => !columns.contains(item)).toList();

    // 새로운거에만 있는 파라미터 리스트(즉 추가해야하는 부분)
    var needCreateParams =
        columns.where((item) => !_.Columns.contains(item)).toList();

    // needDeleteParams 와 needCreateParams 중 하나라도 변경사항이 있다면 디비버전업데이트해주기
    if (needDeleteParams.isNotEmpty || needCreateParams.isNotEmpty) {
      _.Version++;
      _.UpdateMillis = DateTime.now().millisecondsSinceEpoch;
      _.Columns = columns;
      ManagingSqfliteTableNewModel().upsert(_);
    }

    // 추가해야하는 부분을 진행해줍니다.
    for (var item in needCreateParams) {
      var param = paramListNewModel.firstWhere((element) => element[0] == item);
      await _addColumns(param[0], param[1], param[2]);
    }

    // 삭제해야하는 부분을 진행해줍니다.
    await _removeColumns(needDeleteParams);

    await _prepare();
  }

  _addColumns(
      String newColumnName, String columnType, String defaultValue) async {
    await NewModelDb.execute(
        "ALTER TABLE NewModel ADD COLUMN $newColumnName $columnType DEFAULT $defaultValue");
  }

  _removeColumns(List<dynamic> columnsToDelete) async {
    if (columnsToDelete.isEmpty) {
      return;
    }

    // 임시 테이블 이름 생성
    String tempTableName = 'temp_NewModel';

    // 기존 테이블의 모든 컬럼 정보 가져오기
    List<Map> columns =
        await NewModelDb.rawQuery('PRAGMA table_info(NewModel)');
    List<String> allColumnNames =
        columns.map((col) => col['name'] as String).toList();

    // 삭제하려는 컬럼 제외
    allColumnNames.removeWhere((element) => columnsToDelete.contains(element));
    String remainingColumns = allColumnNames.join(', ');

    // 새로운 임시 테이블 생성과 데이터 복사
    await NewModelDb.transaction((txn) async {
      await txn.execute('''
      CREATE TABLE $tempTableName AS 
      SELECT $remainingColumns 
      FROM NewModel
    ''');

      // 기존 테이블 삭제
      await txn.execute('DROP TABLE NewModel');

      // 임시 테이블의 이름을 원래 테이블 이름으로 변경
      await txn.execute('ALTER TABLE $tempTableName RENAME TO NewModel');
    });
  }

  _prepare() async {
    if (_isDbOpened) return;
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, _dbName);
    await Directory(dirname(path)).create(recursive: true);
    NewModelDb = await openDatabase(path,
        version: ManagingSqfliteTableNewModel().get().Version);
    _isDbOpened = true;
  }

  /// sql 인덱싱 해주기(필요한 부분에 인덱스를 추가해줍니다.), 오름차순 내림차순, 및 복합 쿼리같은경우 모두 설정해주면 됩니다.
  createIndexing(Database myDatabase) async {
    final box = GetStorage();
    if (box.read("NewModelSqfliteIndex") != null) {
      return;
    }
    box.write("NewModelSqfliteIndex", true);

    /// 예시
    // await myDatabase.execute("create index I000index on NewModel (I000)"); // 단일 인덱싱
    // await myDatabase.execute("create index I000index on NewModel (I000 DESC)"); // 단일 인덱싱 내림차순
    // await myDatabase.execute("create index S000I000index on NewModel (S000 ASC, I000 DESC)"); // 다중 컬럼 인덱싱
    // await myDatabase.execute("drop index I000index"); // 인덱싱 삭제
  }
}
