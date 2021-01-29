import 'package:flutter/material.dart';
import 'package:onerecipe/model/recipe.dart';
import 'package:onerecipe/route/ScreenNavigator.dart';
import 'file:///E:/Mobile/Android/Flutter/onerecipe/lib/ui/details/recipe_details_view.dart';
import 'package:onerecipe/utils/IconUtil.dart';
import 'package:onerecipe/utils/constant.dart';

class RecipesView extends StatelessWidget {
  final List<Recipe> recipeList;
  final bool isGrid;

  RecipesView(this.recipeList, this.isGrid);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height) / 2;
    final double itemWidth = size.width / 2;

    return isGrid
        ? new GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: (itemWidth / itemHeight)),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: recipeList == null ? 0 : recipeList.length,
            itemBuilder: (BuildContext context, int index) {
              return new Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 2,
                shadowColor: Color(0xffe0e0e0),
                child: InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () => {
                    ScreenNavigator().navigatePush(
                        context, RecipeDetailsView(recipeList[index]))
                  },
                  child: Container(
                    width: itemWidth,
                    height: itemHeight,
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Image.network(
                                Constant.recipeBaseImageUrl +
                                    recipeList[index].image,
                                width: itemWidth,
                                fit: BoxFit.cover,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value: loadingProgress
                                                  .expectedTotalBytes !=
                                              null
                                          ? loadingProgress
                                                  .cumulativeBytesLoaded /
                                              loadingProgress.expectedTotalBytes
                                          : null,
                                    ),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    recipeList[index].category,
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    recipeList[index].title,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontFamily: 'TitilliumWeb-Bold',
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.access_time,
                                        size: 14,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        '${recipeList[index].readyInMinutes} min',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Icons.favorite_outline,
                                    size: 24,
                                    color: Colors.pink,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipOval(
                            child: Material(
                              color: IconUtil().getIconBackground(
                                  recipeList[index].category),
                              child: SizedBox(
                                width: 32,
                                height: 32,
                                child: Icon(
                                  IconUtil()
                                      .getIcon(recipeList[index].category),
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          )
        : new ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: recipeList == null ? 0 : recipeList.length,
            itemBuilder: (BuildContext context, int index) {
              return new Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 2,
                shadowColor: Color(0xffe0e0e0),
                child: InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () => {
                    ScreenNavigator().navigatePush(
                        context, RecipeDetailsView(recipeList[index]))
                  },
                  child: Container(
                    width: itemWidth,
                    height: itemHeight,
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Image.network(
                                Constant.recipeBaseImageUrl +
                                    recipeList[index].image,
                                width: itemWidth,
                                fit: BoxFit.cover,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value: loadingProgress
                                                  .expectedTotalBytes !=
                                              null
                                          ? loadingProgress
                                                  .cumulativeBytesLoaded /
                                              loadingProgress.expectedTotalBytes
                                          : null,
                                    ),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    recipeList[index].category,
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    recipeList[index].title,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontFamily: 'TitilliumWeb-Bold',
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.access_time,
                                        size: 14,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        '${recipeList[index].readyInMinutes} min',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Icons.favorite_outline,
                                    size: 24,
                                    color: Colors.pink,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipOval(
                            child: Material(
                              color: IconUtil().getIconBackground(
                                  recipeList[index].category),
                              child: SizedBox(
                                width: 32,
                                height: 32,
                                child: Icon(
                                  IconUtil()
                                      .getIcon(recipeList[index].category),
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
  }
}
