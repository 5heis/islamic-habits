// import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

// class BottomAdNavigationBar extends StatefulWidget {
//   @override
//   _BottomAdNavigationBarState createState() => _BottomAdNavigationBarState();
// }

// class _BottomAdNavigationBarState extends State<BottomAdNavigationBar> {
//   late BannerAd _ad;
//   bool _isAdLoaded = false;

//   @override
//   void initState() {
//     super.initState();

//     String adUnitId = 'ca-app-pub-4962732239247234/2035246172';
//     _ad = BannerAd(
//       adUnitId: adUnitId,
//       size: AdSize.banner,
//       request: AdRequest(),
//       listener: BannerAdListener(
//         onAdLoaded: (ad) {
//           setState(() {
//             _isAdLoaded = true;
//           });
//         },
//         onAdFailedToLoad: (ad, error) {},
//       ),
//     );

//     _ad.load();
//   }

//   @override
//   void dispose() {
//     _ad.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BottomAppBar(
//       color: Colors.white,
//       child: Container(
//         height: 60,
//         child: _isAdLoaded
//             ? Container(
//                 height: _ad.size.height.toDouble(),
//                 width: _ad.size.width.toDouble(),
//                 alignment: Alignment.center,
//                 child: AdWidget(ad: _ad),
//               )
//             : SizedBox.shrink(),
//       ),
//     );
//   }
// }
