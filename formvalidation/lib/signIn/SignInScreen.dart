// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formvalidation/signIn/bloc/sign_in_bloc.dart';

class SignInScreen extends StatelessWidget {
  TextEditingController emailCrontroller = TextEditingController();
  TextEditingController passwordCrontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SignIn Screen"),
      ),
      body: SafeArea(
          child: ListView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        padding: EdgeInsets.all(20),
        children: [
          BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
            if (state is SignInErrorState) {
              return Text(
                state.errorMessage,
                style: TextStyle(color: Colors.red, fontSize: 14),
              );
            } else {
              return Container(
                color: Colors.amber,
              );
            }
          }),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: emailCrontroller,
            onChanged: (value) {
              BlocProvider.of<SignInBloc>(context).add(SignInTextChangeEvent(
                  emailCrontroller.text, passwordCrontroller.text));
            },
            decoration: InputDecoration(hintText: "Email Address"),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: passwordCrontroller,
            onChanged: (value) {
              BlocProvider.of<SignInBloc>(context).add(SignInTextChangeEvent(
                  emailCrontroller.text, passwordCrontroller.text));
            },
            decoration: InputDecoration(hintText: "Password"),
          ),
          SizedBox(
            height: 40,
          ),
          BlocBuilder<SignInBloc, SignInState>(
            builder: (context, state) {
              if (state is SignInLoadingState) {
                return Center(child: CircularProgressIndicator());
              }
              return CupertinoButton(
                  color:
                      (state is SignInValidState) ? Colors.blue : Colors.grey,
                  child: Text("Sign In"),
                  onPressed: () {
                    if (state is SignInValidState) {
                      BlocProvider.of<SignInBloc>(context).add(
                          SignInSubmittedEvent(
                              emailCrontroller.text, passwordCrontroller.text));
                    }
                  });
            },
          )
        ],
      )),
    );
  }
}
