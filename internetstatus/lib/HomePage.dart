import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/internet_status_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: BlocConsumer<InternetStatusBloc, InternetStatusState>(
      listener: (context, state) {
        if (state is InternetStatusGainedState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Internet Connected"),
            backgroundColor: Colors.green,
          ));
        } else if (state is InternetStatusLosstState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Internet Not Connected"),
            backgroundColor: Colors.red,
          ));
        } else
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Loading..."),
            backgroundColor: Colors.grey,
          ));
        ;
      },
      builder: (context, state) {
        if (state is InternetStatusGainedState) {
          return Text("Connected");
        } else if (state is InternetStatusLosstState) {
          return Text("Connection Lost");
        } else
          return Text("Loading....");
      },
    ))));
  }
}
