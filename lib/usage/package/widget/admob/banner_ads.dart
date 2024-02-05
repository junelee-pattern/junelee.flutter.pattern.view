import 'dart:io';

import 'package:flutter/material.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerAds extends StatefulWidget {
  BannerAds(
      {Key? key,
      required this.adSize,
      required this.androidUnitId,
      required this.iosUnitId})
      : super(key: key);

  final AdSize? adSize;
  final String androidUnitId;
  final String iosUnitId;

  @override
  _GetBannerAdState createState() => _GetBannerAdState();
}

class _GetBannerAdState extends State<BannerAds> {
  var bannerAdIsLoaded = false;
  BannerAd? bannerAd;
  Widget adWidget = Container();

  @override
  void initState() {
    loadAd();

    super.initState();
  }

  loadAd() {
    if (widget.adSize != null) {
      bannerAd = BannerAd(
          size: widget.adSize!,
          adUnitId:
              Platform.isAndroid ? widget.androidUnitId : widget.iosUnitId,
          listener: BannerAdListener(
            onAdLoaded: (Ad ad) {
              debugPrint('$BannerAd loaded.');
              setState(() {
                bannerAdIsLoaded = true;
              });
            },
            onAdFailedToLoad: (Ad ad, LoadAdError error) {
              debugPrint('$BannerAd failedToLoad: $error');
              ad.dispose();
            },
            onAdOpened: (Ad ad) => debugPrint('$BannerAd onAdOpened.'),
            onAdClosed: (Ad ad) => debugPrint('$BannerAd onAdClosed.'),
          ),
          request: const AdRequest())
        ..load();
    }
  }

  @override
  Widget build(BuildContext context) {
    return bannerAdIsLoaded
        ? (bannerAd != null)
            ? Container(
                height: bannerAd!.size.height.toDouble(),
                width: bannerAd!.size.width.toDouble(),
                child: AdWidget(ad: bannerAd!))
            : Container()
        : Container();
  }
}
