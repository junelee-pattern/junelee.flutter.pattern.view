import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

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
          body: ZoomDrawer(
            controller: vmNew.zoomDrawerController,
            style: DrawerStyle.defaultStyle,
            menuScreen: Container(
              color: Colors.red,
              child: Text("Menu View")
                  .textStyle(Theme.of(context).textTheme.headlineMedium!)
                  .fontWeight(FontWeight.bold)
                  .center(),
            ),
            mainScreen: Container(
              color: Colors.green,
              child: Text("Main View")
                  .textStyle(Theme.of(context).textTheme.headlineMedium!)
                  .fontWeight(FontWeight.bold)
                  .center(),
            ),
            menuBackgroundColor: Colors.blue,
            borderRadius: 24.0,
            // showShadow: true,
            mainScreenTapClose: true,
            angle: 0.0,
            drawerShadowsBackgroundColor: Colors.grey,
            slideWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          floatingActionButton: FloatingActionButtonKit(
            button1: (context) {
              vmNew.zoomDrawerController.toggle!();
            },
          ),
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
