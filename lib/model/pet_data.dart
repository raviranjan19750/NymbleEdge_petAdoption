import 'package:json_annotation/json_annotation.dart';
part 'pet_data.g.dart';

@JsonSerializable()
class PetData {
  PetData({this.petDataList});

  final List<PetDataItem>? petDataList;

  factory PetData.fromJson(Map<String, dynamic> json) =>
      _$PetDataFromJson(json);

  Map<String,dynamic> toJson() => _$PetDataToJson(this);
}

@JsonSerializable()
class PetDataItem {
  PetDataItem(
      {this.name,
      this.imageURL,
      this.price,
      this.age,
      this.id,
      this.isAdopted, this.timeStamp});

   String? name;
   String? imageURL;
   double? price;
   int? age;
   int? id;
   bool? isAdopted;
   int? timeStamp;

  factory PetDataItem.fromJson(Map<String, dynamic> json) =>
      _$PetDataItemFromJson(json);

  Map<String,dynamic> toJson() => _$PetDataItemToJson(this);

}
