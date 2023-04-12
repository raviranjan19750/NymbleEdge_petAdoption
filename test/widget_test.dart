// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pet_adoption/model/pet_data.dart';
import 'package:pet_adoption/src/ui/widgets/pet_list.dart';

void main() {

  group("ScrollTestingWidget", () {
    testWidgets("should not scroll with less items", (widgetTester) async{

      List<PetDataItem> petDataList = [];
      petDataList.add(PetDataItem(name: "Buddy"));
      
      await widgetTester.pumpWidget( MaterialApp(
        home: PetList(
          petDataList: petDataList,
        ),
      ),);

      final listView = find.byKey(ValueKey("petListKey"));
      await widgetTester.drag(listView, const Offset(0, -300));
      await widgetTester.pump();
      final firstDataFinder = find.text(petDataList[0].name??"");
      expect(firstDataFinder, findsOneWidget);

    });
  });


}
