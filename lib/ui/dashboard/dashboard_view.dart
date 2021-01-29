import 'package:flutter/material.dart';
import 'package:onerecipe/ui/dashboard/category_view.dart';
import 'package:onerecipe/ui/dashboard/new_recipe_view.dart';

class DashboardView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                // trending new recipe view
                NewRecipeView(),
                // category view
                CategoryView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
