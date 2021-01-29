import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onerecipe/route/ScreenNavigator.dart';
import 'package:onerecipe/utils/Constant.dart';
import 'file:///E:/Mobile/Android/Flutter/onerecipe/lib/ui/widgets/circle_image_view.dart';

class AnimatedAppBar extends StatelessWidget {
  final AnimationController colorAnimationController;
  final Function onPressed;
  final Animation colorTween;
  final bool isMainView;
  final String title;
  final int counter;

  AnimatedAppBar(
      {@required this.colorAnimationController,
      @required this.onPressed,
      this.colorTween,
      this.isMainView,
      this.title,
      @required this.counter});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: AnimatedBuilder(
        animation: colorAnimationController,
        builder: (context, child) => AppBar(
          shadowColor: Color(0xffe0e0e0),
          leading: isMainView
              ? CircleImageView(
                  onTap: onPressed,
                  imgUrl: Constant.profileAvatarUrl,
                )
              : IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () => {ScreenNavigator().navigatePop(context)}),
          backgroundColor:
              colorTween != null ? colorTween.value : Colors.deepOrangeAccent,
          titleSpacing: 0.0,
          title: isMainView
              ? Row(
                  children: <Widget>[
                    Text(
                      "Hi, ",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'TitilliumWeb-SemiBold',
                        fontSize: 18,
                        letterSpacing: 1,
                      ),
                    ),
                    Text(
                      "Imran",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'TitilliumWeb-SemiBold',
                        fontSize: 18,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                )
              : Text(
                  "$title",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'TitilliumWeb-SemiBold',
                    fontSize: 18,
                    letterSpacing: 1,
                  ),
                ),
          actions: <Widget>[
            new Stack(
              alignment: Alignment.center,
              children: <Widget>[
                new Icon(
                  CupertinoIcons.shopping_cart,
                  color: Colors.white,
                ),
                new Positioned(
                  top: 12,
                  right: 0,
                  child: new Container(
                    padding: EdgeInsets.all(1),
                    decoration: new BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 12,
                      minHeight: 12,
                    ),
                    child: new Text(
                      '$counter',
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Icon(
                CupertinoIcons.search,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
