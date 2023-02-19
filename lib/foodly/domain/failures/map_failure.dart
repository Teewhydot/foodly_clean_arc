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
String getLoginDisplayErrorMessage(String errorMessage) {
  isWordInSentence("password", errorMessage);
  if (isWordInSentence("password", errorMessage)) {
    return "Invalid details, please try again";
  } else if (isWordInSentence("record", errorMessage)) {
    return "Account does not exist, please try again";
  } else if (isWordInSentence("network", errorMessage)) {
    return "Internet connection is required";
  } else if (isWordInSentence("blocked", errorMessage)) {
    return 'Too many requests, Try again later';
  } else if (isWordInSentence("disabled", errorMessage)) {
    return 'Account blocked, Contact Support';
  } else {
    return "Login Error";
  }
}

String getSignUpDisplayErrorMessage(String errorMessage) {
  if (isWordInSentence("email", errorMessage)) {
    return "Account already exists";
  } else if (isWordInSentence("network", errorMessage)) {
    return "Internet connection is required";
  } else if (isWordInSentence("blocked", errorMessage)) {
    return 'Too many requests, Try again later';
  } else {
    return "SignUp Error";
  }
}
