
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/cubit/stats/StatesScreen.dart';

class AppCubit extends Cubit<States> {
  AppCubit() : super(initialState());
  static AppCubit get(context) => BlocProvider.of(context);
  bool isShowMore = true;
  void showMore() {
    isShowMore = !isShowMore;
    emit(ShowMoreState());
  }

  bool isVisable = true;
  void visable() {
    isVisable = !isVisable;
    emit(passworVisableState());
  }

  int currrentIndex = 0;
  List<BottomNavigationBarItem>  bottomItem = const[
     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'setting'),
    BottomNavigationBarItem(icon: Icon(Icons.question_mark_outlined), label: 'help'),
  ];
  void changeNavBar(index) {
    currrentIndex = index;
    emit(changeNavBarState());
  }
}
