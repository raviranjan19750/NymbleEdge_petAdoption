part of 'pet_list_screen_cubit.dart';

@immutable
abstract class PetListScreenState {}

class PetListScreenInitial extends PetListScreenState {}
class PetListScreenLoading extends PetListScreenState {}
class PetListScreenLoadingSuccessfulState extends PetListScreenState {

  PetListScreenLoadingSuccessfulState({this.petDataList});
  final List<PetDataItem>? petDataList;
}
class PetListScreenLoadingFailureState extends PetListScreenState {

  PetListScreenLoadingFailureState({this.failureMessage});
  final String? failureMessage;
}
