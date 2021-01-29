import 'package:flutter/material.dart';
import 'package:onerecipe/model/recipe.dart';
import 'package:onerecipe/ui/dashboard/item_recipe_view.dart';
import 'package:onerecipe/utils/MediaQueryUtil.dart';

class RecipeListView extends StatelessWidget {
  final List<Recipe> recipeList;
  final bool isGrid;

  RecipeListView(this.recipeList, this.isGrid);

  @override
  Widget build(BuildContext context) {

    final double itemHeight = MediaQueryUtil().getItemWHeight(context, 2);
    final double itemWidth = MediaQueryUtil().getItemWidth(context, 2);

    return isGrid
        ? new GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: (itemWidth / itemHeight)),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: recipeList == null ? 0 : recipeList.length,
            itemBuilder: (BuildContext context, int index) {
              return ItemRecipeView(recipeList[index]);
            },
          )
        : new ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: recipeList == null ? 0 : recipeList.length,
            itemBuilder: (BuildContext context, int index) {
              return ItemRecipeView(recipeList[index]);
            },
          );
  }
}
