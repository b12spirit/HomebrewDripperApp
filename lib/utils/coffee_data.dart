import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:homebrew_dripper/utils/gobals.dart' as globals;

CoffeeRecipe makeSweetMariasRecipe() {
  List<RecipeStep> steps = [
    RecipeStep("Add 360g water", 30),
    RecipeStep("Cover and wait", 90),
    RecipeStep("Stir", 15),
    RecipeStep("Cover and wait", 75),
    RecipeStep("Stir", 15),
  ];
  CoffeeRecipe recipe = CoffeeRecipe(
      "Sweet Maria's",
      22,
      360,
      "finely ground coffee",
      "The original recipe: makes one delicious cup",
      steps);
  return recipe;
}

// ignore: non_constant_identifier_names
CoffeeRecipe makeTexasCoffeeSchoolRecipe() {
  List<RecipeStep> steps = [
    RecipeStep("Add 100g of water", 15),
    RecipeStep("Gentle Stir and Let it bloom", 30),
    RecipeStep("Add 240g water", 15),
    RecipeStep("Stir then cover", 90),
    RecipeStep("Gentle stir", 5),
    RecipeStep("Place a top mug and drain", 90),
  ];
  CoffeeRecipe recipe = CoffeeRecipe(
      "Texas Coffee School",
      24,
      340,
      "Coarse ground coffee",
      "The original recipe: makes one delicious cup",
      steps);
  return recipe;
}

CoffeeRecipe makeHomeGroundsRecipe() {
  List<RecipeStep> steps = [
    RecipeStep("Add 50g water and wait", 10),
    RecipeStep("Add 345g water", 15),
    RecipeStep("Break the Crust", 95),
    RecipeStep("Place atop mug and drain", 75),
  ];
  CoffeeRecipe recipe = CoffeeRecipe(
      "Home Grounds",
      23,
      360,
      "Medium-coarse ground coffee",
      "The original recipe: makes one delicious cup",
      steps);
  return recipe;
}

CoffeeRecipe makePTsRecipe() {
  List<RecipeStep> steps = [
    RecipeStep("Add 50g water", 10),
    RecipeStep("wait", 30),
    RecipeStep("Add 400g water", 15),
    RecipeStep("Wait", 65),
    RecipeStep("Place a top mug and drain", 90),
  ];
  CoffeeRecipe recipe = CoffeeRecipe(
      "PTs",
      25,
      450,
      "Medium-coarse ground coffee",
      "The original recipe: makes one delicious cup",
      steps);
  return recipe;
}

//fake recipe 1 for integration test
CoffeeRecipe makeFake1Recipe() {
  List<RecipeStep> steps = [
    RecipeStep("Add 10g water", 5),
    RecipeStep("Cover and wait", 15),
    RecipeStep("Gently stir", 7),
    RecipeStep("Place atop mug and drain", 13),
  ];
  CoffeeRecipe recipe = CoffeeRecipe(
      "Test Recipe 1",
      23,
      360,
      "lightly-coarse ground coffee",
      "The original recipe: makes one delicious cup",
      steps);
  return recipe;
}

//fake recipe 2 for integration test
CoffeeRecipe makeFake2Recipe() {
  List<RecipeStep> steps = [
    RecipeStep("Add 240g water", 5),
    RecipeStep("Cover and wait", 10),
    RecipeStep("Gently stir", 5),
    RecipeStep("Place atop of mug and drain", 15),
  ];
  CoffeeRecipe recipe = CoffeeRecipe(
      "Test Recipe 2",
      25,
      240,
      "Finely ground coffee",
      "The original recipe: makes one delicious cup",
      steps);
  return recipe;
}

// if statement used to check for whether or not we are testing,
//displays the runned recipes under else
//while if is the recipes that will be tested
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
      makeTexasCoffeeSchoolRecipe(),
      makeHomeGroundsRecipe(),
      makePTsRecipe(),
    ];
  }
}

class CoffeeData {
  static List<CoffeeRecipe> loadRecipes() {
    return getAllRecipes();
  }
}

String toMinuteFormat(int secondsInput) {
  int min = secondsInput ~/ 60;
  String smin = min.toString();
  String ssecond = (secondsInput - min * 60).toString();

  if (min <= 9) if (secondsInput % 60 <= 9)
    return "0" + smin + ":0" + ssecond;
  else
    return "0" + smin + ":" + ssecond;
  else if (secondsInput % 60 <= 9) {
    if (secondsInput % 60 == 0) return smin + ":00";

    return smin + ":0" + ssecond;
  } else
    return smin + ":" + ssecond;
}

String totalTime(CoffeeRecipe recip) {
  int totaltime = 0;

  for (RecipeStep step in recip.steps) totaltime += step.time;

  return toMinuteFormat(totaltime);
}
