import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internetstatus/bloc/internet_status_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetStatusBloc, InternetStatusState>(
      builder: (context, state) {
        if (state is InternetStatusGainedState) {
          return Text("Connected");
        } else if (state is InternetStatusLosstState) {
          return Text("Connection Lost");
        }else return Text("Loading....");

        return Scaffold(
          body: SafeArea(
              child: Center(
                  child: Text(
            "Loading...",
            style: TextStyle(fontSize: 36),
          ))),
        );
      },
    );
  }
}
