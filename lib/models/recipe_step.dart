class RecipeStep {
  String text;
  int time;
  // int seconds;

  RecipeStep(text, time) {
    //add any rules to reject invalid values
    //for example, reject negative gram amounts
    this.text = text;
    this.time = time;
  }
  /*
  static Future<int> getFakeTimer(bool areWeInIntegrationTest) async {
    int seconds;

    if (areWeInIntegrationTest) {
      seconds = 5;
    }
    return seconds;
  }*/
}
