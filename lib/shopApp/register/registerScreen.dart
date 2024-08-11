import 'package:flutter/material.dart';

import '../../shared/constans/commponant.dart';
import '../login/loginScreen.dart';

class registerScreem extends StatelessWidget {
  registerScreem({Key? key}) : super(key: key);

  GlobalKey<FormState> validateKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController registerEmailController = TextEditingController();
    TextEditingController registerPasswordController = TextEditingController();
    return Form(
      key: validateKey,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            formField(
              suffix:const Icon(Icons.title,),
              onPress: () {
                
              },
                validat: (value) {
                  if (value!.isEmpty) {
                    return 'please enter your username';
                  } else {
                    return null;
                  }
                },
                obscure: false,
                textInput: TextInputType.text,
                controller: nameController,
                text:const Text('Username')),
            formField(
               suffix:const  Icon(Icons.email),
              onPress: () {
                
              },
                validat: (value) {
                  if (value!.isEmpty) {
                    return 'please enter your Email adress';
                  } else {
                    return null;
                  }
                },
                obscure: false,
                textInput: TextInputType.emailAddress,
                controller: registerEmailController,
                text: const Text('Email adress')),
            formField(
               suffix: const Icon(Icons.visibility),
              onPress: () {
                
              },
                validat: (value) {
                  if (value!.isEmpty) {
                    return 'please enter your password';
                  } else {
                    return null;
                  }
                },
                obscure: true,
                textInput: TextInputType.visiblePassword,
                controller: registerPasswordController,
                text: const Text('password')),
            defultElevatButton(
                text: const Text('Register'),
                pressed: () {
                  if (validateKey.currentState!.validate()) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => loginScreen())));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('ENTER YOUR DATA!!!!!')));
                  }
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account?'),
                TextButton(
                    onPressed: () {

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => loginScreen(),
                          ));
                      // text form field must be empty of login 
                    },
                    child: const Text(
                      'Sign in',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
