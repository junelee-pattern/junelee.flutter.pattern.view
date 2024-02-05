import 'package:flutter/material.dart';

import 'package:need_resume/need_resume.dart';

import '../../../../../../../../../../../../util/start_app.dart';
import '../config/di.dart';
import '../config/loading.dart';
import '../config/params.dart';
import '../cycle/after_first_layout.dart';
import '../cycle/dispose.dart';
import '../cycle/init_state.dart';
import '../cycle/on_ready.dart';
import '../cycle/on_resume.dart';
import '../cycle/on_stop.dart';
import '../cycle/ready_view.dart';
import '../view.dart';

export '../config/params.dart';

class NewItemColumnButton3View extends StatefulWidget {
  NewItemColumnButton3View({
    super.key,
    this.heroKey,
    this.tag,
    this.readyDone = false,
    required this.params,
  }) {
    dependencyInjection(params, tag);
  }

  final NewItemColumnButton3Params params;
  final Key? heroKey;
  final bool readyDone;
  final String? tag;

  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends ResumableState<NewItemColumnButton3View>
    with AfterLayoutMixin<NewItemColumnButton3View> {
  bool isReadyView = false;

  @override
  Widget build(BuildContext context) {
    return (!isReadyView)
        ? LoadingComponent(
            params: widget.params,
            tag: widget.tag,
          )
        : V(
            heroKey: widget.heroKey,
            params: widget.params,
            tag: widget.tag,
          );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    NewItemColumnButton3ViewAfterFirstLayout(
        context, widget.params, widget.tag);
  }

  @override
  void initState() {
    if (!widget.readyDone) {
      readyPage(widget.params, context);
    } else {
      isReadyView = true;
    }
    NewItemColumnButton3ViewInitState(widget.params, widget.params.context);
    super.initState();
  }

  @override
  void onReady() {
    currentPageName = 'NewItemColumnButton3';
    NewItemColumnButton3ViewOnReady();
  }

  @override
  void onResume() {
    currentPageName = 'NewItemColumnButton3';
    NewItemColumnButton3ViewOnResume();
  }

  @override
  void onPause() {
    NewItemColumnButton3ViewOnStop();
  }

  bool isDisposed = false;

  @override
  void dispose() {
    super.dispose();
    NewItemColumnButton3ViewDispose();
    isDisposed = true;
  }

  mySetState() {
    if (isDisposed == false) {
      setState(() {});
    }
  }

  Future<void> readyPage(
    NewItemColumnButton3Params params,
    BuildContext context,
  ) async {
    if (isReadyView) return; // already executed, exit
    params.context = context;
    await readyView(params, context, widget.tag);

    if (isDisposed == false) {
      setState(() {
        isReadyView = true;
      });
    }
  }
}
