import '../../../../../../../util/start_app.dart';
import '../../../../data/repository/firebase_functions/new/impl.dart';
import '../../../entity/firebase_functions/new/request_dto/dto.dart';
import '../../../entity/firebase_functions/new/response_dto/dto.dart';
import '../../../repository/firebase_functions/new/interface.dart';

class _NewFirebaseFunctionsUseCase {
  Future<NewFirebaseFunctionsResponseDTO?> call(
      NewFirebaseFunctionsRequestDTO obj) async {
    return await NewFirebaseFunctionsRepo.call(obj);
  }

  final NewFirebaseFunctionsRepoInterface NewFirebaseFunctionsRepo;

  _NewFirebaseFunctionsUseCase(this.NewFirebaseFunctionsRepo);
}

class NewFirebaseFunctionsUseCase {
  static final _NewFirebaseFunctionsUseCase useCase =
      _NewFirebaseFunctionsUseCase(NewFirebaseFunctionsRepo());
}
