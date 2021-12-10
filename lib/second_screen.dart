import 'package:database_one/last_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Scnd extends StatefulWidget {
  Scnd({required this.photo});

  final String photo;

  @override
  _ScndState createState() => _ScndState();
}

class _ScndState extends State<Scnd> {
  bool _hasBeenPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
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
                  icon: Icon(Icons.favorite_rounded),
                  iconSize: 16,
                  color: _hasBeenPressed ? Colors.red : Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 400,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(28),
                  bottomRight: Radius.circular(28)),
              color: Colors.black,
            ),
            child: Stack(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 150,
                    backgroundColor: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0.1),
                            Colors.green.shade700
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        color: Colors.grey,
                        borderRadius: BorderRadiusDirectional.circular(150),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 50.0),
                            child: Image.asset(
                              widget.photo,
                              height: 200,
                              width: double.infinity,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 220.0),
            child: Text(
              'Tornio',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    '18 Mile',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text('Range'),
                ],
              ),
              Column(
                children: [
                  Text(
                    '70 KM/H',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text('Speed'),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Rating',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text('4.6'),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Text(
              'Every Coboca-Bi_Cycle adapts perfectly to its rides and his rider and suitable for every conidtion',
              style: TextStyle(
                  color: Colors.black26,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            minWidth: 300,
            height: 60,
            color: Colors.green.withOpacity(0.8),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Last_Page()));
            },
            child: Text(
              'Lease for 28',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
