import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Your Fridge",
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5)),
              GestureDetector(
                onTap: () => print("See All"),
                child: Text(
                  "See all",
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.0),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
