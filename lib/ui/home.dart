import 'package:flutter/material.dart';
import 'package:onerecipe/ui/widgets/animated_app_bar.dart';

import 'dashboard/dashboard_view.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> with TickerProviderStateMixin {

  // ignore: non_constant_identifier_names
  AnimationController _ColorAnimationController;

  // ignore: non_constant_identifier_names
  AnimationController _TextAnimationController;

  @override
  void initState() {
    _ColorAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));
    _TextAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));
    super.initState();
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomPadding: false,
      drawer: Drawer(),
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        child: Column(
          children: <Widget>[
            AnimatedAppBar(
              onPressed: () {
                scaffoldKey.currentState.openDrawer();
              },
              colorAnimationController: _ColorAnimationController,
              isMainView: true,
            ),
            DashboardView(),
          ],
        ),
      ),
    );
  }
}
