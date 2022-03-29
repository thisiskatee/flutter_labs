import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:labetova_lab_2/pockemon_card.dart';
import 'package:labetova_lab_2/pockemon_model.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key, required this.title}) : super(key: key);
  final String title;

@override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  bool _loading = false;
  late Future<Pokemon> characters;
  

  Future<Pokemon> _fetchCharacter() async {
    Random rand = new Random();
    int randInt = rand.nextInt(20);

    setState(() {
      _loading = true;
    });

    final response = await http
      .get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$randInt'));

    if (response.statusCode == 200) {
      return Pokemon.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }

    setState(() {
      _loading = false;
    });


  }

  @override
  void initState() {
    super.initState();
    characters = _fetchCharacter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Pokemon Catcher", style: TextStyle(fontSize: 28, color: Colors.white)),
      ),
      body: Center(
          child: FutureBuilder<Pokemon>(
            future: characters,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return PockemonCard(
                  name: snapshot.data!.name,
                  height: snapshot.data!.height, 
                  weight: snapshot.data!.weight);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              return const CircularProgressIndicator();
            },
          ),
        ),
    );
  }
}

  

