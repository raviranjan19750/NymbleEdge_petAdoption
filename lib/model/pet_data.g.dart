// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PetData _$PetDataFromJson(Map<String, dynamic> json) => PetData(
      petDataList: (json['petDataList'] as List<dynamic>?)
          ?.map((e) => PetDataItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PetDataToJson(PetData instance) => <String, dynamic>{
      'petDataList': instance.petDataList,
    };

PetDataItem _$PetDataItemFromJson(Map<String, dynamic> json) => PetDataItem(
      name: json['name'] as String?,
      imageURL: json['imageURL'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      age: json['age'] as int?,
      id: json['id'] as int?,
      isAdopted: json['isAdopted'] as bool?,
      timeStamp: json['timeStamp'] as int?,
    );

Map<String, dynamic> _$PetDataItemToJson(PetDataItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'imageURL': instance.imageURL,
      'price': instance.price,
      'age': instance.age,
      'id': instance.id,
      'isAdopted': instance.isAdopted,
      'timeStamp': instance.timeStamp,
    };
