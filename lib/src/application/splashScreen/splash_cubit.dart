import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../model/pet_data.dart';
import '../../ui/utils/routes.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

   getSharedPrefData(BuildContext context) async {

     Future.delayed( const Duration(milliseconds: 1200), () async{
       String data = await DefaultAssetBundle.of(context)
           .loadString("assets/data/petData.json");
       List mapData = jsonDecode(data);

       List<PetDataItem> petData =
       mapData.map((e) => PetDataItem.fromJson(e)).toList();

       Navigator.of(context)
           .pushReplacementNamed(Routes.homeScreen, arguments: petData);

     });


  }
}
