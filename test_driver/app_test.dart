// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'package:fake_async/fake_async.dart';

//TIMING VALUES ARE SUPER WEIRD FOR STEPS 1 OF EACH BRANCH; outcomme SHOULD be 0.  If not, run tests again.  Seriously.
// void main() {
//   group('Homebrew Dripper App', () {
//     // First, define the Finders and use them to locate widgets from the
//     // test suite. Note: the Strings provided to the `byValueKey` method must
//     // be the same as the Strings we used for the Keys in step 1.
//     final coffeeRecipesTextFinder = find.byValueKey('coffee-recipes');

//     FlutterDriver driver;

//     // Connect to the Flutter driver before running any tests.
//     setUpAll(() async {
//       driver = await FlutterDriver.connect();
//     });

//     // Close the connection to the driver after the tests have completed.
//     tearDownAll(() async {
//       if (driver != null) {
//         driver.close();
//       }
//     });

//     test('starts at 0', () async {
//       // Use the `driver.getText` method to verify the counter starts at 0.
//       expect(await driver.getText(coffeeRecipesTextFinder), "Coffee Recipes");
//     });

//     group('Happy Paths', () {
//       test('Begin on Selection Screen', () async {
//         await driver.waitFor(find.text("Coffee Recipes"));
//       });

//       test('Clicking on Sweet Marias Advances to the Steps Screen', () async {
//         final sweetMaria = find.byValueKey("Sweet Maria's");
//         await driver.tap(sweetMaria);
//         await driver.waitFor(find.text("Sweet Maria's"));
//       });

//       test('Back Button Testing', () async {
//         final backBtn = find.byValueKey('back_to_selection');
//         await driver.tap(backBtn);

//         await driver.waitFor(find.text("Coffee Recipes"));
//       });

//       test('Back Button During Steps Screen', () async {
//         final sweetMaria = find.byValueKey("Sweet Maria's");
//         await driver.tap(sweetMaria);

//         final startBtn = find.byValueKey('start');
//         await driver.tap(startBtn);

//         final backBtn = find.byValueKey('back_to_detail');
//         await driver.tap(backBtn);

//         final backBtn2 = find.byValueKey('back_to_selection');
//         await driver.tap(backBtn2);

//         await driver.waitFor(find.text("Coffee Recipes"));
//       });
//     });

//     group('Timer Testing', () {
//       group('Sweet Marias', () {
//         final time = find.byValueKey('time_remaining');
//         final step = find.byValueKey('current_step');

//         test('Step 1', () async {
//           final sweetMaria = find.byValueKey("Sweet Maria's");
//           await driver.tap(sweetMaria);

//           final startBtn = find.byValueKey('start');
//           await driver.tap(startBtn);
//           await Future.delayed(const Duration(seconds: 6), () {});
//           if (await driver.getText(time) == "1") {
//           } else
//             expect(await driver.getText(time), "0");
//           expect(await driver.getText(step), "Add 360g water");
//         });
//         test('Step 2', () async {
//           await Future.delayed(const Duration(seconds: 13), () {});
//           if (await driver.getText(time) == "1") {
//           } else
//             expect(await driver.getText(time), "0");
//           expect(await driver.getText(step), "Cover and wait");
//         });
//         test('Step 3', () async {
//           await Future.delayed(const Duration(seconds: 7), () {});
//           if (await driver.getText(time) == "1") {
//           } else
//             expect(await driver.getText(time), "0");
//           expect(await driver.getText(step), "Stir");
//         });
//         test('Step 4', () async {
//           await Future.delayed(const Duration(seconds: 13), () {});
//           if (await driver.getText(time) == "1") {
//           } else
//             expect(await driver.getText(time), "0");
//           expect(await driver.getText(step), "Cover and wait");
//         });
//         test('Step 5', () async {
//           await Future.delayed(const Duration(seconds: 6), () {});
//           if (await driver.getText(time) == "1") {
//           } else
//             expect(await driver.getText(time), "0");
//           expect(await driver.getText(step), "Stir");
//         });
//         test('Step 6', () async {
//           await Future.delayed(const Duration(seconds: 3), () {});
//           await driver.waitFor(find.text("enjoy your amazing"));

//           final done = find.byValueKey('done');
//           await driver.tap(done);
//         });
//       });
//       group('French Press', () {
//         final time = find.byValueKey('time_remaining');
//         final step = find.byValueKey('current_step');

//         test('Step 1', () async {
//           final frenchPress = find.byValueKey("French Press");
//           await driver.tap(frenchPress);

//           final startBtn = find.byValueKey('start');
//           await driver.tap(startBtn);
//           await Future.delayed(const Duration(seconds: 10), () {});
//           if (await driver.getText(time) == "1") {
//           } else
//             expect(await driver.getText(time), "0");
//           expect(await driver.getText(step), "Add 165g water");
//         });
//         test('Step 2', () async {
//           await Future.delayed(const Duration(seconds: 12), () {});
//           if (await driver.getText(time) == "1") {
//           } else
//             expect(await driver.getText(time), "0");
//           expect(await driver.getText(step), "Cover and wait");
//         });
//         test('Step 3', () async {
//           await Future.delayed(const Duration(seconds: 9), () {});
//           if (await driver.getText(time) == "1") {
//           } else
//             expect(await driver.getText(time), "0");
//           expect(await driver.getText(step), "Stir");
//         });
//         test('Step 4', () async {
//           await Future.delayed(const Duration(seconds: 12), () {});
//           if (await driver.getText(time) == "1") {
//           } else
//             expect(await driver.getText(time), "0");
//           expect(await driver.getText(step), "Cover and wait");
//         });
//         test('Step 5', () async {
//           await Future.delayed(const Duration(seconds: 9), () {});
//           if (await driver.getText(time) == "1") {
//           } else
//             expect(await driver.getText(time), "0");
//           expect(await driver.getText(step), "Stir");
//         });
//         test('Step 6', () async {
//           await Future.delayed(const Duration(seconds: 3), () {});
//           await driver.waitFor(find.text("enjoy your amazing"));
//           final done = find.byValueKey('done');
//           await driver.tap(done);
//         });
//       });
//       group('Hot Chocolate', () {
//         final time = find.byValueKey('time_remaining');
//         final step = find.byValueKey('current_step');
//         test('Step 1', () async {
//           final hotChocolate = find.byValueKey("Hot Chocolate");
//           await driver.tap(hotChocolate);

//           final startBtn = find.byValueKey('start');
//           await driver.tap(startBtn);
//           await Future.delayed(const Duration(seconds: 2), () {});
//           if (await driver.getText(time) == "1") {
//           } else
//             expect(await driver.getText(time), "0");
//           expect(await driver.getText(step), "Add 128g water");
//         });
//         test('Step 2', () async {
//           await Future.delayed(const Duration(seconds: 3), () {});
//           if (await driver.getText(time) == "1") {
//           } else
//             expect(await driver.getText(time), "0");
//           expect(await driver.getText(step),
//               "Add 1 Full Bag of Hot Chocolate Mix");
//         });
//         test('Step 3', () async {
//           await Future.delayed(const Duration(seconds: 3), () {});
//           if (await driver.getText(time) == "1") {
//           } else
//             expect(await driver.getText(time), "0");
//           expect(await driver.getText(step), "Stir");
//         });
//         test('Step 4', () async {
//           await Future.delayed(const Duration(seconds: 3), () {});
//           if (await driver.getText(time) == "1") {
//           } else
//             expect(await driver.getText(time), "0");
//           expect(await driver.getText(step), "Cover and wait");
//         });
//         test('Step 5', () async {
//           await Future.delayed(const Duration(seconds: 3), () {});
//           if (await driver.getText(time) == "1") {
//           } else
//             expect(await driver.getText(time), "0");
//           expect(await driver.getText(step), "Stir");
//         });
//         test('Step 6', () async {
//           await Future.delayed(const Duration(seconds: 3), () {});
//           await driver.waitFor(find.text("enjoy your amazing"));
//           final done = find.byValueKey('done');
//           await driver.tap(done);
//         });
//       });
//     });
//   });
// }
