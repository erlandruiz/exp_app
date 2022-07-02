
import 'package:exp_app/utils/icon_List.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

extension ColorExtension on String {
  toColor(){
    String hexColor = replaceAll('#', '');
    if (hexColor.length == 6){
      hexColor = 'FF' + hexColor;
    }
    if(hexColor.length == 8){
      return Color(int.parse('0X$hexColor'));
    }
  }
}

extension IconExtension on String {
  toIcon(){
    return IconList().iconMap[this];
  }
}