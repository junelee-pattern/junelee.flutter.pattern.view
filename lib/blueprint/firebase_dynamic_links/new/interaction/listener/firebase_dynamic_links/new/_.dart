import '../../../../../../../../main.dart';
import '../../../../domain/entity/firebase_dynamic_links/new/dto.dart';

NewFirebaseDynamicLinksListener(String dynamicLink) async {
  if (Uri.parse(dynamicLink).queryParameters['model'] != 'New') return;
  NewFirebaseDynamicLinksDTO dto = NewFirebaseDynamicLinksDTO.fromString(
      Uri.decodeComponent(
          Uri.parse(dynamicLink).queryParameters['data'] ?? ''));

  // user code here
  log('dto: $dto');
}
