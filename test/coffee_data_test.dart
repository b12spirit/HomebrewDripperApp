//Test that the load recipes gives you the data you expect
//this should be dependent on the recipes that you actually want to have in the app

import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:test/test.dart';
import 'package:homebrew_dripper/utils/coffee_data.dart';

void main() {
  test('loadRecipes should give back the recipes in my app', () {
    List<CoffeeRecipe> recipes = CoffeeData.loadRecipes();

    // add whatever tests help give you confidence
    expect(recipes[0], isA<CoffeeRecipe>());
    expect(recipes[0].name, "S w e e t   M a r i a ' s");
    expect(recipes[0].steps, isA<List<RecipeStep>>());
  });
  test('loadRecipes should give back the recipes in my app', () {
    List<CoffeeRecipe> recipes = CoffeeData.loadRecipes();

    // add whatever tests help give you confidence
    expect(recipes[1], isA<CoffeeRecipe>());
    expect(recipes[1].name, "R e c i p e   # 2");
    expect(recipes[1].steps, isA<List<RecipeStep>>());
  });
  test('loadRecipes should give back the recipes in my app', () {
    List<CoffeeRecipe> recipes = CoffeeData.loadRecipes();

    // add whatever tests help give you confidence
    expect(recipes[2], isA<CoffeeRecipe>());
    expect(recipes[2].name, "R e c i p e   # 3");
    expect(recipes[2].steps, isA<List<RecipeStep>>());
  });
  test('loadRecipes should give back the recipes in my app', () {
    List<CoffeeRecipe> recipes = CoffeeData.loadRecipes();

    // add whatever tests help give you confidence
    expect(recipes[3], isA<CoffeeRecipe>());
    expect(recipes[3].name, "T e s t   R e c i p e");
    expect(recipes[3].steps, isA<List<RecipeStep>>());
  });
}
