import 'package:flutter/material.dart';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../../../../../util/start_app.dart';

class WorkSpacePage {
  Future<Widget> call(BuildContext context) async {
    // return await NewNavigator(NewParams()).getPage(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Gap(20),
                Text("New App")
                    .textStyle(Theme.of(context).textTheme.displaySmall!)
                    .fontWeight(FontWeight.bold)
                    .center(),
                Gap(20),
                _button(context, "New Page", () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _button(BuildContext context, String label, VoidCallback onTap) =>
      OutlinedButton(
        onPressed: () {
          onTap();
        },
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: BorderSide(
              color: Theme.of(context).textTheme.bodyMedium!.color!,
              width: 2), // 테두리 색상과 두께 설정
        ),
        child: Text(label)
            .fontWeight(FontWeight.bold)
            .textColor(Theme.of(context).textTheme.bodyMedium!.color!)
            .padding(vertical: 15, horizontal: 20),
      ).padding(
        horizontal: 20,
        vertical: 7,
      );
}
