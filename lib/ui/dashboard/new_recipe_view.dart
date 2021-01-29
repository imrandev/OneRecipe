import 'package:flutter/material.dart';
import 'package:onerecipe/db/DbManager.dart';
import 'package:onerecipe/model/recipe.dart';
import 'package:onerecipe/ui/dashboard/recipe_list_view.dart';

class NewRecipeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height) / 2;
    return Container(
      child: Column(
        children: [
          // new recipe header with sub header
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                "New Recipes",
                style: TextStyle(
                  fontFamily: 'TitilliumWeb-Bold',
                  fontSize: 30.0,
                ),
              ),
              Text(
                "Trending new recipes",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          // retrieve data from local json file
          // populate into list view builder
          FutureBuilder(
            future: DbManager().loadJsonFromLocalPath(context),
            builder: (BuildContext context,
                AsyncSnapshot<String> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Text('Press button to start.');
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return new Center(
                      child: new CircularProgressIndicator()
                  );
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    List<Recipe> recipes =
                    DbManager().parseJson(snapshot.data.toString());
                    return recipes.isNotEmpty
                        ? Container(
                      height: itemHeight,
                      child: RecipeListView(recipes, false),
                    )
                        : new Text("file is empty");
                  }
              }
              return null;
            },
          ),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
