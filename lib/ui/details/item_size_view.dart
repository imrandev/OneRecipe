import 'package:flutter/material.dart';
import 'package:onerecipe/ui/widgets/circle_text_view.dart';

class ItemSizeView extends StatefulWidget {

  final String title;

  ItemSizeView(this.title);

  @override
  State<StatefulWidget> createState() => ItemSizeViewState(title);
}

class ItemSizeViewState extends State<ItemSizeView> {

  bool sixSelected = false, nineSelected = false, twelveSelected = false;

  final String title;

  ItemSizeViewState(this.title);

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          "$title",
          style: TextStyle(
            fontFamily: 'TitilliumWeb-Regular',
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleTextView(
                  text: "6",
                  isSelected: sixSelected,
                  onTap: () => {
                    setState(() {
                      sixSelected = true;
                      nineSelected = false;
                      twelveSelected = false;
                    })
                  },
                ),
                SizedBox(
                  width: 20,
                ),
                CircleTextView(
                  text: "9",
                  isSelected: nineSelected,
                  onTap: () => {
                    setState(() {
                      sixSelected = false;
                      nineSelected = true;
                      twelveSelected = false;
                    })
                  },
                ),
                SizedBox(
                  width: 20,
                ),
                CircleTextView(
                  text: "12",
                  isSelected: twelveSelected,
                  onTap: () => {
                    setState(() {
                      sixSelected = false;
                      nineSelected = false;
                      twelveSelected = true;
                    })
                  },
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
