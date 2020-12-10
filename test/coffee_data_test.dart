//Test that the load recipes gives you the data you expect
//this should be dependent on the recipes that you actually want to have in the app

import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:test/test.dart';
import 'package:homebrew_dripper/utils/coffee_data.dart';

void main() {
  test('loadRecipes should give back the first recipe', () {
    List<CoffeeRecipe> recipes = CoffeeData.loadRecipes();

    // add whatever tests help give you confidence
    expect(recipes[0], isA<CoffeeRecipe>());
    expect(recipes[0].name, "Sweet Maria's");
    expect(recipes[0].steps, isA<List<RecipeStep>>());
    expect(recipes[0].steps[0].text, "Add 360g water");
    expect(recipes[0].steps[0].time, 5);
  });
  test('loadRecipes should give back the second recipe', () {
    List<CoffeeRecipe> recipes = CoffeeData.loadRecipes();

    // add whatever tests help give you confidence
    expect(recipes[1], isA<CoffeeRecipe>());
    expect(recipes[1].name, "Texas Coffee School");
    expect(recipes[1].steps, isA<List<RecipeStep>>());
    expect(recipes[1].steps[0].text, "Add 100g of water");
    expect(recipes[1].steps[0].time, 6);
  });
  test('loadRecipes should give back the third recipe', () {
    List<CoffeeRecipe> recipes = CoffeeData.loadRecipes();

    // add whatever tests help give you confidence
    expect(recipes[2], isA<CoffeeRecipe>());
    expect(recipes[2].name, "Home Grounds");
    expect(recipes[2].steps, isA<List<RecipeStep>>());
    expect(recipes[2].steps[0].text, "Add 50g water and wait");
    expect(recipes[2].steps[0].time, 10);
  });
  test('loadRecipes should give back the fourth recipe', () {
    List<CoffeeRecipe> recipes = CoffeeData.loadRecipes();

    // add whatever tests help give you confidence
    expect(recipes[3], isA<CoffeeRecipe>());
    expect(recipes[3].name, "PTs");
    expect(recipes[3].steps, isA<List<RecipeStep>>());
    expect(recipes[3].steps[0].text, "Add 50g water and wait");
    expect(recipes[3].steps[0].time, 10);
  });
}
