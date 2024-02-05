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
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewVM>(
      tag: widget.tag,
      autoRemove: false,
      builder: (vmNew) => SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: DefaultTabController(
            length: 3, // 탭의 개수
            child: Scaffold(
              appBar: AppBar(
                title: Text('TabBar'),
                bottom: TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.directions_car), text: "1번"),
                    Tab(icon: Icon(Icons.directions_bike), text: "2번"),
                    Tab(icon: Icon(Icons.directions_transit), text: "3번"),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  // 각 탭의 내용
                  Icon(Icons.directions_car),
                  Icon(Icons.directions_bike),
                  Icon(Icons.directions_transit),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButtonKit(),
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
