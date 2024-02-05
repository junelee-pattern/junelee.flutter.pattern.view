import '../../../../../../../util/start_app.dart';
import '../../../entity/firebase_dynamic_links/new/dto.dart';

abstract class NewFirebaseDynamicLinkRepoInterface {
  Future<String> getUrl(NewFirebaseDynamicLinksDTO obj);
}
