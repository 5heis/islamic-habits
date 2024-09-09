import 'package:app/components/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:flutter/services.dart';
import '../components/my__drawer.dart';

class Tasbah extends StatefulWidget {
  @override
  _TasbahState createState() => _TasbahState();
}

class _TasbahState extends State<Tasbah> {
  int _subhanAllahCount = 0;
  int _alhamdulillahCount = 0;
  int _allahuAkbarCount = 0;
  int _finalDuaCount = 0;
  int _totalCount = 100;
  bool _showResetButton = false;

  void _incrementCounter() {
    setState(() {
      if (_subhanAllahCount < 33) {
        _subhanAllahCount++;
      } else if (_alhamdulillahCount < 33) {
        _alhamdulillahCount++;
      } else if (_allahuAkbarCount < 33) {
        _allahuAkbarCount++;
      } else if (_finalDuaCount < 1) {
        _finalDuaCount++;
      }
      if (_subhanAllahCount +
              _alhamdulillahCount +
              _allahuAkbarCount +
              _finalDuaCount ==
          _totalCount) {
        _showResetButton = true;
      }
    });
  }

  void _resetCount() {
    setState(() {
      _subhanAllahCount = 0;
      _alhamdulillahCount = 0;
      _allahuAkbarCount = 0;
      _finalDuaCount = 0;
      _showResetButton = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Tasbih'),
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 2, 179, 8),
        foregroundColor: Colors.white,
        actions: [
          IconButton(onPressed: _resetCount, icon: Icon(Icons.restart_alt))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildCounterSection(
                        'سبحان الله', 'SubhanAllah', _subhanAllahCount, 33),
                    _buildCounterSection(
                        'الحمد لله', 'Alhamdulillah', _alhamdulillahCount, 33),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildCounterSection(
                        'الله أكبر', 'Allahu Akbar', _allahuAkbarCount, 33),
                  ],
                ),
                Divider(),
                Center(
                    child: _buildCounterSection(
                        'لاَ إِلَهَ إِلاَّ اللَّهُ وَحْدَهُ لاَ شَرِيكَ لَهُ، لَهُ الْمُلْكُ، وَلَهُ الْحَمْدُ، وَهُوَ عَلَى كُلِّ شَىْءٍ قَدِيرٌ',
                        'La ilaha ill-Allahu, wahdahu la sharika lahu, lahul-mulku wa lahulhamdu, wa Huwa ‘ala kulli shai’in Qadir',
                        _finalDuaCount,
                        1)),
                Divider(),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: _showResetButton
            ? () {
                HapticFeedback.lightImpact(); // Haptic feedback
                _resetCount();
              }
            : () {
                HapticFeedback.lightImpact(); // Haptic feedback
                _incrementCounter();
              },
        child: const Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 2, 179, 8),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildCounterSection(
      String Arabic, String title, int count, int targetCount) {
    double progress = count / targetCount;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Text(
            '$Arabic',
            textDirection: TextDirection.rtl,
            style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Text(
            '$title',
            style: TextStyle(
                color: Theme.of(context).colorScheme.secondary, fontSize: 18),
          ),
        ),
        CircularPercentIndicator(
          radius: 50,
          lineWidth: 10.0,
          percent: progress,
          center: Text(
            '$count/$targetCount',
            style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
          progressColor: Color.fromARGB(255, 2, 179, 8),
        ),
      ],
    );
  }
}
