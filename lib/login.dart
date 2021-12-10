import 'package:database_one/file.dart';
import 'package:database_one/home_page.dart';
import 'package:database_one/sign.dart';
import 'package:database_one/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  late FirebaseAuth auth;
  GlobalKey<FormState> _scaffoldKey = GlobalKey<FormState>();
  @override
  void initState() {
    auth = FirebaseAuth.instance;
    super.initState();
  }

  Future<bool> Login() async {
    try {
      UserCredential user = await auth.signInWithEmailAndPassword(
          email: emailC.text, password: passC.text);
      return true;
    } on FirebaseAuthException catch (e) {
      print(e);
      // _scaffoldKey.currentState!
      //     .showSnackBar(SnackBar(content: Text("${e.message}")));
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                content: Text("${e.message}"),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Close'))
                ],
              ));

      return false;
    }
  }

  @override
  void dispose() {
    emailC.dispose();
    passC.dispose();
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
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Form(
        autovalidateMode: mode,
        key: _scaffoldKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 68.0),
            child: Column(
              children: [
                Text(
                  'Login',
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
                      if (_ == null || _ == '') {
                        return "Please Enter Something";
                      }
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
                      if (_ == null || _ == '') {
                        return "Please Enter Something";
                      }
                    },
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
                  height: 50,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: MaterialButton(
                    onPressed: () {
                      // if (validateInput()) {
                      Login().then((value) {
                        if (value) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SplashScreen()),
                          );
                        }
                      });
                    },
                    // },
                    child: Text('Done'),
                    color: Colors.redAccent,
                    height: 50,
                    minWidth: 200,
                  ),
                ),
                SizedBox(
                  height: 200,
                ),
                Text('Dont have an Account'),
                SizedBox(
                  height: 10,
                ),
                Text('Please Click on Signup'),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Signin()),
                    );
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        fontSize: 27,
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold),
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
