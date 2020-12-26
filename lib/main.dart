import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/allTasks.dart';
import 'package:flutter_app/pages/completedTasks.dart';
import 'package:flutter_app/pages/incompleteTasks.dart';
import 'package:flutter_app/pages/newTask.dart';
import 'package:flutter_app/pages/splash.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}

// ignore: camel_case_types
class myPage extends StatefulWidget {
  @override
  _myPageState createState() => _myPageState();
}

// ignore: camel_case_types
class _myPageState extends State<myPage> with TickerProviderStateMixin {
  TabController tabController;
  var selected = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> pages = [allTasks(), complete(), incomplete()];

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child:  Icon(Icons.add),
        onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return NewTask();
        }));
      },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GNav(
            gap: 8,
            activeColor: Colors.white,
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            duration: Duration(milliseconds: 500),
            tabBackgroundColor: Colors.blue,
            tabs: [
              GButton(
                icon: (selected == 0) ? Icons.all_inbox : Icons.all_inbox_outlined,
                text: 'All Tasks',
                iconColor: Colors.blue,
                iconActiveColor: Colors.white,
              ),
              GButton(
                icon: (selected == 1)
                    ? Icons.check_circle
                    : Icons.check_circle_outline,
                text: 'Completed Tasks',
                iconColor: Colors.blue,
                iconActiveColor: Colors.white,
              ),
              GButton(
                icon:
                    (selected == 2) ? Icons.cancel : Icons.cancel_outlined,
                text: 'Incomplete Tasks',
                iconColor: Colors.blue,
                iconActiveColor: Colors.white,
              )
            ],
            selectedIndex: selected,
            onTabChange: (index) {
              setState(() {
                selected = index;
                tabController.animateTo(index);
              });
            }),
      ),
      appBar: AppBar(
        title: Text('My Tasks'),
      ),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: pages,
            ),
          ),
          /*RaisedButton(child: Text('Move to Complete'), onPressed: () {
            tabController.animateTo(1);
          }),*/
        ],
      ),
    );
  }
}