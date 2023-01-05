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
  final _email = '';
  final _password = '';

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
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    key: ValueKey("email"),
                    // validator: (value) {
                    //   if (value.isEmpty || !value.contains('@')) {
                    //     return 'incorrect email';
                    //   }
                    // },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(8),
                          borderSide: new BorderSide(),
                        ),
                        labelText: "abc@email.com",
                        labelStyle: GoogleFonts.roboto()),
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
