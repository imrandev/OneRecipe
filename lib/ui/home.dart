import 'package:flutter/material.dart';
import 'package:onerecipe/ui/widgets/animated_app_bar.dart';

import 'dashboard/dashboard_view.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> with TickerProviderStateMixin {

  AnimationController colorAnimationController;

  @override
  void initState() {
    colorAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));
    super.initState();
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.favorite),
            label: "Favorites",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
          )
        ],
      ),
      body: Container(
        height: double.infinity,
        child: Column(
          children: <Widget>[
            AnimatedAppBar(
              onPressed: () {

              },
              colorAnimationController: colorAnimationController,
              isMainView: true,
              counter: 0,
            ),
            DashboardView(),
          ],
        ),
      ),
    );
  }
}
