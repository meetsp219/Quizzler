class Question {
  String _question = "";
  bool _answer = false;

  Question(String question, bool answer) {
    _question = question;
    _answer = answer;
  }

  String getQuestionText() {
    return _question;
  }

  bool getAnswer() {
    return _answer;
  }
}
