import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final IconData iconData;
  final Color backgroundColor;
  final Color iconColor, textColor;
  final String title;

  const RoundButton(
      {Key key,
      this.onTap,
      this.iconData,
      this.backgroundColor,
      this.iconColor,
      this.title,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = 60.0;

    return Container(
      child: Column(
        children: [
          new InkResponse(
            onTap: onTap,
            child: new Container(
              width: size,
              height: size,
              decoration: new BoxDecoration(
                color: backgroundColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffe0e0e0),
                    blurRadius: 8.0, // soften the shadow
                    spreadRadius: 0.5, //extend the shadow
                    offset: Offset(
                      0.5, // Move to right 0.5  horizontally
                      1.0, // Move to bottom 1.0 Vertically
                    ),
                  ),
                ],
              ),
              child: new Icon(
                iconData,
                color: iconColor,
                size: 32,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: TextStyle(
              fontFamily: 'TitilliumWeb-Regular',
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
