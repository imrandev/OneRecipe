import 'package:flutter/material.dart';
import 'package:onerecipe/db/DbManager.dart';
import 'package:onerecipe/model/recipe.dart';
import 'package:onerecipe/ui/dashboard/recipe_list_view.dart';
import 'package:onerecipe/ui/widgets/round_button.dart';

class CategoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // category header with sub header
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                "Categories",
                style: TextStyle(
                  fontFamily: 'TitilliumWeb-Bold',
                  fontSize: 30.0,
                ),
              ),
              Text(
                "Over 700+ healthy various collection of recipes",
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
          // category horizontal list
          SizedBox(
            height: 100,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  RoundButton(
                    iconData: Icons.food_bank,
                    backgroundColor: Colors.pink,
                    iconColor: Colors.white,
                    onTap: () => {},
                    title: "All",
                    textColor: Colors.black,
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  RoundButton(
                    iconData: Icons.local_pizza,
                    backgroundColor: Colors.white,
                    iconColor: Colors.grey,
                    onTap: () => {},
                    title: "Pizza",
                    textColor: Colors.grey,
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  RoundButton(
                    iconData: Icons.local_drink,
                    backgroundColor: Colors.white,
                    iconColor: Colors.grey,
                    onTap: () => {},
                    title: "Drinks",
                    textColor: Colors.grey,
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  RoundButton(
                    iconData: Icons.free_breakfast,
                    backgroundColor: Colors.white,
                    iconColor: Colors.grey,
                    onTap: () => {},
                    title: "Coffee",
                    textColor: Colors.grey,
                  ),
                ],
              ),
            ),
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
                        ? RecipeListView(recipes, true)
                        : new Text("file is empty");
                  }
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
