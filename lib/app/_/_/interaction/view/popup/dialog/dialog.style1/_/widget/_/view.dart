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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("정말 위시글을")
              .textStyle(Theme.of(context).textTheme.bodyMedium!)
              .fontWeight(FontWeight.bold),
          Text("삭제하실 건가요??")
              .textStyle(Theme.of(context).textTheme.bodyMedium!)
              .fontWeight(FontWeight.bold),
          SizedBox(height: 20),
          //button
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //black background
              ElevatedButton(
                      //round
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("삭제").fontSize(12))
                  .expanded(),
              Gap(10),
              ElevatedButton(
                      //rount
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("취소").fontSize(12))
                  .expanded(),
            ],
          )
        ],
      ).padding(vertical: 20, horizontal: 15),
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
