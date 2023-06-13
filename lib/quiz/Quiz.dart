import 'package:flutter/material.dart';
import 'package:login/quiz/QuestionBank.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

QuestionBank qBank = QuestionBank();

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.question_answer),
          title: Text(
            "Quiz App",
            style: TextStyle(fontSize: 25),
          ),
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: Column(children: [
            Row(children: [
              Text(
                'Question no.',
                style: TextStyle(fontSize: 20),
              ),
              Text((qBank.idx + 1).toString(),
                  style: TextStyle(fontSize: 20, color: Colors.teal))
            ]),
            SizedBox(height: 10),
            ListTile(
              title: Text(qBank.getQuestion().question),
              trailing: IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () {
                  qBank.flag
                      ? Navigator.of(context).pushNamed('Score')
                      : setState(() {
                          qBank.move();
                        });
                },
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () {
                      if (qBank.flag) {
                        qBank.checkAnswer(ans: true);
                        Navigator.of(context).pushNamed('Score');
                      } else {
                        setState(() {
                          qBank.checkAnswer(ans: true);
                        });
                      }
                      // qBank.flag
                      //     ? Navigator.of(context).pushNamed('Score')
                      //     : setState(() {
                      //         qBank.checkAnswer(ans: true);
                      //       });
                    },
                    child: Text("True")),
                ElevatedButton(
                    onPressed: () {
                      if (qBank.flag) {
                        qBank.checkAnswer(ans: false);
                        Navigator.of(context).pushNamed('Score');
                      } else {
                        setState(() {
                          qBank.checkAnswer(ans: false);
                        });
                      }
                      // qBank.flag
                      //     ? Navigator.of(context).pushNamed('Score')
                      //     : setState(() {
                      //         qBank.checkAnswer(ans: false);
                      //       });
                    },
                    child: Text("False"))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            qBank.flag
                ? ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('Score');
                    },
                    child: Text("View score"))
                : SizedBox(
                    height: 5,
                  )
          ]),
        ),
      ),
    );
  }
}
