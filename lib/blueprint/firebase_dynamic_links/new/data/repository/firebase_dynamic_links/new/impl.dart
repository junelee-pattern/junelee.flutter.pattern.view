import '../../../../../../../util/start_app.dart';
import '../../../../domain/entity/firebase_dynamic_links/new/dto.dart';
import '../../../../domain/repository/firebase_dynamic_links/new/interface.dart';
import '../../../source/firebase_dynamic_links/new/_.dart';

class NewFirebaseDynamicLinkRepo extends NewFirebaseDynamicLinkRepoInterface {
  @override
  Future<String> getUrl(NewFirebaseDynamicLinksDTO obj) async {
    return await NewFirebaseDynamicLinks().getUrl(obj);
  }
}
