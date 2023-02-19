// This function maps the error message from firebase to a more user friendly message
bool isWordInSentence(String word, String sentence) {
  List<String> wordsInSentence = sentence.split(" ");
  for (String w in wordsInSentence) {
    if (w == word) {
      return true;
    }
  }
  return false;
}

// This function returns a user friendly error message to the user
String getDisplayErrorMessage(String errorMessage) {
  if (isWordInSentence("password", errorMessage)) {
    return "Invalid details, please try again";
  } else if (isWordInSentence("identifier", errorMessage)) {
    return "Account does not exist, please try again";
  } else if (isWordInSentence("network", errorMessage)) {
    return "Your internet connection is not working, please try again";
  } else {
    return "Error";
  }
}
