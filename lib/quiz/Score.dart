import 'package:flutter/material.dart';

class DisplayScore extends StatelessWidget {
  late int score;

  DisplayScore({required this.score});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Display Score'),
            ),
            body: Center(
              child: Container(
                width: double.infinity,
                height: 100,
                margin: EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Score: ',
                          style: TextStyle(fontSize: 24.0),
                        ),
                        Text(score.toString(),
                            style:
                                TextStyle(color: Colors.teal, fontSize: 24.0))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      score >= 3 ? 'Success' : 'Fail',
                      style: TextStyle(color: Colors.teal, fontSize: 24.0),
                    )
                  ],
                ),
              ),
            )));
  }
}
