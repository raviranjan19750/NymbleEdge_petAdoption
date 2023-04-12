import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:pet_adoption/src/ui/utils/di_module.dart';

import '../../../../model/pet_data.dart';
import '../../../ui/utils/shared_pref.dart';

part 'adopted_pet_list_screen_state.dart';

class AdoptedPetListScreenCubit extends Cubit<AdoptedPetListScreenState> {
  AdoptedPetListScreenCubit() : super(AdoptedPetListScreenInitial());

  List<PetDataItem> petDataList = [];
  List<PetDataItem> adoptedPetDataList = [];

  getSharedPrefData(BuildContext context) async {
    emit(AdoptedPetListScreenLoading());

    if (await getIt<SharedPref>().containsData() == true) {
      var petData = await getIt<SharedPref>().retrieveData();

      adoptedPetDataList =
          petData.where((element) => element.isAdopted == true).toList();
      adoptedPetDataList.sort((a, b)=>(b.timeStamp as num).compareTo(a.timeStamp as num));

      emit(AdoptedPetListScreenLoadingSuccessfulState(
          petDataList: adoptedPetDataList));
    } else {
      adoptedPetDataList.clear();

      emit(AdoptedPetListScreenLoadingSuccessfulState(
          petDataList: adoptedPetDataList));
    }
  }
}
