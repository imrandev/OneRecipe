import 'package:flutter/material.dart';

class CircleTextView extends StatelessWidget {

  final GestureTapCallback onTap;
  final String text;
  final bool isSelected;

  const CircleTextView({
    Key key,
    this.onTap,
    this.text,
    this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = 64.0;

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new InkWell(
            onTap: onTap,
            child: new Container(
              width: size,
              height: size,
              alignment: Alignment.center,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? Color(0xff333637) : Color(0xffEC7430),
              ),
              child: Text(
                  text,
                style: TextStyle(
                  fontFamily: 'TitilliumWeb-SemiBold',
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
