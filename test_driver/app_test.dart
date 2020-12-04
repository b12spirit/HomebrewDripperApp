// Imports the Flutter Driver API.
import 'package:fake_async/fake_async.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Homebrew Dripper App', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.
    final coffeeRecipesTextFinder = find.byValueKey('coffee-recipes');

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('starts at 0', () async {
      // Use the `driver.getText` method to verify the counter starts at 0.
      expect(await driver.getText(coffeeRecipesTextFinder), "Coffee Recipes");
    });
    group('Happy Tests', () {
      //Sweet Maria's Recipes
      test('Given that user selects Sweet Marias recipe', () async {
        //checking for menu screen
        final coffeeTitle = find.byValueKey("Coffee_title_key");
        expect(await driver.getText(coffeeTitle), "Coffee Recipes");

        //selecting sweet marias
        final sweetMariaButton = find.byValueKey("Sweet Maria's Key");
        await driver.tap(sweetMariaButton);

        //checking for recipe
        final sweetMariaRecipe = find.byValueKey("Sweet_Maria_Recipe");
        expect(await driver.getText(sweetMariaRecipe), "Sweet Maria's");
        final sweetMariaCoffeeGrounds =
            find.byValueKey("Sweet_Maria_Coffee_Grounds");
        final sweetMariaWater = find.byValueKey("Sweet_Maria_Water");
        expect(await driver.getText(sweetMariaCoffeeGrounds),
            "22 g - finely ground coffee");
        expect(await driver.getText(sweetMariaWater), "360g - water");

        //start button
        final startButton = find.byValueKey("Start_Button");
        await driver.tap(startButton);

        final stepsList = find.byValueKey("Steps_list");
        expect(await driver.getText(stepsList), "Steps");

        //Timer test
        fakeAsync((async) {
          final currenttime = find.byValueKey("Current_time");
          expect(driver.getText(currenttime), "30");

          final currentStep = find.byValueKey("Current_step");
          expect(driver.getText(currentStep), "Add 360g water");

          async.elapse(new Duration(seconds: 30));

          expect(driver.getText(currenttime), "90");
          expect(driver.getText(currentStep), "Cover and wait");
          async.elapse(new Duration(seconds: 90));

          expect(driver.getText(currenttime), "15");
          expect(driver.getText(currentStep), "Stir");
          async.elapse(new Duration(seconds: 15));

          expect(driver.getText(currenttime), "75");
          expect(driver.getText(currentStep), "Cover and wait");
          async.elapse(new Duration(seconds: 75));

          expect(driver.getText(currenttime), "15");
          expect(driver.getText(currentStep), "Stir");
          async.elapse(new Duration(seconds: 15));
        });

        //done screen
        final doneScreen = find.byValueKey("Donetxt");
        expect(await driver.getText(doneScreen),
            "enjoy your amazing \n handmade coffee");

        final doneButton = find.byValueKey("Donebtn");
        await driver.tap(doneButton);
      });

      //Recipe 2
      test('Given that user selects PTs coffee', () async {
        //checking for menu screen
        final coffeeTitle = find.byValueKey("Coffee_title_key");
        expect(await driver.getText(coffeeTitle), "Coffee Recipes");

        //selecting sweet marias
        final pTButton = find.byValueKey("PT's Key");
        await driver.tap(pTButton);

        //checking for recipe
        final pTRecipe = find.byValueKey("PT_Recipe");
        expect(await driver.getText(pTRecipe), "PT's");
        final pTCoffeeGrounds = find.byValueKey("PT_Coffee_Grounds");
        final pTWater = find.byValueKey("PT_Water");
        expect(await driver.getText(pTCoffeeGrounds),
            "25 g - medium-coarse ground coffee");
        expect(await driver.getText(pTWater), "450g - water");

        //start button
        final startButton = find.byValueKey("Start_Button");
        await driver.tap(startButton);

        final stepsList = find.byValueKey("Steps_list");
        expect(await driver.getText(stepsList), "Steps");

        //Timer test
        fakeAsync((async) {
          final currenttime = find.byValueKey("Current_time");
          expect(driver.getText(currenttime), "15");

          final currentStep = find.byValueKey("Current_step");
          expect(driver.getText(currentStep), "Add 50g water");

          async.elapse(new Duration(seconds: 15));

          expect(driver.getText(currenttime), "30");
          expect(driver.getText(currentStep), "let sit");
          async.elapse(new Duration(seconds: 30));

          expect(driver.getText(currenttime), "30");
          expect(driver.getText(currentStep), "Add 450g water");
          async.elapse(new Duration(seconds: 30));

          expect(driver.getText(currenttime), "120");
          expect(driver.getText(currentStep), "let sit");
          async.elapse(new Duration(seconds: 120));

          expect(driver.getText(currenttime), "210");
          expect(driver.getText(currentStep), "Drain brewer");
          async.elapse(new Duration(seconds: 210));
        });

        //done screen
        final doneScreen = find.byValueKey("Donetxt");
        expect(await driver.getText(doneScreen),
            "enjoy your amazing \n handmade coffee");

        final doneButton = find.byValueKey("Donebtn");
        await driver.tap(doneButton);
      });

      //Recipe 3
      test('Given that user selects Texas Coffee school', () async {
        //checking for menu screen
        final coffeeTitle = find.byValueKey("Coffee_title_key");
        expect(await driver.getText(coffeeTitle), "Coffee Recipes");

        //selecting Texas Coffee School
        final texasCoffeeButton = find.byValueKey("Texas Coffee school's Key");
        await driver.tap(texasCoffeeButton);

        //checking for recipe
        final texasCoffeeRecipe = find.byValueKey("Texas_Coffee_Recipe");
        expect(
            await driver.getText(texasCoffeeRecipe), "Texas Coffee School's");
        final texasCoffeeGrounds =
            find.byValueKey("texas_school_Coffee_Grounds");
        final texascoffeeWater = find.byValueKey("Texas_Coffee_Water");
        expect(await driver.getText(texasCoffeeGrounds),
            "24 g - coarse ground coffee");
        expect(await driver.getText(texascoffeeWater), "340g - water");

        //start button
        final startButton = find.byValueKey("Start_Button");
        await driver.tap(startButton);

        final stepsList = find.byValueKey("Steps_list");
        expect(await driver.getText(stepsList), "Steps");

        //Timer test
        fakeAsync((async) {
          final currenttime = find.byValueKey("Current_time");
          expect(driver.getText(currenttime), "30");

          final currentStep = find.byValueKey("Current_step");
          expect(driver.getText(currentStep), "Add 100g water");

          async.elapse(new Duration(seconds: 30));

          expect(driver.getText(currenttime), "30");
          expect(driver.getText(currentStep), "Stir");
          async.elapse(new Duration(seconds: 30));

          expect(driver.getText(currenttime), "30");
          expect(driver.getText(currentStep), "Add 340g water and Stir");
          async.elapse(new Duration(seconds: 30));

          expect(driver.getText(currenttime), "60");
          expect(driver.getText(currentStep), "Cover and wait");
          async.elapse(new Duration(seconds: 60));

          expect(driver.getText(currenttime), "90");
          expect(driver.getText(currentStep), "Drain");
          async.elapse(new Duration(seconds: 90));

          expect(driver.getText(currenttime), "30");
          expect(driver.getText(currentStep), "stri");
          async.elapse(new Duration(seconds: 30));
        });

        //done screen
        final doneScreen = find.byValueKey("Donetxt");
        expect(await driver.getText(doneScreen),
            "enjoy your amazing \n handmade coffee");

        final doneButton = find.byValueKey("Donebtn");
        await driver.tap(doneButton);
      });

      //Recipe 4
      test('Given that the user selects Homegrounds recipe', () async {
        //checking for menu screen
        final coffeeTitle = find.byValueKey("Coffee_title_key");
        expect(await driver.getText(coffeeTitle), "Coffee Recipes");

        //selecting homegrounds
        final homegroundButton = find.byValueKey("Homeground's Key");
        await driver.tap(homegroundButton);

        //checking for recipe
        final homegroundRecipe = find.byValueKey("homeground_Recipe");
        expect(await driver.getText(homegroundRecipe), "Homeground's");
        final homegroundCoffeeGrounds =
            find.byValueKey("homeground_Coffee_Grounds");
        final homegroundWater = find.byValueKey("homeground_Water");
        expect(await driver.getText(homegroundCoffeeGrounds),
            "23 g - freshly roasted medium-coarse ground coffee");
        expect(await driver.getText(homegroundWater), "345g - water");

        //start button
        final startButton = find.byValueKey("Start_Button");
        await driver.tap(startButton);

        final stepsList = find.byValueKey("Steps_list");
        expect(await driver.getText(stepsList), "Steps");

        //Timer test
        fakeAsync((async) {
          final currenttime = find.byValueKey("Current_time");
          expect(driver.getText(currenttime), "30");

          final currentStep = find.byValueKey("Current_step");
          expect(driver.getText(currentStep), "Add 50g water");

          async.elapse(new Duration(seconds: 30));

          expect(driver.getText(currenttime), "15");
          expect(driver.getText(currentStep), "add 345g water");
          async.elapse(new Duration(seconds: 15));

          expect(driver.getText(currenttime), "75");
          expect(driver.getText(currentStep), "Cover and wait");
          async.elapse(new Duration(seconds: 75));

          expect(driver.getText(currenttime), "15");
          expect(driver.getText(currentStep), "Stir");
          async.elapse(new Duration(seconds: 15));

          expect(driver.getText(currenttime), "90");
          expect(driver.getText(currentStep), "Drain brewer");
          async.elapse(new Duration(seconds: 90));
        });

        //done screen
        final doneScreen = find.byValueKey("Donetxt");
        expect(await driver.getText(doneScreen),
            "enjoy your amazing \n handmade coffee");

        final doneButton = find.byValueKey("Donebtn");
        await driver.tap(doneButton);
      });
    });
    //Resources
    test('Given that the user selects an item under resources', () async {
      //Coffee
      final coffeeResourceTxtKey = find.byValueKey("Coffee_Resource_Key");
      expect(await driver.getText(coffeeResourceTxtKey), "Coffee");
      final coffeeResourceUrl = find.byValueKey("Coffee_Resource_Url");
      expect(await driver.getText(coffeeResourceUrl),
          "https://www.amazon.com/s?k=Coffee");

      //Grinders
      final grinderResourceTxtKey = find.byValueKey("Resource_Grinders_Key");
      expect(await driver.getText(grinderResourceTxtKey), "Grinders");
      final grinderResourceUrl = find.byValueKey("Grinder_Resource_Url");
      expect(await driver.getText(grinderResourceUrl),
          "https://www.amazon.com/s?k=Coffee+Grinders");

      //Kettles
      final kettleResourceTxtKey = find.byValueKey("Resource_Kettles_Key");
      expect(await driver.getText(kettleResourceTxtKey), "Grinders");
      final kettleResourceUrl = find.byValueKey("Kettle_Resource_Url");
      expect(await driver.getText(kettleResourceUrl),
          "https://www.amazon.com/s?k=Coffe+Kettles");

      //homebrew dripper
      final homebrewResourceTxtKey =
          find.byValueKey("Resource_Homebrew_Dripper_key");
      expect(await driver.getText(homebrewResourceTxtKey), "Homebrew Dripper");
      final homebrewResourceUrl = find.byValueKey("Homebrew_Resource_Url");
      expect(await driver.getText(homebrewResourceUrl),
          "https://www.amazon.com/s?k=Coffee+Homebrew+Dripper");
    });
  });
}
