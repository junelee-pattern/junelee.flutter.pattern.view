import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../util/config/admob.dart';

class MyAdMobParams {
  static MyAdMobParams get to => MyAdMobParams();

  String bannerUnitId1() {
    if (AdmobConfig.isTestAdMode) {
      // return 'ca-app-pub-3940256099942544/9214589741';//flutter 임시계정
      if (Platform.isAndroid) {
        return AndroidSampleUnit().banner;
      } else {
        return IosSampleUnit().banner;
      }
    } else {
      if (Platform.isAndroid) {
        return AdmobConfig.androidBannerUnit1;
      } else {
        return AdmobConfig.iosBannerUnit1;
      }
    }
  }

  String bannerUnitId2() {
    if (AdmobConfig.isTestAdMode) {
      if (Platform.isAndroid) {
        return AndroidSampleUnit().banner;
      } else {
        return IosSampleUnit().banner;
      }
    } else {
      if (Platform.isAndroid) {
        return AdmobConfig.androidBannerUnit2;
      } else {
        return AdmobConfig.iosBannerUnit2;
      }
    }
  }

  String bannerAndroidUnitId1() {
    if (AdmobConfig.isTestAdMode) {
      return AndroidSampleUnit().banner;
    } else {
      return AdmobConfig.androidBannerUnit1;
    }
  }

  String bannerAndroidUnitId2() {
    if (AdmobConfig.isTestAdMode) {
      return AndroidSampleUnit().banner;
    } else {
      return AdmobConfig.androidBannerUnit2;
    }
  }

  String bannerIosUnitId1() {
    if (AdmobConfig.isTestAdMode) {
      return IosSampleUnit().banner;
    } else {
      return AdmobConfig.iosBannerUnit1;
    }
  }

  String bannerIosUnitId2() {
    if (AdmobConfig.isTestAdMode) {
      return IosSampleUnit().banner;
    } else {
      return AdmobConfig.iosBannerUnit2;
    }
  }
}

class AndroidSampleUnit {
  String appOpen = "ca-app-pub-3940256099942544/3419835294";
  String banner = "ca-app-pub-3940256099942544/6300978111";
  String interstitial = "ca-app-pub-3940256099942544/1033173712";
  String interstitialVideo = "ca-app-pub-3940256099942544/8691691433";
  String rewarded = "ca-app-pub-3940256099942544/5224354917";
  String rewardedInterstitial = "ca-app-pub-3940256099942544/5354046379";
  String nativeAdvanced = "ca-app-pub-3940256099942544/2247696110";
  String nativeAdvancedVideo = "ca-app-pub-3940256099942544/1044960115";
}

class IosSampleUnit {
  String appOpen = "ca-app-pub-3940256099942544/5662855259";
  String banner = "ca-app-pub-3940256099942544/2934735716";
  String interstitial = "ca-app-pub-3940256099942544/4411468910";
  String interstitialVideo = "ca-app-pub-3940256099942544/5135589807";
  String rewarded = "ca-app-pub-3940256099942544/1712485313";
  String rewardedInterstitial = "ca-app-pub-3940256099942544/6978759866";
  String nativeAdvanced = "ca-app-pub-3940256099942544/3986624511";
  String nativeAdvancedVideo = "ca-app-pub-3940256099942544/2521693316";
}
