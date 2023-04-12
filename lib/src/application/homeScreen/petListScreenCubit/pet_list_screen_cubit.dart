import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

import '../../../../model/pet_data.dart';
import '../../../ui/utils/di_module.dart';
import '../../../ui/utils/shared_pref.dart';

part 'pet_list_screen_state.dart';

class PetListScreenCubit extends Cubit<PetListScreenState> {
  PetListScreenCubit() : super(PetListScreenInitial());

   DateTime? currentBackPressTime;

  List<PetDataItem> filteredList = [];
  List<PetDataItem> petDataList = [];
  Timer? _debounce;

  getSharedPrefData(BuildContext context) async {


    emit(PetListScreenLoading());

    if( await getIt<SharedPref>().containsData()) {

      var petData = await getIt<SharedPref>().retrieveData();

      petDataList.clear();
      petDataList.addAll(petData);
      emit (PetListScreenLoadingSuccessfulState(petDataList: petData));

    }else{
      Future.delayed( const Duration(milliseconds: 1200), () async{
        String data = await rootBundle
            .loadString("assets/data/petData.json");
        List mapData = jsonDecode(data);

        petDataList = mapData.map((e) => PetDataItem.fromJson(e)).toList();

        emit (PetListScreenLoadingSuccessfulState(petDataList: petDataList));

      });

    }

  }

  void saveAdoptedPetData(int id)async {

    petDataList.firstWhere((element) => element.id == id).isAdopted=true;
    petDataList.firstWhere((element) => element.id == id).timeStamp=DateTime.now().millisecondsSinceEpoch;
    for(int i = 0; i<petDataList.length; i++) {
      print("pet data list : ${petDataList[i].id} ${petDataList[i].isAdopted} ${petDataList[i].timeStamp}");
    }

    await getIt<SharedPref>().saveData(petDataList);
    emit (PetListScreenLoadingSuccessfulState(petDataList: petDataList));

  }

  void searchData(String query) {

    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      emit(PetListScreenLoading());
      if(query.isEmpty){
        clearData();
      }else{
        performSearchQuery(query);
      }
    });


  }

  void performSearchQuery(String query) async {
    filteredList.clear();
    filteredList = petDataList
        .where((element) =>
        element.name!.toLowerCase().startsWith(query.toLowerCase()))
        .toList();

    // polygonDataModel =
    //     polygonDataModel.copyWith(polygonModelList: tempPolygonModelList);

    emit (PetListScreenLoadingSuccessfulState(petDataList: filteredList));


  }

  void clearData() {
    emit(PetListScreenLoading());
    filteredList.clear();
    // polygonDataModel =
    //     polygonDataModel.copyWith(polygonModelList: polygonModelList);
    emit(PetListScreenLoadingSuccessfulState(petDataList: petDataList));
    FocusManager.instance.primaryFocus?.unfocus();

  }

  Future<bool> onWillPop(BuildContext context) {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Press again to exit")));
      return Future.value(false);
    }
    return Future.value(true);
  }

}
