// ignore_for_file: unused_element, unused_field

import 'package:app/components/rate_us.dart';
import 'package:app/pages/tabs.dart';
import 'package:app/pages/tasbih.dart';
import 'package:app/pages/zakat_tracker.dart';
import 'package:flutter/material.dart';
import 'package:app/components/theme_provider.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

class MyDrawer extends StatefulWidget {
  MyDrawer({Key? key}) : super(key: key) {
    _initAd();
  }

  @override
  _MyDrawerState createState() => _MyDrawerState();

  void _initAd() {}
}

class _MyDrawerState extends State<MyDrawer> {
  bool darkMode = false;
  bool isSwitched = false;
  late InterstitialAd _interstitialAd;
  bool _isAdLoaded = false;
  TimeOfDay _timeOfDay = TimeOfDay(hour: 20, minute: 00);

  void _initAd() {
    InterstitialAd.load(
        adUnitId: 'ca-app-pub-4962732239247234/6939308243',
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: onAdLoaded, onAdFailedToLoad: onAdFailedToLoad));
  }

  @override
  void initState() {
    super.initState();
    _initAd(); // Initialize the ad when the drawer initializes
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          SizedBox(
            height: 25,
          ),
          Image(
            image: AssetImage('assets/believerlogo.png'),
            height: 150,
            width: 200,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          ListTile(
            title: Text(
              'Home',
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),
            trailing: Icon(
              Icons.home,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.pushReplacement(
                // Navigate without ad if ad is not loaded
                context,
                MaterialPageRoute(builder: (context) => MyTabs()),
              );
              if (_isAdLoaded) {
                _interstitialAd.show(); // Show the ad if it's loaded
              }
            },
          ),
          ListTile(
            title: Text(
              'Zakat tracker',
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),
            trailing: Icon(
              Icons.account_balance_wallet,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.pushReplacement(
                // Navigate without ad if ad is not loaded
                context,
                MaterialPageRoute(builder: (context) => ZakatTracker()),
              );
              if (_isAdLoaded) {
                _interstitialAd.show(); // Show the ad if it's loaded
              }
            },
          ),
          ListTile(
            title: Text(
              'Tasbih',
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),
            trailing: Text(
              '📿',
              style: TextStyle(fontSize: 25),
            ),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.pushReplacement(
                // Navigate without ad if ad is not loaded
                context,
                MaterialPageRoute(builder: (context) => Tasbah()),
              );
              if (_isAdLoaded) {
                _interstitialAd.show(); // Show the ad if it's loaded
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          ListTile(
            title: Text(
              'More',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          ListTile(
            title: Text(
              'Dark Mode',
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),
            trailing: Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheme();
                  isSwitched = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text(
              'Share',
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),
            trailing: Icon(
              Icons.share,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onTap: () {
              Share.share(
                  'Check out Deen Pro on the Playstore and AppStore, I use it to track my daily Islamic habits and much more');
            },
          ),
          ListTile(
            title: Text(
              'Rate Us',
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),
            trailing: Icon(
              Icons.star,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RateUsDialog()));
            },
          ),
        ],
      ),
    );
  }

  void onAdFailedToLoad(LoadAdError error) {}

  void onAdLoaded(InterstitialAd ad) {
    _interstitialAd = ad;
    _isAdLoaded = true;

    _interstitialAd.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          _interstitialAd.dispose();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {});
  }

  //Show Time Picker
  void _showTimePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() {
        _timeOfDay = value!;
      });
    });
  }
}
