import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';

CoffeeRecipe makeSweetMariasRecipe() {
  List<RecipeStep> steps = [
    RecipeStep("Add 360g water", 5),
    RecipeStep("Cover and wait", 12),
    RecipeStep("Stir", 6),
    RecipeStep("Cover and wait", 12),
    RecipeStep("Stir", 6),
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
    RecipeStep("Add 100g of water", 6),
    RecipeStep("Gentle Stir", 8),
    RecipeStep("Add 240g water", 7),
    RecipeStep("Stir then cover", 6),
    RecipeStep("Place a top mug and drain", 15),
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
    RecipeStep("Add 310g water", 6),
    RecipeStep("Cover and wait", 10),
    RecipeStep("Gently stir", 7),
    RecipeStep("Place a top mug and drain", 15),
  ];
  CoffeeRecipe recipe = CoffeeRecipe(
      "Home Grounds ",
      23,
      360,
      "Medium-coarse ground coffee",
      "The original recipe: makes one delicious cup",
      steps);
  return recipe;
}

CoffeeRecipe makePTsRecipe() {
  List<RecipeStep> steps = [
    RecipeStep("Add 50g water and wait", 10),
    RecipeStep("wait", 10),
    RecipeStep("Add 400g water", 8),
    RecipeStep("Wait", 12),
    RecipeStep("Place a top mug and drain", 12),
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

List<CoffeeRecipe> getAllRecipes() {
  return [
    makeSweetMariasRecipe(),
    makeTexasCoffeeSchoolRecipe(),
    makeHomeGroundsRecipe(),
    makePTsRecipe(),
  ];
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
