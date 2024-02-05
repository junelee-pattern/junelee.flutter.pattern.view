import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

import '../../../../../../../../main.dart';
import '../../../../domain/entity/firebase_dynamic_links/new/dto.dart';

class NewFirebaseDynamicLinks {
  Future<String> getUrl(NewFirebaseDynamicLinksDTO obj) async {
    String dataString = obj.toString();
    String encodedDataString = Uri.encodeQueryComponent(dataString);

    final dynamicLinkParams = DynamicLinkParameters(
      link: Uri.parse("$homepageLink/?model=New&data=$encodedDataString"),
      uriPrefix: "https://$appPrefix",
      androidParameters:
          const AndroidParameters(packageName: androidPackageName),
      iosParameters: const IOSParameters(bundleId: iosBundleId),
    );
    final dynamicLink =
        await FirebaseDynamicLinks.instance.buildLink(dynamicLinkParams);

    // log(dynamicLink);

    return dynamicLink.toString();
  }
}
