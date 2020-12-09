import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:homebrew_dripper/utils/gobals.dart' as globals;

CoffeeRecipe makeSweetMariasRecipe() {
  List<RecipeStep> steps = [
    RecipeStep("Add 360g water", 10),
    RecipeStep("Cover and wait", 12),
    RecipeStep("Stir", 6),
    RecipeStep("Cover and wait", 12),
    RecipeStep("Stir", 6),
  ];
  CoffeeRecipe recipe = CoffeeRecipe(
      "S w e e t   M a r i a ' s",
      22,
      360,
      "finely ground coffee",
      "The original recipe: makes one delicious cup",
      steps);
  return recipe;
}
// ignore: non_constant_identifier_names

CoffeeRecipe makePTsRecipe() {
  List<RecipeStep> steps = [
    RecipeStep("Add 50g water and wait", 15),
    RecipeStep("wait", 30),
    RecipeStep("Add 400g water", 15),
    RecipeStep("Wait", 120),
    RecipeStep("Place atop mug and drain", 60),
  ];
  CoffeeRecipe recipe = CoffeeRecipe(
      "R e c i p e   # 2",
      25,
      450,
      "Medium-coarse ground coffee",
      "The original recipe: makes one delicious cup",
      steps);
  return recipe;
}

CoffeeRecipe makeTexasCoffeeSchoolRecipe() {
  List<RecipeStep> steps = [
    RecipeStep("Add 100g water", 30),
    RecipeStep("Gentle Stir", 30),
    RecipeStep("Add 240g water", 15),
    RecipeStep("Stir then cover", 75),
    RecipeStep("Place atop mug and drain", 90),
  ];
  CoffeeRecipe recipe = CoffeeRecipe(
      "R e c i p e   # 3",
      24,
      340,
      "Coarse ground coffee",
      "The original recipe: makes one delicious cup",
      steps);
  return recipe;
}

CoffeeRecipe makeHomeGroundsRecipe() {
  List<RecipeStep> steps = [
    RecipeStep("Add 50g water and wait", 30),
    RecipeStep("Add 310g water", 15),
    RecipeStep("Cover and wait", 75),
    RecipeStep("Gently stir", 30),
    RecipeStep("Place atop mug and drain", 75),
  ];
  CoffeeRecipe recipe = CoffeeRecipe(
      "T e s t   R e c i p e",
      23,
      360,
      "Medium-coarse ground coffee",
      "The original recipe: makes one delicious cup",
      steps);
  return recipe;
}

CoffeeRecipe makeFake1Recipe() {
  List<RecipeStep> steps = [
    RecipeStep("Add 10g water", 5),
    RecipeStep("Add 350g water", 15),
    RecipeStep("Cover and wait", 15),
    RecipeStep("Gently stir", 10),
    RecipeStep("Place atop mug and drain", 15),
  ];
  CoffeeRecipe recipe = CoffeeRecipe(
      "T e s t   R e c i p e 1",
      23,
      360,
      "lightly-coarse ground coffee",
      "The original recipe: makes one delicious cup",
      steps);
  return recipe;
}

CoffeeRecipe makeFake2Recipe() {
  List<RecipeStep> steps = [
    RecipeStep("Add 240g water", 5),
    RecipeStep("Cover and wait", 10),
    RecipeStep("Gently stir", 5),
    RecipeStep("Place atop of mug and drain", 15),
  ];
  CoffeeRecipe recipe = CoffeeRecipe(
      "T e s t   R e c i p e 2",
      25,
      240,
      "Finely ground coffee",
      "The original recipe: makes one delicious cup",
      steps);
  return recipe;
}

List<CoffeeRecipe> getAllRecipes() {
  if (globals.isTesting) {
    return [
      makeSweetMariasRecipe(),
      makePTsRecipe(),
      makeFake1Recipe(),
      makeFake2Recipe()
    ];
  } else {
    return [
      makeSweetMariasRecipe(),
      makePTsRecipe(),
      makeTexasCoffeeSchoolRecipe(),
      makeHomeGroundsRecipe(),
    ];
  }
}

class CoffeeData {
  static List<CoffeeRecipe> loadRecipes() {
    return getAllRecipes();
  }
}

String toMinuteFormat(int secondsInput) {
  int minutes = secondsInput ~/ 60;
  return minutes.toString() + ":" + (secondsInput - minutes * 60).toString();
}
