
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/cubit/bloc/cubit.dart';
import 'package:shop_app/shared/cubit/stats/StatesScreen.dart';
import 'package:shop_app/shopApp/homeLayout/homeLayout.dart';
import 'package:shop_app/shopApp/register/registerScreen.dart';

import '../../shared/constans/commponant.dart';
import '../../shared/constans/constans.dart';

class loginScreen extends StatelessWidget {
  loginScreen({Key? key}) : super(key: key);
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
                    Container(
                      child: defultElevatButton(
                        text: const Text('Sign in'),
                        pressed: () {
                          if (formKey.currentState!.validate()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>const homeLayout(),
                                ));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text('Enter your data please')));
                          }
                          // try to solve validate error
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account ?"),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => registerScreem(),
                                  ));
                            },
                            child: const Text(
                              'Sing up',
                              style: TextStyle(fontWeight: FontWeight.bold),
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
