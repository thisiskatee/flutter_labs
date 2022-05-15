import 'package:flutter/material.dart';
import 'package:labetova_lab_2/provider.dart';
import 'package:provider/provider.dart';
import 'second.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);


 final _controller = TextEditingController();
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Pokemon Catcher", style: TextStyle(fontSize: 28, color: Colors.white)),
      ),
      body: Center (
        child: SizedBox(
          width: 600,
          height: 600,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(bottom: 18),
                child: Text('Catch one of 20 pokemons',
                    style: TextStyle(fontSize: 24, color: Colors.black)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: 200,
                  child: TextFormField(
                    controller: _controller,
                    decoration: const InputDecoration(
                    labelText: "Pokemon's id",
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8),
                child: SelectableText("Enter a number in between 1 and 20",
                    style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 86, 83, 83))),
              ),
              const SizedBox(height: 25.0),
              ElevatedButton(
                onPressed: () {
                  if (_controller.text.isEmpty || _controller.text.contains(' 0 ')
                   || _controller.text.contains(RegExp(r'[68-9999999999999999]'))) {
                    print("error");
                  } else {
                    String url = _controller.text;
                    context.read<InputProvider>().fetchStatusCode(url);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage(url: url)));
                    _controller.clear();
                  }
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
