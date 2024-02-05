import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

import '../../../app/_/_/interaction/listener/_/firebase_dynamic_links/_.dart';
import '../../../../../main.dart';

Future<void> readyForFirebaseDynamicLinks(BuildContext context) async {
  // Check if you received the link via `getInitialLink` first
  final PendingDynamicLinkData? initialLink =
      await FirebaseDynamicLinks.instance.getInitialLink();

  if (initialLink != null) {
    final Uri deepLink = initialLink.link;
    log('initialLink: $deepLink');
    FirebaseDynamicLinksListener(deepLink.toString());
  }

  FirebaseDynamicLinks.instance.onLink.listen(
    (pendingDynamicLinkData) {
      final Uri deepLink = pendingDynamicLinkData.link;
      log('onLink: $deepLink');
      FirebaseDynamicLinksListener(deepLink.toString());
    },
  );
}
