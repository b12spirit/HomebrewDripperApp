// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'package:fake_async/fake_async.dart';

//TIMING VALUES ARE SUPER WEIRD FOR STEPS 1 OF EACH BRANCH; outcomme SHOULD be 0.  If not, run tests again.  Seriously.
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

    group('Happy Paths', () {
      test('Begin on Selection Screen', () async {
        await driver.waitFor(find.text("Coffee Recipes"));
      });

      test('Clicking on Sweet Marias Advances to the Steps Screen', () async {
        final sweetMaria = find.byValueKey("Sweet Maria's Key");
        await driver.tap(sweetMaria);
        await driver.waitFor(find.text("S w e e t   M a r i a ' s"));
      });

      test('Back Button Testing', () async {
        final backBtn = find.byValueKey('Back_btn');
        await driver.tap(backBtn);

        await driver.waitFor(find.text("Coffee Recipes"));
      });
      test('Clicking on PTs recipe to the Steps Screen', () async {
        final pT = find.byValueKey("PT's Key");
        await driver.tap(pT);
        await driver.waitFor(find.text("PTs"));
      });

      test('Back Button Testing', () async {
        final backBtn = find.byValueKey('Back_btn');
        await driver.tap(backBtn);

        await driver.waitFor(find.text("Coffee Recipes"));
      });

      //the test will cause us to go back to selection screen
      //it throws off the rest of the other tests
      //would probably be better off as a base for sad paths

      /* test('Back Button During Steps Screen', () async {
        final sweetMaria = find.byValueKey("Sweet Maria's");
        await driver.tap(sweetMaria);

        final startBtn = find.byValueKey('start');
        await driver.tap(startBtn);

        final backBtn = find.byValueKey('back_to_detail');
        await driver.tap(backBtn);

        final backBtn2 = find.byValueKey('back_to_selection');
        await driver.tap(backBtn2);

        await driver.waitFor(find.text("Coffee Recipes"));
      });
    }); */

      group('Timer Testing', () {
        group('Fake Recipe 1 test', () {
          final time = find.byValueKey('current_time');
          final step = find.byValueKey('current_step');

          test('Step 1', () async {
            final fakeRecipe = find.byValueKey("FRecipe1 Key");
            await driver.tap(fakeRecipe);

            final startBtn = find.byValueKey('start');
            await driver.tap(startBtn);
            await Future.delayed(const Duration(seconds: 5), () {});
            if (await driver.getText(time) == "1") {
            } else
              expect(await driver.getText(time), "0");
            expect(await driver.getText(step), "Add 10g water");
          });
          test('Step 2', () async {
            await Future.delayed(const Duration(seconds: 16), () {});
            if (await driver.getText(time) == "1") {
            } else
              expect(await driver.getText(time), "0");
            expect(await driver.getText(step), "Cover and wait");
          });
          test('Step 3', () async {
            await Future.delayed(const Duration(seconds: 8), () {});
            if (await driver.getText(time) == "1") {
            } else
              expect(await driver.getText(time), "0");
            expect(await driver.getText(step), "Gently stir");
          });
          test('Step 4', () async {
            await Future.delayed(const Duration(seconds: 14), () {});
            if (await driver.getText(time) == "1") {
            } else
              expect(await driver.getText(time), "0");
            expect(await driver.getText(step), "Place atop mug and drain");
          });
          test('Step 5', () async {
            await Future.delayed(const Duration(seconds: 3), () {});
            await driver.waitFor(find.text('''enjoy your amazing 
  handmade coffee'''));

            final done = find.byValueKey('Donebtn');
            await driver.tap(done);
          });
        });
        group('Fake Recipe 2 test', () {
          final time = find.byValueKey('current_time');
          final step = find.byValueKey('current_step');

          test('Step 1', () async {
            final fakeRecipe2 = find.byValueKey("FRecipe2 Key");
            await driver.tap(fakeRecipe2);

            final startBtn = find.byValueKey('start');
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
            await Future.delayed(const Duration(seconds: 16), () {});
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
    });
  });
}
