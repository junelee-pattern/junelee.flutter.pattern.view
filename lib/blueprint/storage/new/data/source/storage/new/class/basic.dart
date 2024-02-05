import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../../../../../../../util/start_app.dart';
import '../local_storage/app_storage.dart';
import '../server_storage/firebase_storage.dart';
import '../server_storage/google_drive.dart';

class NewStorageHelper {
  static NewStorageHelper get to => NewStorageHelper();
  static NewStorageAppFolder localStorage = NewStorageAppFolder();
  static NewStorageFirebaseStorage fireStorage = NewStorageFirebaseStorage();

  // static NewGoogleDrive googleDrive = NewGoogleDrive([]);

  Future<File?> getSync(String fileName) async {
    // 1. 로컬에 파일이 있는지 확인하기 ( 있다면 리턴)
    File? localFile = await localStorage.get(fileName);
    if (localFile != null) {
      return localFile;
    }

    Uint8List? serverFileData = await fireStorage.get(fileName);

    if (serverFileData != null) {
      await localStorage.setByData(fileName, serverFileData);
      return localStorage.get(fileName);
    }

    return null;
  }

  Future<bool> insertSync(String fileName, Uint8List? data) async {
    if (data == null) return false;

    File? localFile = await localStorage.get(fileName);
    if (localFile == null) {
      await localStorage.setByData(fileName, data);
    }

    Uint8List? serverFileData = await fireStorage.get(fileName);
    if (serverFileData == null) {
      await fireStorage.set(fileName, data);
    }

    return true;
  }

  Future<bool> upsertSync(String fileName, Uint8List? data) async {
    if (data == null) return false;

    await localStorage.setByData(fileName, data);
    // File? localFile = await localStorage.get(fileName);
    // if (localFile == null) {
    //   await localStorage.setByData(fileName, data);
    // }else{
    //   if(localFile.lengthSync() != data.lengthInBytes){
    //     log("localFile.lengthSync():${localFile.lengthSync()}");
    //     log("data.lengthInBytes:${data.lengthInBytes}");
    //     await localStorage.setByData(fileName, data);
    //   }else{
    //     // 파일크기가 같은 경우는 하지 말아주자.
    //   }
    // }

    await fireStorage.set(fileName, data);

    // Uint8List? serverFileData = await fireStorage.get(fileName);
    // if (serverFileData == null) {
    //   await fireStorage.set(fileName, data);
    // }else{
    //   if(serverFileData.lengthInBytes != data.lengthInBytes){
    //     log("serverFileData.lengthInBytes:${serverFileData.lengthInBytes}");
    //     log("data.lengthInBytes:${data.lengthInBytes}");
    //     await fireStorage.set(fileName, data);
    //   }else{
    //     // 파일크기가 같은 경우는 하지 말아주자.
    //   }
    // }

    return true;
  }

  Future<void> deleteLocal(String fileName) async {
    await localStorage.delete(fileName);
  }

  Future<void> deleteServer(String fileName) async {
    await fireStorage.delete(fileName);
  }

  Future<void> deleteSync(String fileName) async {
    await deleteLocal(fileName);
    await deleteServer(fileName);
  }
}
