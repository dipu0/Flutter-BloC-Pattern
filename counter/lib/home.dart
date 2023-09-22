import 'package:counter/bloc/counter_bloc.dart';
import 'package:counter/bloc/counter_event.dart';
import 'package:counter/bloc/counter_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body:BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state){
          if(state is CounterInit){
            return _view(context, 0);
          }
          if(state is CounterUpdate){
            return _view(context, state.counter);
          }

          return Container();
        },
      ),
    );
  }
}

Widget _view(BuildContext context, int value) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          value.toString(),
          style: TextStyle(fontSize: 36),
        ),
        SizedBox(height: 100,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: () {
                context.read<CounterBloc>().add(CounterIncress());
              },
              child: Icon(Icons.add),
            ),
            SizedBox(width: 100),
            FloatingActionButton(
              onPressed: () {
                  context.read<CounterBloc>().add(CounterDecress());
              },
              child: Icon(Icons.minimize),
            ),
          ],
        )
      ],
    ),
  );
}
