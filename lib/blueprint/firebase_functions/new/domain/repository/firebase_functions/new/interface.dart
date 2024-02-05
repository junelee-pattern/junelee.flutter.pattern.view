import '../../../../../../../util/start_app.dart';
import '../../../entity/firebase_functions/new/request_dto/dto.dart';
import '../../../entity/firebase_functions/new/response_dto/dto.dart';

abstract class NewFirebaseFunctionsRepoInterface {
  Future<NewFirebaseFunctionsResponseDTO?> call(
      NewFirebaseFunctionsRequestDTO obj);
}
