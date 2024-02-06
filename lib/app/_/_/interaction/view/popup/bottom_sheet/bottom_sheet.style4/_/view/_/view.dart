import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

import '../../../../../../../../../../../util/start_app.dart';
import '../../../new_item/widget/_/util/view_skeleton.dart';
import '../../vm/_/vm.dart';
import 'config/params.dart';
import 'util/view_skeleton.dart';

class V extends StatefulWidget {
  const V({super.key, this.heroKey, this.tag, required this.params});

  final Key? heroKey;
  final String? tag;
  final NewParams params;

  @override
  State<V> createState() => _VState();
}

class _VState extends State<V> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewVM>(
      tag: widget.tag,
      autoRemove: false,
      builder: (vmNew) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(tr("Please allow permissions to use the app."))
                  .textStyle(Theme.of(context).textTheme.titleLarge!)
                  .fontWeight(FontWeight.w800)
                  .fontSize(20),
              Gap(5),
              Text(tr("We only request essential permissions."))
                  .textStyle(Theme.of(context).textTheme.titleLarge!)
                  .fontWeight(FontWeight.w800)
                  .fontSize(20),
              Gap(50),
              NewItemView(
                  params: NewItemParams(
                      icon: Icons.phone,
                      permissionTitle: tr("Call"),
                      permissionDescription: tr("Read phone numbers and add friends' accounts."))),
              NewItemView(
                  params: NewItemParams(
                      icon: Icons.contacts,
                      permissionTitle: tr("Contacts"),
                      permissionDescription: tr(
                          "You can send money for free to people saved in your contacts, load profile pictures, and send invitation messages for various benefits. To do this, we synchronize contact information with the Toss server to keep it up to date."))),
              NewItemView(
                  params: NewItemParams(
                      icon: Icons.folder,
                      permissionTitle: tr("Storage"),
                      permissionDescription:
                          tr("Log in with a digital certificate and save transfer confirmation receipts or QR codes."))),
              NewItemView(
                  params: NewItemParams(
                      icon: Boxicons.bxs_chat,
                      permissionTitle: tr("Notifications"),
                      permissionDescription: tr("Notify me when a new friend registers their MBTI."))),
              NewItemView(
                  params: NewItemParams(
                      icon: Icons.track_changes,
                      permissionTitle: tr("App tracking"),
                      permissionDescription: tr(
                          "We display personalized ads in a non-intrusive manner to maintain the app and server."))),
              Gap(20),
              MaterialButton(
                      onPressed: () {},
                      color: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text("Login")
                          .textStyle(Theme.of(context).textTheme.bodyLarge!)
                          .textColor(Colors.white))
                  .width(1.sw)
                  .height(60),
            ],
          ),
        ),
      ),
    );
  }
}

main() async {
  return await startApp(
      home: SafeArea(
    child: NewView(
      tag: "someTag",
      params: NewParams(
        onTap: (context) {
          print("onTap");
        },
      ),
    ),
  ));
}
