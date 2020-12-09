import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:test/test.dart';

void main() {
  test('Creates a valid recipe step', () {
    //Creates a recipe with valid values
    RecipeStep testMe = RecipeStep("Testing values", 10);
    //This for the response for valid values
    expect(testMe.text, ("Testing values"));
    expect(testMe.time, 10);
  });

  test('This wil be the default values in case of invalid values comming in',
      () {
    //Creates a recipe with invalid values
    RecipeStep testMe = RecipeStep("", -1);
    //This for the response incase of invalid values
    expect(testMe.text, "Sorry no instructions for this recipe!");
    expect(testMe.time, 5);
  });
}
