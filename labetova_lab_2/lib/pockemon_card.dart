import 'package:flutter/material.dart';

class PockemonCard extends StatelessWidget {
  const PockemonCard({
    required this.name,
    required this.height,
    required this.weight,

    
    Key? key,

  }) : super(key: key);

  final String name;
  final int height;
  final int weight;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1500),
            color: Color.fromARGB(148, 202, 211, 236),
            ),
      // margin: const EdgeInsets.all(10),
      width: 500,
      height: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children:  <Widget>[
            Text("Congrats! It's " + name, style: TextStyle(color: Colors.black,fontSize: 36)),
            Text("Height: " + height.toString(), style: TextStyle(color: Colors.black, fontSize: 20)),
            Text("Weight: " + weight.toString(), style: TextStyle(color: Colors.black, fontSize: 20)),
            ]
          )
    );
  
  }
}