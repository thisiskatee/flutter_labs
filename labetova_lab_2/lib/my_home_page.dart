import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:labetova_lab_2/pockemon_card.dart';
import 'package:labetova_lab_2/pockemon_model.dart';
import 'second.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _loading = false;
  late Future<Pokemon> characters;
  

  @override
  void initState() {
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Pokemon Catcher", style: TextStyle(fontSize: 28, color: Colors.white)),
      ),
      body: Center (
        child: Container(
          width: 600,
          height: 600,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(bottom: 18),
                child: Text('Catch a random pokemon',
                    style: TextStyle(fontSize: 24, color: Colors.black)),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SecondPage(title: 'Your random pokemon',),
                      ),
                    );
                },
                child: const Text("Catch"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}