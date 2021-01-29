import 'package:flutter/material.dart';
import 'package:onerecipe/model/recipe.dart';
import 'package:onerecipe/route/ScreenNavigator.dart';
import 'package:onerecipe/ui/details/recipe_details_view.dart';
import 'package:onerecipe/utils/IconUtil.dart';
import 'package:onerecipe/utils/Constant.dart';
import 'package:onerecipe/utils/MediaQueryUtil.dart';

class ItemRecipeView extends StatelessWidget {

  final Recipe item;

  ItemRecipeView(this.item);

  @override
  Widget build(BuildContext context) {

    final double itemHeight = MediaQueryUtil().getItemWHeight(context, 2);
    final double itemWidth = MediaQueryUtil().getItemWidth(context, 2);

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
              context, RecipeDetailsView(item))
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
                      Constant.recipeBaseImageUrl + item.image,
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
                          item.category,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          item.title,
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
                              '${item.readyInMinutes} min',
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
                        item.category),
                    child: SizedBox(
                      width: 32,
                      height: 32,
                      child: Icon(
                        IconUtil()
                            .getIcon(item.category),
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
  }
}
