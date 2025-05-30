// import 'dart:io';
import 'package:flutter/foundation.dart';

class AdHelper {
  static String get bannerAdUnitId {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return 'ca-app-pub-6114617410105030/9084174134';
    }
    throw new UnsupportedError('Unsupported platform');
  }
}
