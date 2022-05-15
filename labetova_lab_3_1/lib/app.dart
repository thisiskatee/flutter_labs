import 'package:flutter/material.dart';
import 'package:labetova_lab_2/provider.dart';
import 'package:provider/provider.dart';
import 'my_home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_)=> InputProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Pokemon Catcher',
        theme: ThemeData(      
          primarySwatch: Colors.red,
        ),
        home:  MyHomePage(),
      ),
    );
  }
}