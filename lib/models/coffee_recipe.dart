import 'recipe_step.dart';

class CoffeeRecipe {
  String name;
  int coffeeVolumeGrams;
  String grindSize;
  int waterVolumeGrams;
  String miscDetails;
  List<RecipeStep> steps;

  CoffeeRecipe(name, coffeeVolumeGrams, waterVolumeGrams, grindSize,
      miscDetails, steps) {
    //add any rules to reject invalid values
    //for example, reject negative gram amounts
    if (name == '' || name == "")
      this.name = "Coffee";
    else
      this.name = name;
    if (coffeeVolumeGrams <= 0)
      this.coffeeVolumeGrams = 1;
    else
      this.coffeeVolumeGrams = coffeeVolumeGrams;
    if (waterVolumeGrams <= 0)
      this.waterVolumeGrams = 1;
    else
      this.waterVolumeGrams = waterVolumeGrams;
    if (grindSize == "" || grindSize == "")
      this.grindSize = "Medium";
    else
      this.grindSize = grindSize;
    if (steps.length == 0)
      this.steps = [RecipeStep("", 0)];
    else
      this.steps = steps;
    if (miscDetails == "" || miscDetails == "")
      this.miscDetails = "";
    else
      this.miscDetails = miscDetails;
  }
}
