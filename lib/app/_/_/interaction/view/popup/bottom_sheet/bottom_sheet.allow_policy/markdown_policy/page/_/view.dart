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
  final NewMarkdownPolicyParams params;

  @override
  State<V> createState() => _VState();
}

class _VState extends State<V> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewMarkdownPolicyVM>(
      tag: widget.tag,
      autoRemove: false,
      builder: (vmNewMarkdownPolicy) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(tr("PolicyMarkDownMarkDownPage")),
          ),
          body: Markdown(
            data: '''

Last updated

January 18 2022

Privacy Policy
==============

### 0\. Basic Principle

CatBTI places the personal information of our customers as a top priority, and under no circumstances does the customers' personal information will be used for marketing purposes. CatBTI will not share the personal information of our customers with third parties in any case other than infrastructure maintenance.

### 1\. Purpose of Privacy Policy

The company has written this Privacy Policy based on Promotion of Information Network Utilization and Information Protection Act, and made our best efforts to explain the handling status of the users' personal information within the application in detail and in the easiest way possible.

The implications of the following Privacy Policy are as follows.

-   It transparently provides information related to what kind of information we ('CatBTI') gather, how the information is used, to whom the information will be shared (either 'consignment' or 'provided'), and when/how the information is destroyed after it has achieved its purpose of use.

-   As the provider of the information, the users will be informed of the rights they have over their personal information, and how they could exercise such rights. In addition, in the event of a personal information breach, the Privacy Policy will tell the users whom they could contact to prevent further damage and recover from the damage that has already occurred.

-   Most of all, the Privacy Policy will define the rights and obligations between the company and the users regarding personal information to ensure the user's 'right to informational self-determination.'

### 2\. Collection of Personal Information

#### Collected Data (Initially)

User PhoneNumber -- Purpose of user identification when logging in

UID -- For DB identification purposes

16 personality types -- Personality types are shared between friends within the app.

#### When Used

Contact (Hashed) -- Used after hashing to share personality types with friends

### 3\. Provision & Consignment of Personal Information

In principle, the company does not provide any personal information to the outside without the user's content. The company does not provide any personal information to the outside without prior consent from the user. However, the personal information will be provided to external parties in the following cases: 1) If a user directly agreed to provide their personal information to use the services of an external partner, 2) in the event where the user becomes obliged to submit their personal information to the company according to related laws. 3) and in the case where an urgent risk to the users' lives or safety are identified and personal information is required to address such issues.

The company will outsource a part of its work to provide a more convenient and better service.

-   Consignee: Firebase

-   Consigned Task: Infrastructure for Service Provision, Login via phone number

-   Retention/Usage Period of Personal Information: Until the end of the contract

Reference

-   Consignee: GCP

-   Consigned Task: Infrastructure for Service Provision

-   Retention/Usage Period of Personal Information: Until the end of the contract

### 4.Destruction of Personal Information

Once the purpose of the acquisition/utilization of personal information has been fulfilled, the company will destroy the collected personal information in an irreversible manner. For personal information that exists in the form of electronic files, they are safely deleted by utilizing technical methods which can prevent the recovery of the said information. In the case where the information exists in the form of printed material, they are destroyed through methods such as grinding or incineration.

Act on the Consumer Protection in Electronic Commerce, etc.

-   Records of contract or withdrawal of subscription: Stored for 5 years

-   Records of payment and supply of goods, etc.: Stored for 5 years

-   Records of the handling of consumer complaints and dispute: Stored for 3 years

Electronic Finance Transactions Act

-   Records on Electronic Finance: Stored for 5 years

Protection of Communications Secrets Act

-   Login Record: Stored for 3 months

### 5\. Minimum Age

Only those who are over the age of 17 can use this service.

### 6\. Company's Efforts to Protect Personal Information

The company does its best to manage the users' personal information in the safest way, and protects the users' personal information beyond the level required by the current law/regulation.

The company will securely manage your privacy from both internal and external security threats

-   In order to prevent leakage/damage of our members' personal information due to hacking or theft, the users' personal information is managed in a system that is installed and operated in a restricted area that limits outside access.

-   We install and operate various security systems to protect our users' personal information from hacking.

-   We send and receive personal information safely through the network by utilizing advanced encryption communication methods. We keep the number of individuals who are in charge of our users' personal information at a minimum.

-   We manage the number of staff members who handle our users' personal information to a minimum.

-   Through regular training on the staff members who handle personal information, frequent education for executives and employees, and campaigns that talk about the importance of personal information, we constantly emphasize that protecting the personal information of our users' is the most important value of our company. We operate a special organization dedicated to the protection of personal information.

-   The company has created and operated a 'personal information protection team' since the beginning of its establishment.

-   Even at this moment, we carry out various technical/administrative protection measures at all times through the security team (which is a part of the 'personal information protection team') to make sure that our employees comply with their obligations related to the protection of our users' personal information.

### 7\. Person in Charge of Personal Information Protection

Name: Lee Jun-gue

Department: Security Team

Position: DPO

E-Mail: catbtiapp@gmail.com

### 8\. Duty of Notification Prior to Revision

In the case where the contents of this Privacy Policy are added, deleted, or modified, the company will notify the revised contents of this Privacy Policy at least seven days prior to the revision through 'Notice.'

However, if a significant change in the user's rights occurs, such as a change in 'Collected Items,' or 'Purpose of Use,' the user shall be notified of the change at least 30 days in advance, and the user's consent may be obtained again if required.

Date of Announcement: February 13rd, 2022

Date of Implementation: February 23rd. 2022

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
    NewMarkdownPolicyNavigator(NewMarkdownPolicyParams(), tag: "someTag")
        .movePage(context, transition: Transition.fadeIn);
    // NewMarkdownPolicy(NewMarkdownPolicyParams(), tag: "someTag").movePageOffAllWithLoadingView(context);
  });
}
