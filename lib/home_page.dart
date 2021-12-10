import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:database_one/cycle.dart';
import 'package:database_one/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'second_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Productmodel> model = [
    Productmodel(
        name: 'Red E1 Cycle',
        number1: 4,
        number2: 4.8,
        photo: 'images/redd.png'),
    Productmodel(
        name: 'Cute W4 Cycle',
        number1: 3,
        number2: 4.6,
        photo: 'images/cutee.png'),
    Productmodel(
        name: 'Pair AA1 Cycle',
        number1: 3,
        number2: 4.3,
        photo: 'images/reall.png'),
    Productmodel(
        name: 'Vector Cycle',
        number1: 3,
        number2: 4.2,
        photo: 'images/vectorr.png'),
    Productmodel(
        name: 'Red E1 Cycle',
        number1: 4,
        number2: 4.8,
        photo: 'images/redd.png'),
    Productmodel(
        name: 'Cute W4 Cycle',
        number1: 3,
        number2: 4.6,
        photo: 'images/cutee.png'),
    Productmodel(
        name: 'Pair AA1 Cycle',
        number1: 3,
        number2: 4.3,
        photo: 'images/reall.png'),
    Productmodel(
        name: 'Vector Cycle',
        number1: 3,
        number2: 4.2,
        photo: 'images/vectorr.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 18.0, right: 28, left: 28),
        child: CustomNavigationBar(
            selectedColor: Colors.green,
            unSelectedColor: Colors.grey,
            backgroundColor: Colors.black,
            currentIndex: 2,
            isFloating: true,
            borderRadius: Radius.circular(30),
            elevation: 0,
            items: [
              CustomNavigationBarItem(
                icon: Icon(Icons.home),
              ),
              CustomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
              ),
              CustomNavigationBarItem(
                icon: Icon(Icons.favorite),
              ),
              CustomNavigationBarItem(
                icon: Icon(Icons.account_circle),
              ),
            ]),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {},
          icon: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey.withOpacity(0.3),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 2.0,
                    spreadRadius: 2.0,
                  ),
                ]),
            height: 50,
            width: 60,
            child: Icon(
              Icons.search,
              color: Colors.white,
              size: 25,
            ),
          ),
        ),
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage('images/ustad.jpg'),
            radius: 25,
          ),
          // Container(
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(30),
          //       color: Colors.grey.withOpacity(0.3),
          //       boxShadow: [
          //         BoxShadow(
          //           color: Colors.black,
          //           blurRadius: 2.0,
          //           spreadRadius: 2.0,
          //         ),
          //       ]),
          //   height: 50,
          //   width: 60,
          //   child: IconButton(
          //     onPressed: () {},
          //     icon: Icon(Icons.person),
          //   ),
          // ),
        ],
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(28),
                  bottomRight: Radius.circular(28)),
              color: Colors.black,
            ),
            height: 110,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hi,Mansoor',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Choose your bike',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.green,
                ),
                height: 25,
                width: 59,
                child: Center(
                    child: Text(
                  'Product',
                  style: TextStyle(color: Colors.white),
                )),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.black12,
                ),
                height: 25,
                width: 59,
                child: Center(
                    child: Text(
                  'City',
                  style: TextStyle(color: Colors.black),
                )),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.black12,
                ),
                height: 25,
                width: 59,
                child: Center(
                    child: Text(
                  'Touring',
                  style: TextStyle(color: Colors.black),
                )),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.black12,
                ),
                height: 25,
                width: 59,
                child: Center(
                  child: Text(
                    'Hybrid',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 440,
            child: GridView.count(
              childAspectRatio: 0.8,
              crossAxisCount: 2,
              children: [
                for (var x in model)
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Scnd(
                            photo: x.photo,
                          ),
                        ),
                      );
                    },
                    child: Cycle(
                      number: x.number2,
                      name: x.name,
                      image: x.photo,
                      price: x.number1,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
