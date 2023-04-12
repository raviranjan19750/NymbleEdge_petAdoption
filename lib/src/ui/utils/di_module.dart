
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pet_adoption/src/application/adoptionHistoryScreen/adoption_history_cubit.dart';
import 'package:pet_adoption/src/application/homeScreen/adoptedPetListScreenCubit/adopted_pet_list_screen_cubit.dart';
import 'package:pet_adoption/src/application/homeScreen/homeScreenCubit/home_screen_cubit.dart';
import 'package:pet_adoption/src/application/homeScreen/petListScreenCubit/pet_list_screen_cubit.dart';
import 'package:pet_adoption/src/application/petDetailScreen/pet_detail_cubit.dart';
import 'package:pet_adoption/src/ui/utils/shared_pref.dart';

import '../../application/splashScreen/splash_cubit.dart';

final getIt = GetIt.instance;
void setup() {
  getIt.registerSingleton<SharedPref>(SharedPref());
  Dio dio = Dio();


  getIt.registerSingleton<Dio>(dio);

  getIt.registerFactory<SplashCubit>(() => SplashCubit());
  getIt.registerFactory<HomeScreenCubit>(() => HomeScreenCubit());
  getIt.registerFactory<PetDetailCubit>(() => PetDetailCubit());
  getIt.registerFactory<AdoptionHistoryCubit>(() => AdoptionHistoryCubit());
  getIt.registerFactory<PetListScreenCubit>(() => PetListScreenCubit());
  getIt.registerFactory<AdoptedPetListScreenCubit>(() => AdoptedPetListScreenCubit());
}