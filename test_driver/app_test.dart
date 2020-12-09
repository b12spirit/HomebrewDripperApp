// Imports the Flutter Driver API.
import 'dart:async';

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

    group('Happy Tests', () {
      test('Begin on Selection Screen', () async {
        await driver.waitFor(find.text("Coffee Recipes"));
      });

      //Sweet Maria's Recipes
      test('Given that user selects Sweet Marias recipe', () async {
        //checking for menu screen
        final sweetMaria = find.byValueKey("Sweet Maria's Key");
        await driver.tap(sweetMaria);
        await driver.waitFor(find.text("S w e e t   M a r i a ' s"));
      });

      test('Back Button Testing', () async {
        final backBtn = find.byValueKey('Back_btn');
        await driver.tap(backBtn);

        await driver.waitFor(find.text("Coffee Recipes"));
      });
    });

    group('Testing Timer', () {
      group('Fake Recipe 1 test', () {
        final time = find.byValueKey("Current_time");
        final step = find.byValueKey("Current_step");

        test("Step 1", () async {
          final sweetMaria = find.byValueKey("FRecipe1 Key");
          await driver.tap(sweetMaria);

          final startBtn = find.byValueKey('Start_Button');
          await driver.tap(startBtn);
          await Future.delayed(const Duration(seconds: 5), () {});
          if (await driver.getText(time) == "1") {
          } else
            expect(await driver.getText(time), "0");
          expect(await driver.getText(step), "Add 10g water");
        });
        test('Step 2', () async {
          await Future.delayed(const Duration(seconds: 15), () {});
          if (await driver.getText(time) == "1") {
          } else
            expect(await driver.getText(time), "0");
          expect(await driver.getText(step), "Add 350g water");
        });
        test('Step 3', () async {
          await Future.delayed(const Duration(seconds: 17), () {});
          if (await driver.getText(time) == "1") {
          } else
            expect(await driver.getText(time), "0");
          expect(await driver.getText(step), "Cover and wait");
        });
        test('Step 4', () async {
          await Future.delayed(const Duration(seconds: 10), () {});
          if (await driver.getText(time) == "1") {
          } else
            expect(await driver.getText(time), "0");
          expect(await driver.getText(step), "Gently stir");
        });
        test('Step 5', () async {
          await Future.delayed(const Duration(seconds: 17), () {});
          if (await driver.getText(time) == "1") {
          } else
            expect(await driver.getText(time), "0");
          expect(await driver.getText(step), "Place atop mug and drain");
        });
        test('Step 6', () async {
          await Future.delayed(const Duration(seconds: 3), () {});
          await driver.waitFor(find.text('''enjoy your amazing 
  handmade coffee'''));

          final done = find.byValueKey('Donebtn');
          await driver.tap(done);
        });
      });

      group("Fake Recipe 2 test", () {
        final time = find.byValueKey("Current_time");
        final step = find.byValueKey("Current_step");

        test("Step 1", () async {
          final ptBtn = find.byValueKey("FRecipe2 Key");
          await driver.tap(ptBtn);

          final startBtn = find.byValueKey('Start_Button');
          await driver.tap(startBtn);
          await Future.delayed(const Duration(seconds: 5), () {});
          if (await driver.getText(time) == "1") {
          } else
            expect(await driver.getText(time), "0");
          expect(await driver.getText(step), "Add 240g water");
        });
        test('Step 2', () async {
          await Future.delayed(const Duration(seconds: 11), () {});
          if (await driver.getText(time) == "1") {
          } else
            expect(await driver.getText(time), "0");
          expect(await driver.getText(step), "Cover and wait");
        });
        test('Step 3', () async {
          await Future.delayed(const Duration(seconds: 6), () {});
          if (await driver.getText(time) == "1") {
          } else
            expect(await driver.getText(time), "0");
          expect(await driver.getText(step), "Gently stir");
        });
        test('Step 4', () async {
          await Future.delayed(const Duration(seconds: 15), () {});
          if (await driver.getText(time) == "1") {
          } else
            expect(await driver.getText(time), "0");
          expect(await driver.getText(step), "Place atop of mug and drain");
        });
        test('Step 5', () async {
          await Future.delayed(const Duration(seconds: 3), () {});
          await driver.waitFor(find.text('''enjoy your amazing 
  handmade coffee'''));

          final done = find.byValueKey('Donebtn');
          await driver.tap(done);
        });
      });
    });

    group('Testing Resources', () {
      test("Press Coffee Resource", () async {
        final coffeeResource = find.byValueKey("Coffee Resource");
        expect(await driver.getText(coffeeResource), "C o f f e e");
      });

      test("Press Grinders Resource", () async {
        final grinderResource = find.byValueKey("Resource_Grinders_key");
        expect(await driver.getText(grinderResource), "G r i n d e r s");
      });

      test("Press Kettle Resource", () async {
        final kettleResource = find.byValueKey("Resource_Kettles_key");
        expect(await driver.getText(kettleResource), "K e t t l e s");
      });

      test("Press Homebrew Dripper Resource", () async {
        final homebrewResource =
            find.byValueKey("Resource_Homebrew_Dripper_key");
        expect(await driver.getText(homebrewResource),
            "H o m e b r e w    D r i p p e r");
      });
    });
  });
}
