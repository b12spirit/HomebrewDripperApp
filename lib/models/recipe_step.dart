class RecipeStep {
  String text;
  int time;

  RecipeStep(text, time) {
    //If a negative amount or time is entered, 0 is defaulted to
    // if (text < 0) text = 0;

    if (time == null || time < 1)
      this.time = 5;
    else
      this.time = time;

    if (text == null || text == "")
      this.text = "Sorry no instructions for this recipe!";
    else
      this.text = text;
  }
}
