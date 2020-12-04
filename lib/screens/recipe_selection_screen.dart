import 'package:flutter/material.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/screens/recipe_detail_screen.dart';
import 'package:homebrew_dripper/utils/coffee_data.dart';
import 'package:url_launcher/url_launcher.dart';

class RecipeSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Coffee Recipes Title
              Text(
                "Coffee Recipes",
                key: Key("coffee-recipes"),
                style: TextStyle(
                    fontFamily: "Kollektif",
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Color(0xff4C748B)),
              ),
              SizedBox(
                height: 15,
              ),
              // This container has the list of recipes
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffE5E5E5),
                  border: Border.all(
                    color: Color(0xff4C748B),
                    width: 2.5,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: RecipeList(),
              ),
              SizedBox(
                height: 30,
              ),
              //Resources Title
              Text(
                "R e s o u r c e s",
                style: TextStyle(
                    fontFamily: "Kollektif",
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Color(0xff4C748B)),
              ),
              SizedBox(
                height: 15,
              ),
              // This container has the list of Resources
              Container(
                  decoration: BoxDecoration(
                    color: Color(0xffE5E5E5),
                    border: Border.all(
                      color: Color(0xff4C748B),
                      width: 2.5,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ResourceList()),
            ],
          )),
    );
  }
}

// ignore: must_be_immutable
class RecipeList extends StatelessWidget {
  List<CoffeeRecipe> recipes = CoffeeData.loadRecipes();
  bool divider = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (CoffeeRecipe recipe in recipes)
          Column(
            children: [
              // This if statement avoids the extra divider at the top
              if (recipe.name != "S w e e t   M a r i a ' s")
                Divider(
                  thickness: 1,
                  color: Color(0xff4C748B),
                ),
              ListTile(
                title: Text(
                  recipe.name,
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      color: Color(0xff4C748B),
                      fontSize: 14),
                ),
                trailing: Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RecipeDetailScreen(recipe)),
                  );
                },
              )
            ],
          )
      ],
    );
  }
}

// NEEDED url_launch dependency
/// This is the list that goins inside Resources container
class ResourceList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            "C o f f e e",
            style: TextStyle(
                fontFamily: "Montserrat",
                color: Color(0xff4C748B),
                fontSize: 14),
          ),
          trailing: Icon(
            Icons.chevron_right,
          ),
          // This creates the hyperlink for each resources tab
          onTap: () async {
            const url = 'https://www.amazon.com/s?k=Coffee';
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Could not launch $url';
            }
          },
        ),
        Divider(
          height: 0,
          thickness: 1,
          color: Color(0xff4C748B),
        ),
        ListTile(
          title: Text(
            "G r i n d e r s",
            key: Key('Resource_Grinders_key'),
            style: TextStyle(
                fontFamily: "Montserrat",
                color: Color(0xff4C748B),
                fontSize: 14),
          ),
          trailing: Icon(
            Icons.chevron_right,
          ),
          // This creates the hyperlink for each resources tab

          onTap: () async {
            const url = 'https://www.amazon.com/s?k=Coffee+Grinders';
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Could not launch $url';
            }
          },
        ),
        Divider(
          height: 0,
          thickness: 1,
          color: Color(0xff4C748B),
        ),
        ListTile(
          title: Text(
            "K e t t l e s",
            key: Key('Resource_Kettles_key'),
            style: TextStyle(
                fontFamily: "Montserrat",
                color: Color(0xff4C748B),
                fontSize: 14),
          ),
          trailing: Icon(
            Icons.chevron_right,
          ),
          // This creates the hyperlink for each resources tab

          onTap: () async {
            const url = 'https://www.amazon.com/s?k=Coffe+Kettles';
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Could not launch $url';
            }
          },
        ),
        Divider(
          height: 0,
          thickness: 1,
          color: Color(0xff4C748B),
        ),
        ListTile(
          title: Text(
            "H o m e b r e w    D r i p p e r",
            key: Key('Resource_Homebrew_Dripper_key'),
            style: TextStyle(
                fontFamily: "Montserrat",
                color: Color(0xff4C748B),
                fontSize: 14),
          ),
          trailing: Icon(
            Icons.chevron_right,
          ),
          // This creates the hyperlink for each resources tab

          onTap: () async {
            const url = 'https://www.amazon.com/s?k=Coffee+Homebrew+Dripper';
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Could not launch $url';
            }
          },
        )
      ],
    );
  }
}
