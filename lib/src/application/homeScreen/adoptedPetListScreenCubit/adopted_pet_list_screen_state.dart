part of 'adopted_pet_list_screen_cubit.dart';

@immutable
abstract class AdoptedPetListScreenState {}

class AdoptedPetListScreenInitial extends AdoptedPetListScreenState {}

class AdoptedPetListScreenLoading extends AdoptedPetListScreenState {}

class AdoptedPetListScreenLoadingSuccessfulState
    extends AdoptedPetListScreenState {
  AdoptedPetListScreenLoadingSuccessfulState({this.petDataList});

  final List<PetDataItem>? petDataList;
}

class AdoptedPetListScreenLoadingFailureState
    extends AdoptedPetListScreenState {
  AdoptedPetListScreenLoadingFailureState({this.failureMessage});

  final String? failureMessage;
}
