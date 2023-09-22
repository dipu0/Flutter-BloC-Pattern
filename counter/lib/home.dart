import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: _view(context, 0),
    );
  }
}

Widget _view(BuildContext context, int value) {
  return Center(
    child: Column(
      children: [
        Text(
          value.toString(),
          style: TextStyle(fontSize: 26),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add),
            ),
            SizedBox(width: 50),
            FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.minimize),
            ),
          ],
        )
      ],
    ),
  );
}
