import 'package:flutter/material.dart';

import 'package:after_layout/after_layout.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:styled_widget/styled_widget.dart';

import 'my_ad_mob_params_class.dart';

class InlineSizeAdaptiveBanner extends StatefulWidget {
  InlineSizeAdaptiveBanner(
      {Key? key,
      required this.width,
      required this.maxHeight,
      this.noBackgroundColor,
      this.centerAd,
      this.adUnitId,
      this.iconWidget})
      : super(key: key);
  final double width;
  final double maxHeight;
  final Widget? iconWidget;
  final bool? noBackgroundColor;
  final bool? centerAd;
  final String? adUnitId;

  @override
  _InlineAdaptiveBannerState createState() => _InlineAdaptiveBannerState();
}

class _InlineAdaptiveBannerState extends State<InlineSizeAdaptiveBanner>
    with
        AfterLayoutMixin<InlineSizeAdaptiveBanner>,
        AutomaticKeepAliveClientMixin {
  BannerAd? _inlineAdaptiveAd;
  bool _isLoaded = false;
  AdSize? _adSize;
  late Orientation _currentOrientation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    debugPrint('run initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _currentOrientation = MediaQuery.of(context).orientation;
    _loadAd();
  }

  void _loadAd() async {
    if (_inlineAdaptiveAd != null) {
      mySetState();
    }
    await _inlineAdaptiveAd?.dispose();
    _inlineAdaptiveAd = null;
    _isLoaded = true;
    mySetState();

    // Get an inline adaptive size for the current orientation.
    // AdSize size = AdSize.getCurrentOrientationInlineAdaptiveBannerAdSize(
    //     _adWidth.truncate());

    AdSize size = AdSize.getInlineAdaptiveBannerAdSize(
        widget.width.truncate(), widget.maxHeight.truncate());

    _inlineAdaptiveAd = BannerAd(
      // TODO: replace this test ad unit with your own ad unit.
      adUnitId: widget.adUnitId ?? MyAdMobParams.to.bannerUnitId1(),
      //'ca-app-pub-3940256099942544/9214589741'
      size: size,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) async {
          debugPrint('Inline adaptive banner loaded: ${ad.responseInfo}');

          // After the ad is loaded, get the platform ad size and use it to
          // update the height of the container. This is necessary because the
          // height can change after the ad is loaded.
          BannerAd bannerAd = (ad as BannerAd);
          final AdSize? size = await bannerAd.getPlatformAdSize();
          if (size == null) {
            debugPrint(
                'Error: getPlatformAdSize() returned null for $bannerAd');
            return;
          }
          _inlineAdaptiveAd = bannerAd;
          _isLoaded = true;
          _adSize = size;
          mySetState();
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          debugPrint('Inline adaptive banner failedToLoad: $error');
          ad.dispose();
        },
      ),
    );
    await _inlineAdaptiveAd!.load();
  }

  /// Gets a widget containing the ad, if one is loaded.
  ///
  /// Returns an empty container if no ad is loaded, or the orientation
  /// has changed. Also loads a new ad if the orientation changes.
  Widget _getAdWidget(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (_currentOrientation == orientation &&
            _inlineAdaptiveAd != null &&
            _isLoaded &&
            _adSize != null) {
          if (widget.centerAd != null && widget.centerAd == true) {
            return Align(
                child: Container(
              width: _adSize!.width.toDouble(),
              height: _adSize!.height.toDouble(),
              child: AdWidget(
                ad: _inlineAdaptiveAd!,
              ),
            ).height(widget.maxHeight));
          } else {
            return Align(
                child: Container(
              width: _adSize!.width.toDouble(),
              height: _adSize!.height.toDouble(),
              child: AdWidget(
                ad: _inlineAdaptiveAd!,
              ),
            ));
          }
        }
        // Reload the ad if the orientation changes.
        if (_currentOrientation != orientation) {
          _currentOrientation = orientation;
          _loadAd();
        }
        return Container();
      },
    );
  }

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Container(
            child: Container(
              child: (widget.iconWidget != null)
                  ? widget.iconWidget!.center()
                  : Container(),
            ),
          )
              .decorated(
                  borderRadius: BorderRadius.circular(30),
                  color: (widget.noBackgroundColor != null &&
                          !widget.noBackgroundColor!)
                      ? Colors.transparent
                      : Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .color!
                          .withOpacity(0.06))
              .paddingDirectional(horizontal: 30, vertical: 30)
              .width(widget.width)
              .height(widget.maxHeight),

          // myImage(assetPath: Assets.image.adImage.path,w: widget.width,h: widget.maxHeight),
          _getAdWidget(context)
        ],
      );

  bool isDisposed = false;

  @override
  void dispose() {
    super.dispose();
    isDisposed = true;
    _inlineAdaptiveAd?.dispose();
  }

  mySetState() {
    //setState 는 이런식으로 해야 위젯이 종료된뒤에 바꾸려는거 막음
    if (isDisposed == false) {
      setState(() {});
    }
  }

  @override
  void afterFirstLayout(BuildContext context) {
    // TODO: implement afterFirstLayout
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
