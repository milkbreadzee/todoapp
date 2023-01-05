import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  ///---------------------------------------
  final _formkey = GlobalKey<FormState>();
  var _email = '';
  var _password = '';
  var _username = '';
  bool isSignupPage = true;

  ///--------------------------------------
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      // child: ListView(
      //   children: [
      //     Container(
      //       child: Form(child: Column()),
      //     )
      //   ],
      // ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Form(
              key: _formkey, //to validate our form
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if(isSignupPage)
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        key: ValueKey("username"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'incorrect username';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _username = value!; //take away ! in case of error
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(8),
                              borderSide: new BorderSide(),
                            ),
                            labelText: "john doe",
                            labelStyle: GoogleFonts.roboto()),
                      ),
                    ),

                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      key: ValueKey("email"),
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return 'incorrect email';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _email = value!; //take away ! in case of error
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(8),
                            borderSide: new BorderSide(),
                          ),
                          labelText: "abc@gmail.com",
                          labelStyle: GoogleFonts.roboto()),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      key: ValueKey("password"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter password';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _password = value!; //take away ! in case of error
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(8),
                            borderSide: new BorderSide(),
                          ),
                          labelText: "password",
                          labelStyle: GoogleFonts.roboto()),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    height: 70,
                   
                    child: ElevatedButton(
                      onPressed: () {},
                      child: isSignupPage? Text("Sign Up"):Text("LogIn"),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
