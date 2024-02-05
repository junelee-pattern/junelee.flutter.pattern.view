import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../../../../../../../../../../util/start_app.dart';
import '../../vm/_/vm.dart';
import 'config/params.dart';
import 'util/navigator.dart';
import 'util/view_skeleton.dart';

class V extends StatefulWidget {
  const V({super.key, this.heroKey, this.tag, required this.params});

  final Key? heroKey;
  final String? tag;
  final NewMarkdownTermParams params;

  @override
  State<V> createState() => _VState();
}

class _VState extends State<V> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewMarkdownTermVM>(
      tag: widget.tag,
      autoRemove: false,
      builder: (vmNewMarkdownTerm) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(tr("TermMarkDownMarkDownPage")),
          ),
          body: Markdown(
            data: '''
Last updated

January 25 2022

Terms of Service
================

### 1\. We protect your personal information.

The safe handling of your personal information is our biggest priority. The CatBTI app is specially designed to make it technically impossible for our development team and our company to have access to your data. Therefore, you can rest assured. Your personal information will only be utilized to allow you, the users, to use our CatBTI service with more convenience. Moreover, your personal information will only be used within the scope and purpose of which you agree. You may rest assured since we will never provide your personal information to a third party unless you agree or when such provision of personal information is required by law. If you are interested in further details or our efforts regarding the protection of your personal information, please refer to the Privacy Policy and the Data Collection & Processing Document.

### 2\. We protect the copyrights of your CatBTI in a powerful and secure way.

We believe that protecting the security and copyright of your private infomation is much more important than anything else. We believe that you must be the one who possesses the right to such data, and our priority is centered on putting resources in place to protect such data. Also, to ensure your 'right to be forgotten,' we will delete the requested data within 3 business days once you send us a request to delete your data. Contact us at catbtiapp@gmail.com if you want your data to be deleted.

### 3\. However, there might be times where our services can be stopped.

We always do our best to provide CatBTI service to our users 24/7, 365 days a year. However, there may be times where our service might be temporarily stopped due to temporary server inspections, maintenance/repair of equipment, or any other substantial reasons. In this case, we will make sure to notify the reason through our service screen in advance. In the case where the CatBTI service is suspended for unforeseen reasons, we will notify you through various channels as soon as we identify the reason.

### 4\. We use a cloud service.

CatBTI uses a Firebase infrastructure and is subject to GCP Terms and Conditions. We follow the Firebase terms and GCP Privacy Policy.

### 5\. Not everything is guaranteed.

We will always put a reasonable amount of care into our service so that you can use CatBTI without any restrictions. However, within the extent permitted by the current law, we do not make any guarantees or warranties for any particulars that are not specified in this Terms of Service regarding the service of CatBTI. For example, we do not make any guarantees about how the CatBTI service can be used. Instead, we simply 'provide the service as it is.' In addition, please do not attempt to interrupt the service or access it in any other way outside of the interface or instructions provided by CatBTI.
You must not use the app in a way that is abusive, disrespectful, objectionable, or intentionally objectionable.

### 6\. Please use our service according to the current law.

Different countries have different laws regarding the issue of 'app service'. In using CatBTI, make sure to observe the current laws/regulations of your country.

### 7\. If you don't want it, you can cancel our service at any time.

If you want to delete your data and stop using our service, feel free to let us know at catbtiapp@gmail.com. Once we receive your request, your account will be suspended within 5 business days, and your data will be completely removed from all devices and servers.

### 8.Personal information

We are collecting phone number information to provide services. For example, when you change your smartphone, we need to use your phone number information to verify your identity. You will still have access to CatBTI.

### 9.Please respect the privacy of your friends.

Personality types registered with CatBTI are only used within the CatBTI app. You must not disclose or use a personality type other than yourself outside of the app. Please respect everyone's privacy.

### 10.Usage analytics

We would like to make out product more useful for you, so we added Firebase Analytics to the CatBTI app. It collects user behavior information in an anonymous form and transmits it to Google's Firebase servers. That means only usage data is collected, no personally identifiable information. Then we can use Firebase Analytics to create reports of how our App being used. For example, a percentage of users that use certain features, or most popular Android versions and screen sizes among our users. We use these reports to understand how to spend our development resources more efficiently and make our App better. Note that we might share these anonymous infomation reports with third parties. To learn more check out Google's privacy policy.

### 11.Changes

We will post any privacy policy changes on this page and, if the changes are significant, we will provide a more prominent notice. If you have any questions or concerns about our privacy policies, please use a contact form on this page.

### 12\. How to Contact (E-mail)

If you have any questions regarding the service of CatBTI, please feel free to contact our customer support center at catbtiapp@gmail.com. In relation to the use of service, CatBTI may send you e-mails with service notices, management messages, and other information. You may refuse to receive such messages.

This Privacy Policy will be effective from February 22th 2022.

''',
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          floatingActionButton: FloatingActionButtonKit(),
        ),
      ),
    );
  }
}

main() async {
  return await startApp(callAfterBuild: (context) async {
    NewMarkdownTermNavigator(NewMarkdownTermParams(), tag: "someTag")
        .movePage(context, transition: Transition.fadeIn);
    // NewMarkdownTermNavigator(NewMarkdownTermParams(), tag: "someTag").movePageOffAllWithLoadingView(context);
  });
}
