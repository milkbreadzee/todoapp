import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  startAuth() {
    final validity = _formkey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (validity) {
      _formkey.currentState!.save();
      submitForm(_email,_password,_username);
    }
  }

  submitForm(String email, String password, String username) async {
    final auth = FirebaseAuth.instance;
    UserCredential userCredential;
    try {
      if (isSignupPage) {
        userCredential = await auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        // if(userCredential.user != null){
        //    String uid = userCredential.user.uid;
        // }
        String uid = userCredential.user!.uid;
        await FirebaseFirestore.instance.collection('users').doc(uid).set({
          'username': username,
          'email': email,
        });
      } else {
        userCredential = await auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Container(
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (isSignupPage)
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
                          child: isSignupPage ? Text("Sign Up") : Text("LogIn"),
                        ),
                      ),
                      Container(
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              isSignupPage = !isSignupPage;
                            });
                          },
                          child: isSignupPage
                              ? Text("Have an Account? Login")
                              : Text("Dont have an account? Sign Up"),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
