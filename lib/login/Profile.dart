import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  // final String email;
  // final String password;
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
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
                    'Email: ',
                    style: TextStyle(color: Colors.teal, fontSize: 24.0),
                  ),
                  Text(
                    '${args["email"]}',
                    style: TextStyle(fontSize: 24.0),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Passeword: ',
                    style: TextStyle(color: Colors.teal, fontSize: 24.0),
                  ),
                  Text(
                    '${args["password"]}',
                    style: TextStyle(fontSize: 24.0),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
