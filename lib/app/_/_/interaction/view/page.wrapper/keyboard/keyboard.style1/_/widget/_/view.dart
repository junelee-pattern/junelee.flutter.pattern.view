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
      builder: (vmNew) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            height: 1,
            thickness: 1,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                // Flexible 또는 Expanded 사용
                child: TextFormField(
                  controller: vmNew.textEditingController,
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  // 최소 시작 줄 수
                  maxLines: 4,
                  // 최대 확장될 수 있는 줄 수
                  decoration: InputDecoration(
                    hintText: '댓글 달기...',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    // Padding 조절
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
              ),
            ],
          ).padding(horizontal: 10, vertical: 10),
        ],
      ),
    );
  }
}

main() async {
  return await startApp(
      home: SafeArea(
    child: NewView(
      tag: "someTag",
      params: NewParams(),
    ),
  ));
}
