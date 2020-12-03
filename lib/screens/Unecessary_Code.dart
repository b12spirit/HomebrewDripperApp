// THIS CODE WAS MY FIRST FAILED ATTEMPT TO DO THE PROGRAM
// ALTHOUGHT THE IDEA AND UI WERE CORRECT I WAS USING THE WRONG
// I DIDNT USE THE CLASSES THAT THE WERE INCLUDED  (ALTHOUGHT I DONT KNOW IF WE WERE FORCED TO USE THEM)

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:homebrew_dripper/screens/done_screen.dart';

class RecipeSelectionScreen extends StatefulWidget {
  @override
  _RecipeSelectionScreenState createState() => _RecipeSelectionScreenState();
}

class _RecipeSelectionScreenState extends State<RecipeSelectionScreen> {
  bool _checked = false;
  bool _checked2 = false;
  String themachine;
  @override
  Widget build(BuildContext context) {
    var _onPressed;

    // if (_checked2 & _checked) {
    //   _onPressed = () {
    //     print("Continue");
    //   };
    // } else if (_checked2 || _checked) {
    //   _onPressed = () {
    //     // Navigator.of(context)
    //     //     .push(MaterialPageRoute(builder: (context) => Cups(themachine)));
    //   };
    // }

    return Scaffold(
        backgroundColor: Color(0xffE5E5E5),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Coffee Recipes",
                  key: Key("Coffee_title_key"),
                  style: TextStyle(
                      fontFamily: "Kollektif",
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color(0xff4C748B)),
                ),
                SizedBox(
                  height: 15,
                ),
                LimitedBox(
                    child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xffE5E5E5),
                          border: Border.all(
                            color: Color(0xff4C748B),
                            width: 2.5,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: <Widget>[
                            CheckboxListTile(
                              // First Recipe
                              key: Key("Sweet Maria's Key"),
                              title: Text(
                                "S w e e t    M a r i a ' s",
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Color(0xff4C748B),
                                    fontSize: 14),
                              ),
                              controlAffinity: ListTileControlAffinity.platform,
                              value: _checked,
                              onChanged: (bool value) {
                                setState(() {
                                  _checked = value;
                                  _checked2 = false;
                                  themachine = "g - course ground coffee";
                                });
                              },
                            ),
                            // DIVEDER FOR THE RECIPE TAB
                            Divider(
                              height: 0,
                              thickness: 1,
                              color: Color(0xff4C748Bf),
                            ),
                            //Second Recipe
                            CheckboxListTile(
                              title: Text(
                                "Recipe #2",
                                key: Key('Key for other recipe'),
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Color(0xff4C748B),
                                    fontSize: 14),
                              ),
                              controlAffinity: ListTileControlAffinity.platform,
                              value: _checked2,
                              onChanged: (bool value) {
                                setState(() {
                                  _checked2 = value;
                                  _checked = false;
                                  themachine = "g - medium ground coffee";
                                });
                              },
                            ),
                            // DIVEDER FOR THE RECIPE TAB
                            Divider(
                              height: 0,
                              thickness: 1,
                              color: Color(0xff4C748B),
                            ),
                            // Third Recipe
                            CheckboxListTile(
                              title: Text(
                                "Recipe #3",
                                key: Key('Key for other recipe'),
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Color(0xff4C748B),
                                    fontSize: 14),
                              ),
                              controlAffinity: ListTileControlAffinity.platform,
                              value: _checked2,
                              onChanged: (bool value) {
                                setState(() {
                                  _checked2 = value;
                                  _checked = false;
                                  themachine = "g - medium ground coffee";
                                });
                              },
                            ),
                            // DIVEDER FOR THE RECIPE TAB
                            Divider(
                              height: 0,
                              thickness: 1,
                              color: Color(0xff4C748B),
                            ),
                            // Fourth Recipe
                            CheckboxListTile(
                              title: Text(
                                "Recipe #4",
                                key: Key('Key for other recipe'),
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Color(0xff4C748B),
                                    fontSize: 14),
                              ),
                              controlAffinity: ListTileControlAffinity.platform,
                              value: _checked2,
                              onChanged: (bool value) {
                                setState(() {
                                  _checked2 = value;
                                  _checked = false;
                                  themachine = "g - medium ground coffee";
                                });
                              },
                            ),
                          ],
                        ))),
                SizedBox(
                  height: 30,
                ),
                // RESOURCES FULL TAB
                Text(
                  "R e s o u r c e s",
                  key: Key("Resources_title_key"),
                  style: TextStyle(
                      fontFamily: "Kollektif",
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color(0xff4C748B)),
                ),
                SizedBox(
                  height: 15,
                ),

                LimitedBox(
                    child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xffE5E5E5),
                          border: Border.all(
                            color: Color(0xff4C748B),
                            width: 2.5,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: <Widget>[
                            CheckboxListTile(
                              // Coffee Tab
                              key: Key("Resource_Coffee_tab_key"),
                              title: Text(
                                "C o f f e e",
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Color(0xff4C748B),
                                    fontSize: 14),
                              ),
                              controlAffinity: ListTileControlAffinity.platform,
                              value: _checked,
                              onChanged: (bool value) {
                                setState(() {
                                  _checked = value;
                                  _checked2 = false;
                                  themachine = "g - course ground coffee";
                                });
                              },
                            ),
                            // DIVEDER FOR THE REOURCES TAB
                            Divider(
                              height: 0,
                              thickness: 1,
                              color: Color(0xff4C748B),
                            ),
                            // Grinders Tab
                            CheckboxListTile(
                              title: Text(
                                "G r i n d e r s",
                                key: Key('Resource_Grinders_key'),
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Color(0xff4C748B),
                                    fontSize: 14),
                              ),
                              controlAffinity: ListTileControlAffinity.platform,
                              value: _checked2,
                              onChanged: (bool value) {
                                setState(() {
                                  _checked2 = value;
                                  _checked = false;
                                  themachine = "g - medium ground coffee";
                                });
                              },
                            ),
                            // DIVEDER FOR THE REOURCES TAB
                            Divider(
                              height: 0,
                              thickness: 1,
                              color: Color(0xff4C748B),
                            ),
                            // Kettles Tab
                            CheckboxListTile(
                              title: Text(
                                "K e t t l e s",
                                key: Key('Resource_Kettles_key'),
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Color(0xff4C748B),
                                    fontSize: 14),
                              ),
                              controlAffinity: ListTileControlAffinity.platform,
                              value: _checked2,
                              onChanged: (bool value) {
                                setState(() {
                                  _checked2 = value;
                                  _checked = false;
                                  themachine = "g - medium ground coffee";
                                });
                              },
                            ),
                            // DIVEDER FOR THE REOURCES TAB
                            Divider(
                              height: 0,
                              thickness: 1,
                              color: Color(0xff4C748B),
                            ),
                            // Homebrew Dripper Tab
                            CheckboxListTile(
                              title: Text(
                                "H o m e b r e w    D r i p p e r",
                                key: Key('Resource_Homebrew_Dripper_key'),
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Color(0xff4C748B),
                                    fontSize: 14),
                              ),
                              controlAffinity: ListTileControlAffinity.platform,
                              value: _checked2,
                              onChanged: (bool value) {
                                setState(() {
                                  _checked2 = value;
                                  _checked = false;
                                  themachine = "g - medium ground coffee";
                                });
                              },
                            ),
                          ],
                        ))),
              ]),
        ));
  }
}
