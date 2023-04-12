import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'pet_detail_state.dart';

class PetDetailCubit extends Cubit<PetDetailState> {
  PetDetailCubit() : super(PetDetailInitial());
}
