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

class _VState extends State<V> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewVM>(
      tag: widget.tag,
      autoRemove: false,
      builder: (vmNew) => Scaffold(
        appBar: AppBar(
          title: Text('Custom Tabs Demo'),
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Icon(Icons.directions_car),
            Icon(Icons.directions_bike),
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
