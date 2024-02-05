import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

import '../../../../../../../../../../../util/start_app.dart';
import '../../vm/_/vm.dart';
import 'config/params.dart';
import 'util/view_skeleton.dart';

class V extends StatefulWidget {
  const V({super.key, this.heroKey, this.tag, required this.params});

  final Key? heroKey;
  final String? tag;
  final NewItemParams params;

  @override
  State<V> createState() => _VState();
}

class _VState extends State<V> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewItemVM>(
      tag: widget.tag,
      autoRemove: false,
      builder: (vmNewItem) => Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(widget.params.icon, color: Colors.grey.shade500, size: 33),
          Gap(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.params.permissionTitle)
                    .textStyle(Theme.of(context).textTheme.bodyLarge!)
                    .fontWeight(FontWeight.bold)
                    .textColor(Colors.grey.shade700)
                    .fontSize(16),
                Gap(6),
                Text(
                  widget.params.permissionDescription,
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                )
                    .textStyle(Theme.of(context).textTheme.bodyMedium!)
                    .fontWeight(FontWeight.normal)
                    .textColor(Colors.grey.shade600)
                    .fontSize(13),
              ],
            ),
          )
        ],
      ).padding(bottom: 30),
    );
  }
}

main() async {
  return await startApp(
      home: SafeArea(
    child: NewItemView(
      tag: "someTag",
      params: NewItemParams(
        icon: Icons.add,
        permissionTitle: "permissionTitle",
        permissionDescription: "permissionDescription",
      ),
    ),
  ));
}
