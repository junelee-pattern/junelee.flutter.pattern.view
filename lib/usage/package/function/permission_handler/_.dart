// import 'package:flutter/cupertino.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// import '../../../../util/start_app.dart';
//
// class PermissionHandlerKit {
//   Future<void> requestPermissions(List<MyPermission> permissionRequests) async {
//     List<Permission> permissions =
//         permissionRequests.map((e) => e.permission).toList();
//
//     Map<Permission, PermissionStatus> statuses = await permissions.request();
//
//     for (var request in permissionRequests) {
//       final status = statuses[request.permission];
//
//       if (status == null) {
//         debugPrint("permission:${request.permission}, Permission is null");
//         request.onNullStatus();
//       } else if (status.isPermanentlyDenied) {
//         debugPrint(
//             "permission:${request.permission}, Permission is permanently denied");
//         request.onPermanentlyDenied();
//       } else if (status.isRestricted) {
//         debugPrint(
//             "permission:${request.permission}, Permission is restricted");
//         request.onRestricted();
//       } else if (status.isLimited) {
//         debugPrint("permission:${request.permission}, Permission is limited");
//         request.onLimited();
//       } else if (status.isProvisional) {
//         debugPrint(
//             "permission:${request.permission}, Permission is provisional");
//         request.onProvisional();
//       } else if (status.isGranted) {
//         debugPrint("permission:${request.permission}, Permission is granted");
//         request.onGranted();
//       } else if (status.isDenied) {
//         debugPrint("permission:${request.permission}, Permission is denied");
//         request.onDenied();
//       } else {
//         debugPrint("permission:${request.permission}, Permission is unknown");
//         request.onUnknownPermission();
//       }
//     }
//   }
//
//   Future<void> checkPermissions(List<MyPermission> permissionChecks) async {
//     for (var check in permissionChecks) {
//       final status = await check.permission.status;
//
//       if (status.isPermanentlyDenied) {
//         debugPrint("status:$status, Permission is permanently denied");
//         check.onPermanentlyDenied();
//       } else if (status.isRestricted) {
//         debugPrint("status:$status, Permission is restricted");
//         check.onRestricted();
//       } else if (status.isLimited) {
//         debugPrint("status:$status, Permission is limited");
//         check.onLimited();
//       } else if (status.isProvisional) {
//         debugPrint("status:$status, Permission is provisional");
//         check.onProvisional();
//       } else if (status.isGranted) {
//         debugPrint("status:$status, Permission is granted");
//         check.onGranted();
//       } else if (status.isDenied) {
//         debugPrint("status:$status, Permission is denied");
//         check.onDenied();
//       } else {
//         debugPrint("status:$status, Permission is unknown");
//         check.onUnknownPermission();
//       }
//     }
//   }
// }
//
// class MyPermission {
//   final Permission permission;
//   final Function onGranted;
//   final Function onDenied;
//   final Function onPermanentlyDenied;
//   final Function onRestricted;
//   final Function onLimited;
//   final Function onProvisional;
//   final Function onUnknownPermission;
//   final Function onNullStatus;
//
//   MyPermission({
//     required this.permission,
//     required this.onGranted,
//     required this.onDenied,
//     required this.onPermanentlyDenied,
//     required this.onRestricted,
//     required this.onLimited,
//     required this.onProvisional,
//     required this.onUnknownPermission,
//     required this.onNullStatus,
//   });
// }
