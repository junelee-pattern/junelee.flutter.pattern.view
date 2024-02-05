import 'package:flutter/material.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'my_ad_mob_params_class.dart';

class InlineWidthAdaptiveBanner extends StatefulWidget {
  InlineWidthAdaptiveBanner({
    Key? key,
    required this.width,
  }) : super(key: key);
  final double width;

  @override
  _InlineAdaptiveBannerState createState() => _InlineAdaptiveBannerState();
}

class _InlineAdaptiveBannerState extends State<InlineWidthAdaptiveBanner>
    with AutomaticKeepAliveClientMixin {
  BannerAd? _inlineAdaptiveAd;
  bool _isLoaded = false;
  AdSize? _adSize;
  late Orientation _currentOrientation;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _currentOrientation = MediaQuery.of(context).orientation;
    _loadAd();
  }

  void _loadAd() async {
    await _inlineAdaptiveAd?.dispose();
    setState(() {
      _inlineAdaptiveAd = null;
      _isLoaded = false;
    });

    // Get an inline adaptive size for the current orientation.
    AdSize size = AdSize.getCurrentOrientationInlineAdaptiveBannerAdSize(
        widget.width.truncate());

    _inlineAdaptiveAd = BannerAd(
      // TODO: replace this test ad unit with your own ad unit.
      adUnitId: MyAdMobParams.to.bannerUnitId1(),
      //'ca-app-pub-3940256099942544/9214589741',
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

          setState(() {
            _inlineAdaptiveAd = bannerAd;
            _isLoaded = true;
            _adSize = size;
          });
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
  Widget _getAdWidget() {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (_currentOrientation == orientation &&
            _inlineAdaptiveAd != null &&
            _isLoaded &&
            _adSize != null) {
          return Align(
              child: Container(
            width: _adSize!.width.toDouble(),
            height: _adSize!.height.toDouble(),
            child: AdWidget(
              ad: _inlineAdaptiveAd!,
            ),
          ));
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
  Widget build(BuildContext context) => _getAdWidget();

  @override
  void dispose() {
    super.dispose();
    _inlineAdaptiveAd?.dispose();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
