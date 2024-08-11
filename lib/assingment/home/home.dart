import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/cubit/bloc/cubit.dart';

import '../../shared/cubit/stats/StatesScreen.dart';
import '../sidebar/sidebar.dart';

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, States>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            drawer: drawer(context),
            appBar: AppBar(backgroundColor: Colors.blue),
            bottomNavigationBar: BottomNavigationBar(
              items: AppCubit.get(context).bottomItem,
              currentIndex: AppCubit.get(context).currrentIndex,
              onTap: (index) {
                AppCubit.get(context).changeNavBar(index);
              },
            ),
          );
        },
      ),
    );
  }
}
