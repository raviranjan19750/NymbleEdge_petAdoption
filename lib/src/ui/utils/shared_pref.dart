
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/pet_data.dart';

class SharedPref {
  SharedPref();

  saveData(List<PetDataItem> petDataList)async {

    try{
      final instance = await SharedPreferences.getInstance();
      String jsonString = jsonEncode(petDataList);
      await instance.setString("data", jsonString);
    }catch(e){
      debugPrint(e.toString());
    }

  }

  Future<List<PetDataItem>> retrieveData() async{

    final instance = await SharedPreferences.getInstance();
    String? jsonString = instance.getString("data");
    List<dynamic> mapData = jsonDecode(jsonString??"");

    List<PetDataItem> petDataList = mapData.map((e) => PetDataItem.fromJson(e)).toList();
    return petDataList;

  }

  Future<bool> clearData() async {
    final instance = await SharedPreferences.getInstance();
    return instance.clear();
  }

  Future<bool> containsData() async{
    final instance = await SharedPreferences.getInstance();
    String? data = instance.getString('data');
    List<dynamic> mapData = jsonDecode(data??"[]");

    List<PetDataItem> petDataList = mapData.map((e) => PetDataItem.fromJson(e)).toList();
    if (petDataList.isEmpty) {
     return false;
    } else {
      return true;
    }
  }
}