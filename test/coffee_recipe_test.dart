import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:test/test.dart';

void main() {
  test('Creates a valid coffee recipe', () {
    List<RecipeStep> steps = [
      RecipeStep("Add 50g of finely ground coffee", 5),
      RecipeStep("Add in 360g Water", 3),
      RecipeStep("Stir", 6),
    ];
    CoffeeRecipe testRecipe = CoffeeRecipe("Gud Coffee", 50, 360,
        "Ground Coffee", "This coffe wil keep u woke!", steps);

    expect(testRecipe.name, "Gud Coffee");
    expect(testRecipe.coffeeVolumeGrams, 50);
    expect(testRecipe.waterVolumeGrams, 360);
    expect(testRecipe.grindSize, "Ground Coffee");
    expect(testRecipe.miscDetails, "This coffe wil keep u woke!");
    expect(testRecipe.steps[0].text, "Add 50g of finely ground coffee");
    expect(testRecipe.steps[0].time, 5);
    expect(testRecipe.steps[1].text, "Add in 360g Water");
    expect(testRecipe.steps[1].time, 3);
    expect(testRecipe.steps[2].text, "Stir");
    expect(testRecipe.steps[2].time, 6);
  });

  test(
      'Creates an invalid recipe and transmutes any invalid inputs into valid ones',
      () {
    List<RecipeStep> steps2 = [];
    CoffeeRecipe testRecipe2 = CoffeeRecipe("", -1, -1, "", "", steps2);

    expect(testRecipe2.name, "Coffee");
    expect(testRecipe2.coffeeVolumeGrams, 1);
    expect(testRecipe2.waterVolumeGrams, 1);
    expect(testRecipe2.grindSize, "Medium");
    expect(testRecipe2.miscDetails, "");
    expect(testRecipe2.steps[0].text, "Sorry no instructions for this recipe!");
    expect(testRecipe2.steps[0].time, 5);
  });
}
