import '../../../../../../../util/start_app.dart';
import '../../../../data/repository/firebase_dynamic_links/new/impl.dart';
import '../../../entity/firebase_dynamic_links/new/dto.dart';
import '../../../repository/firebase_dynamic_links/new/interface.dart';

class _NewFirebaseDynamicLinkUseCase {
  Future<String> getUrl(NewFirebaseDynamicLinksDTO obj) async {
    return await NewFirebaseDynamicLinkRepo.getUrl(obj);
  }

  final NewFirebaseDynamicLinkRepoInterface NewFirebaseDynamicLinkRepo;

  _NewFirebaseDynamicLinkUseCase(this.NewFirebaseDynamicLinkRepo);
}

class NewFirebaseDynamicLinkUseCase {
  static final _NewFirebaseDynamicLinkUseCase useCase =
      _NewFirebaseDynamicLinkUseCase(NewFirebaseDynamicLinkRepo());
}
