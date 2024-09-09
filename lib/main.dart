import 'package:app/components/theme_provider.dart';
import 'package:app/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'data/zakat.dart';

AppOpenAd? appOpenAd;
loadAppOpenAd() {
  AppOpenAd.load(
    adUnitId: 'ca-app-pub-4962732239247234/8331362062',
    request: AdRequest(),
    orientation: AppOpenAd.orientationPortrait,
    adLoadCallback: AppOpenAdLoadCallback(
      onAdLoaded: (ad) {
        appOpenAd = ad;
        appOpenAd!.show();
      },
      onAdFailedToLoad: (error) {
        print(error);
      },
    ),
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Admob initiallization
  MobileAds.instance.initialize();
  // initialize hive
  await Hive.initFlutter();
  loadAppOpenAd();

  // open a Habit box
  await Hive.openBox("Habit_Database");
  // open a Zakat box
  Hive.registerAdapter(ZakatAdapter());
  await Hive.openBox<Zakat>('zakatBox');

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Splash(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
