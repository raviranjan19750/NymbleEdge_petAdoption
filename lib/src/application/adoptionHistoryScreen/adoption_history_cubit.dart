import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'adoption_history_state.dart';

class AdoptionHistoryCubit extends Cubit<AdoptionHistoryState> {
  AdoptionHistoryCubit() : super(AdoptionHistoryInitial());
}
