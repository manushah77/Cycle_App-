import 'package:flutter/material.dart';

class Fol extends StatelessWidget {
  const Fol({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 68.0),
          child: Column(
            children: [
              Text(
                'Wel Come',
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
