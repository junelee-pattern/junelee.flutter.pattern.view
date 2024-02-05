import '../../../../../../../util/start_app.dart';
import '../../../../domain/entity/firebase_functions/new/request_dto/dto.dart';
import '../../../../domain/entity/firebase_functions/new/response_dto/dto.dart';
import '../../../../domain/repository/firebase_functions/new/interface.dart';
import '../../../source/firebase_functions/new/_.dart';

class NewFirebaseFunctionsRepo extends NewFirebaseFunctionsRepoInterface {
  @override
  Future<NewFirebaseFunctionsResponseDTO?> call(
          NewFirebaseFunctionsRequestDTO obj) async =>
      await NewFirebaseFunctions().call(obj);
}
