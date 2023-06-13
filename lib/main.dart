import 'package:flutter/material.dart';
import 'package:login/quiz/QuestionBank.dart';
import 'package:login/login/Login.dart';
import 'package:login/login/Profile.dart';
import 'package:login/quiz/Quiz.dart';
import 'package:login/quiz/Score.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

int idx = 0;
List<Widget> screens = [
  Quiz(),
  Login(),
];

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: "/",
        routes: {
          "Quiz": (context) => Quiz(),
          "Score": (context) => DisplayScore(
                score: qBank.score,
              ),
          "Login": (context) => Login(),
          "Profile": (context) => Profile()
        },
        debugShowCheckedModeBanner: false,
        title: 'Quiz app',
        theme: ThemeData(primarySwatch: Colors.teal),
        home: SafeArea(
            child: Scaffold(
                bottomNavigationBar: BottomNavigationBar(
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.quiz), label: 'Quiz'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person), label: 'Login'),
                  ],
                  selectedItemColor: Colors.teal,
                  unselectedItemColor: Colors.blueGrey,
                  currentIndex: idx,
                  onTap: (value) {
                    setState(() {
                      idx = value;
                    });
                  },
                ),
                body: screens[idx])));
  }
}
