import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cycle extends StatefulWidget {
  Cycle({
    required this.image,
    required this.name,
    required this.price,
    required this.number,
  });

  final String image;
  final String name;
  final int price;
  final double number;

  @override
  State<Cycle> createState() => _CycleState();
}

class _CycleState extends State<Cycle> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 1.0,
                    spreadRadius: 2.0),
              ]),
          height: 200,
          width: 150,
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.star,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    '${widget.number}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Image.asset(
                widget.image,
                height: 90,
                width: 100,
              ),
              Text(widget.name),
              SizedBox(
                height: 10,
              ),
              Text(
                '${widget.price} - 8 km',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
