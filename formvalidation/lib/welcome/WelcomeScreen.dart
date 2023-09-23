import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formvalidation/signIn/bloc/sign_in_bloc.dart';

import '../signIn/SignInScreen.dart';

class welcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("BLoC patter form Validation"),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BlocProvider(
                                create: (context) => SignInBloc(),
                                child: SignInScreen(),
                              )));
                },
                child: Text("Sign in With Email"))
          ],
        ),
      )),
    );
  }
}
