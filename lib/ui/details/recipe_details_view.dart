import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onerecipe/model/recipe.dart';
import 'package:onerecipe/ui/widgets/animated_app_bar.dart';
import 'package:onerecipe/utils/IconUtil.dart';
import 'package:onerecipe/utils/Constant.dart';
import 'package:onerecipe/utils/MediaQueryUtil.dart';

class RecipeDetailsView extends StatefulWidget {
  final Recipe recipe;

  RecipeDetailsView(this.recipe);

  @override
  State<StatefulWidget> createState() => RecipeDetailsState(recipe);
}

class RecipeDetailsState extends State<RecipeDetailsView> with TickerProviderStateMixin {

  AnimationController _colorAnimationController;
  Animation _backgroundColorTween;
  final Recipe recipe;

  int counter = 0;
  bool isChecked = false;

  RecipeDetailsState(this.recipe);

  @override
  void initState() {
    _colorAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));
    _backgroundColorTween = ColorTween(begin: Colors.transparent, end: Colors.deepOrangeAccent)
        .animate(_colorAnimationController);
    super.initState();
  }

  bool scrollListener(ScrollNotification scrollInfo) {
    bool scroll = false;
    if (scrollInfo.metrics.axis == Axis.vertical) {
      _colorAnimationController.animateTo(scrollInfo.metrics.pixels / 80);
      return scroll = true;
    }
    return scroll;
  }

  @override
  Widget build(BuildContext context) {

    final double itemHeight = MediaQueryUtil().getItemWHeight(context, 2);
    final double itemWidth = MediaQueryUtil().getItemWidth(context, 1);

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          CupertinoIcons.cart_badge_plus,
          size: 32,
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
        onPressed: () => {
          setState(() {
            counter++;
          })
        },
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: scrollListener,
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              height: itemHeight,
                              child: Image.network(
                                Constant.recipeBaseImageUrl + recipe.image,
                                fit: BoxFit.cover,
                                loadingBuilder: (BuildContext context, Widget child,
                                    ImageChunkEvent loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value: loadingProgress.expectedTotalBytes !=
                                          null
                                          ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes
                                          : null,
                                    ),
                                  );
                                },
                              ),
                            ),
                            Container(
                              width: itemWidth,
                              child: Padding(
                                padding: EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            ClipOval(
                                              child: Material(
                                                color: IconUtil().getIconBackground(
                                                    recipe.category),
                                                child: SizedBox(
                                                  width: 32,
                                                  height: 32,
                                                  child: Icon(
                                                    IconUtil()
                                                        .getIcon(recipe.category),
                                                    color: Colors.white,
                                                    size: 20,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            SizedBox(
                                              width: 300,
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '${recipe.category}',
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  Text(
                                                    recipe.title,
                                                    softWrap: true,
                                                    style: TextStyle(
                                                      fontFamily:
                                                      'TitilliumWeb-Bold',
                                                      fontSize: 24,
                                                    ),
                                                  ),
                                                  Row(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        '${recipe.servings}',
                                                        style: TextStyle(
                                                          fontFamily:
                                                          'TitilliumWeb-Bold',
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 8,
                                                      ),
                                                      Text(
                                                        'Servings',
                                                        style: TextStyle(
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 8,
                                                      ),
                                                      Text(
                                                        '${recipe.readyInMinutes}',
                                                        style: TextStyle(
                                                          fontFamily:
                                                          'TitilliumWeb-Bold',
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 8,
                                                      ),
                                                      Text(
                                                        'Minutes',
                                                        style: TextStyle(
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        Expanded(
                                          child: IconButton(
                                            icon: Icon(
                                              isChecked ? Icons.favorite : Icons.favorite_outline,
                                              size: 24,
                                              color: Colors.pink,
                                            ),
                                            onPressed: () => {
                                              setState(() {
                                                isChecked = !isChecked;
                                              }),
                                              Scaffold.of(context)
                                                  .showSnackBar(SnackBar(
                                                  content: Text(
                                                      isChecked ? 'Added to favorites' : 'Removed from favorites'
                                                  )
                                              )),
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Instructions",
                                      style: TextStyle(
                                        fontFamily: 'TitilliumWeb-Bold',
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "${recipe.instructions}",
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  AnimatedAppBar(
                    onPressed: () {

                    },
                    colorAnimationController: _colorAnimationController,
                    colorTween: _backgroundColorTween,
                    isMainView: false,
                    title: recipe.title,
                    counter: counter,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
