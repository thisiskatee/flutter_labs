import 'package:flutter/material.dart';
import 'package:labetova_lab_2/provider.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<InputProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokemon Catcher"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: (Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (provider.isLoading)
                const CircularProgressIndicator()
              else if (provider.data != null)
                Container(
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1500),
                  color: Color.fromARGB(148, 202, 211, 236),
                ),
                  width: 500,
                  height: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children:  <Widget>[
                          Text("Congrats! It's " + provider.data!.name.toString(), style: TextStyle(color: Colors.black,fontSize: 36)),
                          Text("Height: " + provider.data!.height.toString(), style: TextStyle(color: Colors.black, fontSize: 20)),
                          Text("Weight: " + provider.data!.weight.toString(), style: TextStyle(color: Colors.black, fontSize: 20)),
                        ]
                    )       
                 )
              else
                const Text("error")
            ],
          )),
        ),
      ),
    );
  }
}