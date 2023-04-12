
import 'package:flutter/material.dart';
import 'package:pet_adoption/model/petDetailsArgumentModel.dart';
import 'package:pet_adoption/model/pet_data.dart';
import 'package:pet_adoption/src/ui/screens/adoptionHistoryScreen.dart';
import 'package:pet_adoption/src/ui/screens/HomeScreen/home_screen.dart';
import 'package:pet_adoption/src/ui/screens/petDetailScreen.dart';
import 'package:pet_adoption/src/ui/screens/photo_viewer_screen.dart';

import '../screens/splashScreen.dart';

class Routes{

  static const String splashScreen = '/';
  static const String homeScreen = 'homeScreen';
  static const String petDetailScreen = 'petDetailScreen';
  static const String adoptionHistoryScreen = 'adoptionHistoryScreen';
  static const String photoViewerScreen = 'photoViewerScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );


      case homeScreen:
        return MaterialPageRoute(
          builder: (context) =>  HomeScreen(),
        );

      case petDetailScreen:
        final args = settings.arguments as dynamic;
        return MaterialPageRoute(
          builder: (context) =>  PetDetailScreen(
            petDataItem: args?["petDataItem"]??PetDataItem(),
          ),
        );

      case adoptionHistoryScreen:
        return MaterialPageRoute(
          builder: (context) => const AdoptionHistoryScreen(),
        );

      case photoViewerScreen:
        final args = settings.arguments as dynamic;
        return MaterialPageRoute(
          builder: (context) =>  PhotoViewerScreen(assetImage: args?["asset"]??"", id: args?["id"]??"",),
        );
      default:
        return MaterialPageRoute(builder: (contex) {
          return const Scaffold(
            body: Center(
              child: Text("404 routes not found"),
            ),
          );
        });
    }
  }


}