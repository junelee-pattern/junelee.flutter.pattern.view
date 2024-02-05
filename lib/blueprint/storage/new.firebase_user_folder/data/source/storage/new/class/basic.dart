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

  Future<File?> getSync(String userId, String fileName) async {
    // 1. 로컬에 파일이 있는지 확인하기 ( 있다면 리턴)
    File? localFile = await localStorage.get(fileName);
    if (localFile != null) {
      return localFile;
    }

    // 2. 로컬에 파일이 없다면 서버에서 가져오는거 시도하기(서버에 있다면 가져와서 로컬에 저장 및 리턴
    Uint8List? serverFileData = await fireStorage.get(userId, fileName);

    if (serverFileData != null) {
      await localStorage.setByData(fileName, serverFileData);
      return localStorage.get(fileName);
    }

    // 3. 서버에도 없다면 null 리턴하기
    return null;
  }

  Future<bool> insertSync(
      String userId, String fileName, Uint8List? data) async {
    if (data == null) return false;

    // 1. 로컬에 파일이 있는지 확인하기 ( 없다면 등록)
    File? localFile = await localStorage.get(fileName);
    if (localFile == null) {
      await localStorage.setByData(fileName, data);
    }

    // 2. 서버에 파일이 있는지 확인하기( 없다면 등록)
    Uint8List? serverFileData = await fireStorage.get(userId, fileName);
    if (serverFileData == null) {
      await fireStorage.set(userId, fileName, data);
    }

    return true;
  }

  Future<bool> upsertSync(
      String userId, String fileName, Uint8List? data) async {
    if (data == null) return false;

    // 1. 로컬에 파일에 등록하기. 있든 없든 등록
    await localStorage.setByData(fileName, data);
    // File? localFile = await localStorage.get(fileName);
    // if (localFile == null) {
    //   await localStorage.setByData(fileName, data);
    // }else{
    //   if(localFile.lengthSync() != data.lengthInBytes){
    //     MyLogger("localFile.lengthSync():${localFile.lengthSync()}");
    //     MyLogger("data.lengthInBytes:${data.lengthInBytes}");
    //     await localStorage.setByData(fileName, data);
    //   }else{
    //     // 파일크기가 같은 경우는 하지 말아주자.
    //   }
    // }

    // 2. 서버에 그냥 등록(있든없든)
    await fireStorage.set(userId, fileName, data);

    // Uint8List? serverFileData = await fireStorage.get(fileName);
    // if (serverFileData == null) {
    //   await fireStorage.set(fileName, data);
    // }else{
    //   if(serverFileData.lengthInBytes != data.lengthInBytes){
    //     MyLogger("serverFileData.lengthInBytes:${serverFileData.lengthInBytes}");
    //     MyLogger("data.lengthInBytes:${data.lengthInBytes}");
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

  Future<void> deleteServer(String userId, String fileName) async {
    await fireStorage.delete(userId, fileName);

    Future<void> deleteSync(String userId, String fileName) async {
      await deleteLocal(fileName);
      await deleteServer(userId, fileName);
    }
  }
}
