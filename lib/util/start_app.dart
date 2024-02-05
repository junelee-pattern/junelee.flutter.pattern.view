import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../main.dart';
import '../app/_/_/interaction/view/_/_/init_view.dart';
import 'config/screen_rotate.dart';
import 'config/theme/_config.dart';
import 'ready/ready.dart';

export 'config/theme/_config.dart';
export 'config/screen_rotate.dart';
export '../../../../../main.dart';

Future<void> myApp(
    {Widget? home, Function(BuildContext)? callAfterBuild}) async {
  await readyForRunAppStart();
  return runApp(ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        readyForMaterialAppStart();
        return MyApp(
          home,
          callAfterBuild: callAfterBuild,
        );
      }));
}

class MyApp extends StatelessWidget {
  MyApp(this.home, {super.key, this.callAfterBuild});

  final Widget? home;
  final Function(BuildContext)? callAfterBuild;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Awesome Flutter StarterKit",
      theme: ThemeConfig.appTheme,
      darkTheme: ThemeConfig.appDarkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: _ReadyPage(
        home: home,
        callAfterBuild: callAfterBuild,
      ),
    );
  }
}

class _ReadyPage extends StatefulWidget {
  _ReadyPage({super.key, required this.home, this.callAfterBuild});

  final Widget? home;
  final Function(BuildContext)? callAfterBuild;

  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<_ReadyPage> with AfterLayoutMixin<_ReadyPage> {
  StreamController<Widget> streamController = StreamController<Widget>();

  @override
  void initState() {
    _ready();
    super.initState();
  }

  dynamic _ready() async {
    await readyForAppStart(context);

    streamController.add(await InitView()(context));
    // return true;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.ensureScreenSize();
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
      child: Scaffold(
          body: StreamBuilder(
        stream: streamController.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            FlutterNativeSplash.remove();
            return widget.home ?? snapshot.data as Widget;
          } else {
            return Container();
          }
        },
      )),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    widget.callAfterBuild?.call(context);
  }
}

startApp({Widget? home, Function(BuildContext)? callAfterBuild}) {
  return myApp(home: home, callAfterBuild: callAfterBuild);
}

main() {
  return startApp();
}
