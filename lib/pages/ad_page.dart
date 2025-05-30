import 'package:csen268_s25/services/ad_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdPage extends StatefulWidget {
  const AdPage({super.key});

  @override
  State<AdPage> createState() => _AdPageState();
}

class _AdPageState extends State<AdPage> {
  late BannerAd bannerAd;
  CrossFadeState crossFadeState = CrossFadeState.showFirst;

  @override
  void initState() {
    super.initState();
    bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            bannerAd = ad as BannerAd;
            crossFadeState = CrossFadeState.showSecond;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ads")),
      body: Column(
        children: [
          AnimatedCrossFade(
            firstChild: Text("Ad is not loaded yet"),
            secondChild: AdWidget(ad: bannerAd),
            crossFadeState: crossFadeState,
            duration: Duration(milliseconds: 300),
          ),
        ],
      ),
    );
  }
}
