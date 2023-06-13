import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late String email = "";
  late String password = "";
  bool isAcceptable = true;
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Form"),
              centerTitle: true,
            ),
            body: Container(
              margin: EdgeInsets.all(20),
              width: double.infinity,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person,
                      size: 120,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: (Icon(Icons.email)),
                          labelText: "Email",
                          hintText: "Enter your email"),
                      onChanged: (value) => setState(() {
                        email = value;
                      }),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      obscureText: _isHidden,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: (Icon(Icons.password)),
                          suffixIcon: (IconButton(
                              onPressed: _togglePasswordView,
                              icon: Icon(Icons.visibility))),
                          labelText: "Password",
                          hintText: "Enter your password"),
                      onChanged: (value) => setState(() {
                        password = value;
                      }),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (email.length > 0 && password.length > 0) {
                            Navigator.of(context).pushNamed('Profile',
                                arguments: {
                                  "email": email,
                                  "password": password
                                });

                            setState(() {
                              isAcceptable = true;
                              email = "";
                              password = "";
                            });
                          } else {
                            setState(() {
                              isAcceptable = false;
                            });
                          }
                        },
                        child: Text('Login')),
                    !isAcceptable
                        ? Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                              "Please enter all data",
                              style: TextStyle(color: Colors.red, fontSize: 18),
                            ),
                          )
                        : SizedBox(
                            height: 1,
                          ),
                  ]),
            )));
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
