
import 'package:pet_adoption/model/pet_data.dart';

class PetDetailArgumentModel{

  PetDetailArgumentModel({this.petDataItem, this.onChange});
  final PetDataItem? petDataItem;
  final Function(int?)? onChange;

}