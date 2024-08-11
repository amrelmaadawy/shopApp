import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/cubit/bloc/cubit.dart';
import 'package:shop_app/shared/cubit/stats/StatesScreen.dart';

import '../../shared/constans/commponant.dart';
import '../../shared/constans/constans.dart';
import '../home/home.dart';
class login extends StatelessWidget {
  login({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, States>(
          listener: (context, state) {},
          builder: (context, state) {
            AppCubit cubit = AppCubit.get(context);
            return Form(
              key: formKey,
              child: Scaffold(
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    formField(
                        suffix: const Icon(Icons.email),
                        onPress: () {},
                        validat: (value) {
                          if (value!.isEmpty) {
                            return 'Email address canot be empty!';
                          } else {
                            return null;
                          }
                        },
                        obscure: false,
                        textInput: TextInputType.emailAddress,
                        controller: emailController,
                        text: const Text('Email address')),
                    formField(
                        suffix: Icon(cubit.isVisable
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPress: () {
                          cubit.visable();
                        },
                        validat: (value) {
                          if (value!.isEmpty) {
                            return 'password canot be empty!';
                          } else {
                            return null;
                          }
                        },
                        obscure: cubit.isVisable,
                        textInput: TextInputType.visiblePassword,
                        controller: passwordController,
                        text: const Text('password')),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue)),
                      child: const Text('Sign in'),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const home(),
                              ));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Enter your data please')));
                        }
                        // try to solve validate error
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account ?"),
                        TextButton(
                            onPressed: () {
                            
                            },
                            child: const Text(
                              'Sing up',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
