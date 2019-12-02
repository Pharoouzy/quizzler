class Question {
  String questionText;
  bool questionAnswer;

  Question(String q, bool a) {
    questionText = q;
    questionAnswer = a;
  }

  List getQuestions() {
    List<String> questions = [
      'You can lead a cow down stairs but not up stairs.',
      'Approximately one quarter of human bones are in the feet.',
      'A slug\'s blood is green.',
    ];

    return questions;
  }
}
