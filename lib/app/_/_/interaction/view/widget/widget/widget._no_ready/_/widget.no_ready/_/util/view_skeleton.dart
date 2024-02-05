import 'package:flutter/material.dart';

import 'package:need_resume/need_resume.dart';

import '../../../../../../../../../../../../util/start_app.dart';
import '../config/di.dart';
import '../config/params.dart';
import '../cycle/after_first_layout.dart';
import '../cycle/dispose.dart';
import '../cycle/init_state.dart';
import '../cycle/on_ready.dart';
import '../cycle/on_resume.dart';
import '../cycle/on_stop.dart';
import '../view.dart';

export '../config/params.dart';

class NewView extends StatefulWidget {
  NewView({
    super.key,
    this.heroKey,
    this.tag,
    required this.params,
  }) {
    dependencyInjection(params, tag);
  }

  final NewParams params;
  final Key? heroKey;
  final String? tag;

  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends ResumableState<NewView>
    with AfterLayoutMixin<NewView> {
  @override
  Widget build(BuildContext context) {
    return V(
      heroKey: widget.heroKey,
      params: widget.params,
      tag: widget.tag,
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    NewViewAfterFirstLayout(context, widget.params, widget.tag);
  }

  @override
  void initState() {
    NewViewInitState(widget.params);
    super.initState();
  }

  @override
  void onReady() {
    currentPageName = 'New';
    NewViewOnReady();
  }

  @override
  void onResume() {
    currentPageName = 'New';
    NewViewOnResume();
  }

  @override
  void onPause() {
    NewViewOnStop();
  }

  bool isDisposed = false;

  @override
  void dispose() {
    super.dispose();
    NewViewDispose();
    isDisposed = true;
  }

  mySetState() {
    if (isDisposed == false) {
      setState(() {});
    }
  }
}
