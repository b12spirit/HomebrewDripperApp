import 'package:flutter/material.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:homebrew_dripper/screens/recipe_steps_screen.dart';
import 'package:homebrew_dripper/utils/coffee_data.dart';

// ignore: must_be_immutable
class RecipeDetailScreen extends StatelessWidget {
  CoffeeRecipe recipe;

  RecipeDetailScreen(this.recipe);
  List<RecipeStep> allsteps;

  @override
  Widget build(BuildContext context) {
    allsteps = recipe.steps;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xffE5E5E5),
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xff4C748B),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      backgroundColor: Color(0xffE5E5E5),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // This is the container for the recipe selected
          Container(
              decoration: BoxDecoration(
                color: Color(0xffE5E5E5),
                border: Border.all(
                  color: Color(0xff4C748B),
                  width: 2.5,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: RecipeTop(recipe)),
          Container(
              height: 40,
              child: ListTile(
                  title: Text(
                    "Steps",
                    style: TextStyle(
                        letterSpacing: 1.5,
                        fontFamily: "Kollektif",
                        fontSize: 14,
                        color: Color(0xff4C748B)),
                  ),
                  trailing: Text("Total: " + totalTime(recipe),
                      style: TextStyle(
                          fontFamily: "Kollektif",
                          fontSize: 14,
                          letterSpacing: 1.5,
                          color: Color(0xff4C748B))))),
          RecipeSteptab(recipe),

          // This is the container for the start button
          Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                color: Color(0xffE2E2E2),
                border: Border.all(
                  color: Color(0xffE2E2E2),
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: new RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                color: Color(0xff4C748B),
                child: new Text(
                  "Start",
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      letterSpacing: 1.5,
                      fontSize: 14,
                      color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RecipeStepsScreen(recipe)),
                  );
                },
              )),
        ],
      ),
    );
  }
}

class RecipeSteptab extends StatelessWidget {
  CoffeeRecipe recipe;

  RecipeSteptab(this.recipe);
  List<RecipeStep> allsteps;

  @override
  Widget build(BuildContext context) {
    allsteps = recipe.steps;
    return Column(
      children: [
        for (RecipeStep step in allsteps)
          // This for loop creates the steptabs
          Column(
            children: [
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xffE2E2E2),
                  border: Border.all(
                    color: Color(0xff4C748B),
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.all(5),
                child: ListTile(
                  title: Text(
                    step.text,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 12,
                        letterSpacing: 1.5,
                        color: Color(0xff4C748B)),
                  ),
                  // Used trailing to add the timer to the very right of each tab

                  trailing: Text(
                    toMinuteFormat(step
                        .time), // Had to add the utils/coffee_data.dart to acces this class
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 12,
                        letterSpacing: 1.5,
                        color: Color(0xff4C748B)),
                  ),
                ),
              )
            ],
          ),
      ],
    );
  }
}

// This is the display of the recipe detail screen
class RecipeTop extends StatelessWidget {
  CoffeeRecipe recipe;
  RecipeTop(this.recipe);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(recipe.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Kollektif",
                  letterSpacing: 1.5,
                  fontSize: 18,
                  color: Color(0xff4C748B))),
          subtitle: Divider(thickness: 1, color: Color(0xff4C748B)),
        ),
        ListTile(
          title: Text(
              "${recipe.coffeeVolumeGrams}" +
                  "g - finely ground coffee" +
                  "\n" +
                  "${recipe.waterVolumeGrams}" +
                  "g - water",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Kollektif",
                  letterSpacing: 1.5,
                  fontSize: 14,
                  color: Color(0xff4C748B))),
        ),
        ListTile(
          title: Text("The ogirinal recipe makes one delicious cup",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Monserrat",
                  letterSpacing: 1.5,
                  fontSize: 10,
                  fontStyle: FontStyle.italic,
                  color: Color(0xff4C748B))),
        ),
      ],
    );
  }
}

// Container(
//     child: Text(
//       recipe.name,
//       style: TextStyle(
//           fontFamily: "Kollektif",
//           fontSize: 18,
//           color: Color(0xff4C748B)),
//     ),
//     decoration: BoxDecoration(
//       color: Color(0xffE5E5E5),
//       border: Border.all(
//         color: Color(0xff4C748B),
//         width: 2.5,
//       ),
//       borderRadius: BorderRadius.circular(10),
//     ),
//   ),
//   Text("${recipe.coffeeVolumeGrams}" + "g - finely ground coffee",
//       style: TextStyle(
//           fontFamily: "Kollektif",
//           fontSize: 14,
//           color: Color(0xff4C748B))),
//   Text("${recipe.waterVolumeGrams}" + "g - water",
//       style: TextStyle(
//           fontFamily: "Kollektif",
//           fontSize: 14,
//           color: Color(0xff4C748B))),
//   SizedBox(
//     height: 15,
//   ),
//   Text(
//       "T h e   o g i r i n a l   r e c i p e   m a k e s   o n e   d e l i c i o u s   c u p",
//       style: TextStyle(
//           fontFamily: "Monserrat",
//           fontSize: 10,
//           fontStyle: FontStyle.italic,
//           color: Color(0xff4C748B))),
