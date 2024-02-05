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

  Reference ref() {
    return FirebaseStorage.instance.ref(NewStorageConfig.serverPath());
  }

  Future<Uint8List?> get(String fileName) async {
    try {
      Uint8List? data = await ref().child(fileName).getData();
      return data;
    } on Exception catch (e) {
      // e.printError();
      return null;
    }
  }

  Future<String?> url(String fileName) async {
    try {
      return await ref().child(fileName).getDownloadURL();
    } on Exception catch (e) {
      // e.printError();
      return null;
    }
  }

  Future<String?> set(String fileName, Uint8List data) async {
    try {
      await ref().child(fileName).putData(data);
      return fileName;
    } on FirebaseException catch (e) {
      e.printError();
      return null;
    }
  }

  Future<void> delete(String fileName) async {
    try {
      await ref().child(fileName).delete();
    } on FirebaseException catch (e) {
      e.printError();
    }
  }
}
