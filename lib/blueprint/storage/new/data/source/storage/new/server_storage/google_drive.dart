// import 'package:drive_helper/drive_helper.dart';
//
// class NewGoogleDrive {
//   NewGoogleDrive(this.scope );
//
//   DriveHelper? driveHelper;
//   late List<String> scope;
//
//   Future<String?> getString() async {
//     await _ready();
//
//     String? fileId = await _getFileIdUsingFileName();
//
//     if (fileId == null) {
//       return null;
//     }
//     return await driveHelper!.getData(fileId);
//   }
//
//   Future<void> setString(String data) async {
//     await _ready();
//     String? fileId = await _getFileIdUsingFileName();
//
//     if (fileId == null) {
//       await driveHelper!.createFile(_ref(), FileMIMETypes.file, text: data);
//     } else {
//       await driveHelper!.updateFile(fileId, data);
//     }
//   }
//
//   _ready() async {
//     driveHelper = await DriveHelper.initialise(scope);
//     // driveHelper!.signIn;
//   }
//
//   String _ref() {
//     return "NewFile";
//   }
//
//   Future<String?> _getFileIdUsingFileName() async {
//     String fileId = "";
//
//     try {
//       List<String> fileIds = await driveHelper!.getFileID(_ref());
//
//       if (fileIds.isNotEmpty) {
//         return fileIds.first;
//       }
//     } catch (e) {
//       return null;
//     }
//     return null;
//   }
// }
