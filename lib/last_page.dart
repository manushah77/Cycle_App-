import 'package:database_one/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Last_Page extends StatefulWidget {
  const Last_Page({Key? key}) : super(key: key);

  @override
  _Last_PageState createState() => _Last_PageState();
}

class _Last_PageState extends State<Last_Page> {
  bool _hasBeenPressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: Colors.white38,
                borderRadius: BorderRadiusDirectional.circular(30)),
            child: Icon(Icons.arrow_back_ios_new_rounded),
          ),
          iconSize: 16,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.circular(30)),
              child: Center(
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      _hasBeenPressed = !_hasBeenPressed;
                    });
                  },
                  icon: Icon(Icons.bookmark),
                  iconSize: 16,
                  color: _hasBeenPressed ? Colors.blue : Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: 400,
            width: double.infinity,
            color: Colors.black,
            child: Image.asset('images/easy.png'),
          ),

          //Detail wala Last container

          Padding(
            padding: const EdgeInsets.only(top: 370.0),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          blurRadius: 1.0,
                          spreadRadius: 2.0),
                    ]),
                height: 330,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '61 Wisidor',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            '1 solop palcr',
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Avenu Bufello ',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            'Flinshing ',
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'NY12P2',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            '009PAE2',
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          //Cycle Container center wala

          Center(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white.withOpacity(0.9),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 1.0,
                        spreadRadius: 2.0),
                  ]),
              height: 100,
              width: 240,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'images/redd.png',
                    height: 100,
                    width: 80,
                  ),
                  Text(
                    'Red E1Cycle',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 550.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    height: 60,
                    width: 330,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 90.0),
                        child: Text(
                          'Lease For 124 Us',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 550.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    height: 60,
                    width: 120,
                    child: Center(
                      child: Text(
                        '15 KM',
                        style: TextStyle(color: Colors.black45, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 660.0),
              child: MaterialButton(
                color: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                onPressed: () {
                  FirebaseAuth.instance.signOut().then(
                    (value) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ),
                      );
                    },
                  );
                },
                child: Text('Log Out',
                    style: TextStyle(color: Colors.black45, fontSize: 25)),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// Center(
// child: InkWell(
// onTap: () {
// FirebaseAuth.instance.signOut().then((value) {
// Navigator.pushReplacement(
// context,
// MaterialPageRoute(
// builder: (context) => Login(),
// ),
// );
// });
// },
// child: Text('Sign Out',
// style: TextStyle(
// color: Colors.black,
// fontSize: 30,
// fontWeight: FontWeight.bold)),
// ),
// ),
