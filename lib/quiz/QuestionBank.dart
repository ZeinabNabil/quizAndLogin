import 'package:login/quiz/Question.dart';

class QuestionBank {
  int idx = 0;
  int score = 0;
  bool flag = false;
  List<Question> _questions = [
    Question(question: "Sharks are mammals?", answer: false),
    Question(
        question:
            "Sea otters have a favorite rock they use to break open food?",
        answer: true),
    Question(
        question: "The blue whale is the biggest animal to have ever lived?",
        answer: true),
    Question(
        question: "The hummingbird egg is the world's smallest bird egg?",
        answer: true),
    Question(
        question: "Pigs roll in the mud because they don’t like being clean?",
        answer: false)
  ];

  Question getQuestion() {
    return _questions[idx];
  }

  move() {
    if (idx == _questions.length - 2) {
      idx++;
      flag = true;
    } else {
      idx++;
    }
    // if (idx >= _questions.length - 1) {
    //   flag = true;
    // } else {
    //   idx++;
    // }
  }

  checkAnswer({required bool ans}) {
    if (ans == getQuestion().answer) {
      score++;
      move();
    } else {
      move();
    }
  }
}
