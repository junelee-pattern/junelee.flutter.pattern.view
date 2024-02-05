import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

import '../../../../../../../../main.dart';
import '../../../../../../../util/config/firebase_function.dart';
import 'package:cloud_functions/cloud_functions.dart';

import '../../../../domain/entity/firebase_functions/new/request_dto/dto.dart';
import '../../../../domain/entity/firebase_functions/new/response_dto/dto.dart';

class NewFirebaseFunctions {
  Future<NewFirebaseFunctionsResponseDTO?> call(
      NewFirebaseFunctionsRequestDTO requestDTO,
      {String? region}) async {
    HttpsCallable callable;

    log("callFunction:New");

    try {
      late FirebaseFunctions functions;
      if (region == null) {
        if (FireFunctionConfig.region == "") {
          functions = FirebaseFunctions.instance;
        } else {
          functions =
              FirebaseFunctions.instanceFor(region: FireFunctionConfig.region);
        }
      } else {
        functions = FirebaseFunctions.instanceFor(region: region);
      }
      if (FireFunctionConfig.isEmulatorMode) {
        functions.useFunctionsEmulator(FireFunctionConfig.emulatorHostString,
            FireFunctionConfig.emulatorHost);
      }
      callable = functions.httpsCallable("New");

      HttpsCallableResult resp = await callable.call(requestDTO.toString());
      return NewFirebaseFunctionsResponseDTO.fromString(resp.data as String);
    } catch (e) {
      e.printError();
      return null;
    }
  }
}
