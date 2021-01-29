
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:onerecipe/model/recipe.dart';

class DbManager {

  static final DbManager _instance = DbManager._internal();

  factory DbManager() {
    return _instance;
  }

  DbManager._internal();

  // load local json file from assets
  Future<String> loadJsonFromLocalPath(BuildContext context){
    return DefaultAssetBundle.of(context).loadString('assets/recipe.json');
  }

  // parse json response data from a local json file
  List<Recipe> parseJson(String response) {
    if (response == null) {
      return [];
    }
    final parsed =
    json.decode(response.toString()).cast<Map<String, dynamic>>();
    return parsed.map<Recipe>((json) => new Recipe.fromJson(json)).toList();
  }
}