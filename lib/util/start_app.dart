import 'dart:async';

import 'package:flutter/material.dart';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_fgbg/flutter_fgbg.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../../../main.dart';
import '../util/params/app_cycle.dart';
import '../app/_/_/interaction/listener/_/app_life_cycle/turn_background.dart';
import '../app/_/_/interaction/listener/_/app_life_cycle/turn_foreground.dart';
import '../app/_/_/interaction/view/_/workspace.dart';
import 'config/screen_rotate.dart';
import 'config/support_language.dart';
import 'config/theme/_config.dart';
import 'ready/ready.dart';

export 'config/theme/_config.dart';
export 'config/firebase_function.dart';
export 'config/screen_rotate.dart';
export 'config/support_language.dart';
export 'config/isolate.dart';
export '../../../../../main.dart';

Future<void> myApp(
    {Widget? home, Function(BuildContext)? callAfterBuild}) async {
  await readyForRunAppStart();
  return runApp(ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        readyForMaterialAppStart();
        return EasyLocalization(
          supportedLocales: AppSupportLanguage().get(),
          path: 'assets/localization.csv',
          assetLoader: CsvAssetLoader(),
          fallbackLocale: const Locale('en'),
          child: Phoenix(
            child: DevicePreview(
              enabled: false,
              builder: (context) => MyApp(
                home,
                callAfterBuild: callAfterBuild,
              ),
            ),
          ),
        );
      }));
}

class MyApp extends StatelessWidget {
  MyApp(this.home, {super.key, this.callAfterBuild});

  final Widget? home;
  final Function(BuildContext)? callAfterBuild;

  @override
  Widget build(BuildContext context) {
    EasyLocalization.of(context)
        ?.setLocale(Locale(context.locale.languageCode));
    return GlobalLoaderOverlay(
      overlayColor: Colors.transparent,
      useDefaultLoading: false,
      child: FGBGNotifier(
        onEvent: (event) {
          if (event == FGBGType.foreground) {
            isForeground = true;
            TurnForegroundListener();
          } else {
            isForeground = false;
            TurnBackgroundListener();
          }
        },
        child: GetMaterialApp(
          localizationsDelegates: context.localizationDelegates
            ..add(CountryLocalizations.delegate),
          supportedLocales: context.supportedLocales,
          locale: DevicePreview.locale(context),
          //context.locale,
          title: "Awesome Flutter StarterKit",
          theme: ThemeConfig.appTheme,
          //lightThemeData,
          darkTheme: ThemeConfig.appDarkTheme,
          //darkThemeData,
          themeMode: ThemeMode.system,

          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            // do your initialization here
            child = EasyLoading.init()(context, child);
            child = DevicePreview.appBuilder(context, child);
            return child;
          },
          home: _ReadyPage(
            home: home,
            callAfterBuild: callAfterBuild,
          ),
        ),
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

    streamController.add(await WorkSpacePage()(context));
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
