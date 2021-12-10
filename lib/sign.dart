import 'package:database_one/file.dart';
import 'package:database_one/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  TextEditingController userC = TextEditingController();

  GlobalKey<FormState> _scaffoldKey = GlobalKey<FormState>();

  late FirebaseAuth auth;

  @override
  void initState() {
    auth = FirebaseAuth.instance;
    super.initState();
  }

  Future signup() async {
    try {
      UserCredential user = await auth.createUserWithEmailAndPassword(
          email: emailC.text, password: passC.text);
      await user.user!.updateDisplayName(userC.text);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    emailC.dispose();
    passC.dispose();
    userC.dispose();
    super.dispose();
  }

  AutovalidateMode mode = AutovalidateMode.disabled;

  bool validateInput() {
    bool state = _scaffoldKey.currentState!.validate();
    if (state) {
      setState(() {
        mode = AutovalidateMode.onUserInteraction;
      });
    }

    return state;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Form(
        autovalidateMode: AutovalidateMode.always,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 68.0),
            child: Column(
              children: [
                Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 320,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.black12,
                  ),
                  child: TextFormField(
                    validator: (_) {
                      var email = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                      if (_ == null || _ == '') {
                        return "Enter Correct mail";
                      } else if (email.hasMatch(_)) {
                        return null;
                      } else
                        return "Wrong Email Adress";
                    },
                    controller: emailC,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.mail_outline),
                      border: InputBorder.none,
                      hintText: 'Email',
                    ),
                    onFieldSubmitted: (v) {
                      emailC.text = v;
                    },
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: 320,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.black12,
                  ),
                  child: TextFormField(
                    controller: userC,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_outline),
                      border: InputBorder.none,
                      hintText: 'Name',
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: 320,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.black12,
                  ),
                  child: TextFormField(
                    onFieldSubmitted: (v) {
                      passC.text = v;
                    },
                    controller: passC,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline),
                      border: InputBorder.none,
                      hintText: 'Password',
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: MaterialButton(
                    onPressed: () {
                      signup().then((_) {
                        Navigator.pop(context);
                      });
                    },
                    child: Text('Done'),
                    color: Colors.redAccent,
                    height: 50,
                    minWidth: 200,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
