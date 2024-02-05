import 'dart:async';
import 'dart:collection';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:firebase_storage/firebase_storage.dart';

import '../../../../../../../../util/start_app.dart';
import '../class/basic.dart';
import '../config.dart';

class NewStorageFirebaseStorage {
  FirebaseStorage storage = FirebaseStorage.instance; //option1: default app
  // FirebaseStorage.instanceFor(
  //     app: secondaryApp, bucket: 'secondary-storage-bucket'); //option2: other app

  Reference ref(String UserId) {
    return FirebaseStorage.instance.ref(NewStorageConfig.serverPath(UserId));
  }

  Future<Uint8List?> get(String UserId, String fileName) async {
    try {
      Uint8List? data = await ref(UserId).child(fileName).getData();
      return data; // 이렇게 나눠놔야 에러를 잡음
    } on Exception catch (e) {
      // e.printError();
      return null;
    }
  }

  Future<String?> url(String UserId, String fileName) async {
    try {
      return await ref(UserId).child(fileName).getDownloadURL();
    } on Exception catch (e) {
      // e.printError();
      return null;
    }
  }

  Future<String?> set(String UserId, String fileName, Uint8List data) async {
    try {
      await ref(UserId).child(fileName).putData(data);
      return fileName;
    } on FirebaseException catch (e) {
      e.printError();
      return null;
    }
  }

  Future<void> delete(String UserId, String fileName) async {
    try {
      await ref(UserId).child(fileName).delete();
    } on FirebaseException catch (e) {
      e.printError();
    }
  }
}
