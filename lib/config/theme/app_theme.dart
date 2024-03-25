import 'package:flutter/material.dart';

const   Color _customColor =Color(0xFFE9A28E);

const List<Color> _colorthems =[
_customColor,
Colors.blue,
Colors.teal,
Colors.green,
Colors.yellow,
Colors.orange,
Colors.pink,

];



class AppTheme {

  final int selectedColor;

  AppTheme ({
    this.selectedColor = 0}) 
    :assert(selectedColor >= 0 && selectedColor <= _colorthems.length -1,
     'Colors must be between 0 and ${_colorthems.length} ');
  
  ThemeData theme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorthems[selectedColor]
    );
  }
}