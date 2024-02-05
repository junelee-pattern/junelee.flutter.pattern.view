import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

import '../../../../../../../../../../../util/start_app.dart';
import '../../vm/_/vm.dart';
import 'config/params.dart';
import 'util/navigator.dart';
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
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewVM>(
      tag: widget.tag,
      autoRemove: false,
      builder: (vmNew) => Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: [
            //////////////////////////////////////////////////////////////////
            Container().backgroundColor(Colors.red),
            Container().backgroundColor(Colors.blue),
            Container().backgroundColor(Colors.yellow),
            Container().backgroundColor(Colors.green),
            //////////////////////////////////////////////////////////////////
          ],
        ),
      ),
    );
  }
}

main() async {
  return await startApp(callAfterBuild: (context) async {
    NewNavigator(NewParams(), tag: "someTag")
        .movePage(context, transition: Transition.fadeIn);
    // NewNavigator(NewParams(), tag: "someTag").movePageOffAllWithLoadingView(context);
  });
}
