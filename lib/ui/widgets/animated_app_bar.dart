import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onerecipe/route/ScreenNavigator.dart';
import 'package:onerecipe/utils/constant.dart';
import 'file:///E:/Mobile/Android/Flutter/onerecipe/lib/ui/widgets/circle_image_view.dart';

class AnimatedAppBar extends StatelessWidget {
  final AnimationController colorAnimationController;
  final Function onPressed;
  final Animation colorTween;
  final bool isMainView;
  final String title;

  AnimatedAppBar(
      {@required this.colorAnimationController,
      @required this.onPressed,
      this.colorTween,
      this.isMainView,
      this.title});

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
            Icon(
              CupertinoIcons.shopping_cart,
              color: Colors.white,
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
