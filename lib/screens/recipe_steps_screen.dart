import 'dart:async';

import 'package:flutter/material.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:homebrew_dripper/screens/done_screen.dart';
import 'package:homebrew_dripper/utils/coffee_data.dart';

// ignore: must_be_immutable
class RecipeStepsScreen extends StatefulWidget {
  CoffeeRecipe recipe;

  RecipeStepsScreen(this.recipe);

  @override
  _RecipeStepsScreenState createState() => _RecipeStepsScreenState();
}

class _RecipeStepsScreenState extends State<RecipeStepsScreen> {
  int currentStep;
  List<RecipeStep> remainingSteps;
  int stepTimeRemaining;
  Timer timer;

  @override
  void initState() {
    super.initState();

    int totalSteps = widget.recipe.steps.length;

    currentStep = 0;
    remainingSteps = widget.recipe.steps;

    //set the starting value of the timer
    stepTimeRemaining = widget.recipe.steps[currentStep].time;

    //make timer that ticks every one seconds
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      // if timer reached zero
      if (stepTimeRemaining < 1) {
        //increase step
        currentStep++;

        //if we finished
        if (currentStep >= totalSteps) {
          //cancel timer
          timer.cancel();

          //navigate to done screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DoneScreen()),
          );
        } else {
          //if we did not finish yet
          //adjust the timer
          //reduce the list of remaining steps
          stepTimeRemaining = widget.recipe.steps[currentStep].time;
          remainingSteps = widget.recipe.steps.sublist(currentStep);
          setState(() {});
        }
      } else {
        //adjust time remaining by one
        stepTimeRemaining = stepTimeRemaining - 1;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    RecipeStep currentRecipeStep = widget.recipe.steps[currentStep];

    return Scaffold(
      backgroundColor: Color(0xff4C748B),
      // appBar: AppBar(
      //   title: Text("Recipe Steps"),
      // ),
      body: ListView(
        children: [
          SizedBox(height: 50),
          ListTile(
            title: Text("$stepTimeRemaining",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Kollektif",
                    fontSize: 96,
                    color: Colors.white)),
          ),
          ListTile(
            title: Text("${currentRecipeStep.text}",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Kollektif",
                    fontSize: 24,
                    color: Colors.white)),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
              height: 45,
              child: ListTile(
                title: Text(
                  "S t e p s",
                  style: TextStyle(
                      fontFamily: "Kollektif",
                      fontSize: 14,
                      color: Colors.white),
                ),
              )),
          for (RecipeStep step
              in remainingSteps) // This for loop creates the steps tabs
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xff4C748B),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.all(5),
              child: ListTile(
                title: Text(
                  step.text,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: "Kollektif",
                      fontSize: 12,
                      color: Colors.white),
                ),
                trailing: Text(toMinuteFormat(step.time),
                    style: TextStyle(
                        fontFamily: "Kollektif",
                        fontSize: 12,
                        color: Colors.white)),
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
