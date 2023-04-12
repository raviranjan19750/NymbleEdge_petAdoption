 import 'package:flutter/material.dart';

const MaterialColor primary = MaterialColor(_primaryPrimaryValue, <int, Color>{
  50: Color(0xFFE6ECEC),
  100: Color(0xFFC1CFCF),
  200: Color(0xFF98B0B0),
  300: Color(0xFF6E9090),
  400: Color(0xFF4F7878),
  500: Color(_primaryPrimaryValue),
  600: Color(0xFF2B5858),
  700: Color(0xFF244E4E),
  800: Color(0xFF1E4444),
  900: Color(0xFF133333),
});
 const int _primaryPrimaryValue  = 0xFF306060;

 const MaterialColor primaryAccent  = MaterialColor(_primaryAccentValue, <int, Color>{
  100: Color(0xFF73FFFF),
  200: Color(_primaryAccentValue),
  400: Color(0xFF0DFFFF),
  700: Color(0xFF00F2F2),
});
 const int _primaryAccentValue = 0xFF40FFFF;