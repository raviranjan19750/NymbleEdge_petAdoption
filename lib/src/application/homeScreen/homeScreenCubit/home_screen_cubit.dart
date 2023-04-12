import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:pet_adoption/src/ui/utils/color_constants.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenInitial());

  DateTime? currentBackPressTime;


  Future<bool> onWillPop(BuildContext context) {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      print("call call");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 1),
          backgroundColor: ColorConstants.greenMatte,
          content: Text("Press again to exit", style: TextStyle(color: Colors.white),)));
      return Future.value(false);
    }
    return Future.value(true);
  }
}
