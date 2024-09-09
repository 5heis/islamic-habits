import 'package:app/pages/home_page.dart';
import 'package:app/pages/plant_screen.dart';
import 'package:flutter/material.dart';
import '../components/my__drawer.dart';

class MyTabs extends StatelessWidget {
  const MyTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          title: Text('My Habit'),
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 2, 179, 8),
          bottom: TabBar(
            indicatorColor: Theme.of(context).colorScheme.secondary,
            tabs: [
              Tab(
                icon: Icon(Icons.playlist_add_check),
              ),
              Tab(
                icon: Icon(Icons.eco),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [HomePage(), PlantScreen()],
        ),
      ),
    );
  }
}
