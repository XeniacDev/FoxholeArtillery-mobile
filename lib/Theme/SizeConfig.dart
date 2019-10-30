import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

/*
! Notice
  I'm using Pixel 3 XL as the main device for configing the block sizes:
  Vertical Block Size: 7.977142857142857
  Horizontal Block Size: 4.114285714285715
*/

class SizeConfig {
  static double _screenWidth;
  static double _screenHeight;
  static double _blockSizeHorizontal = 0;
  static double _blockSizeVertical = 0;

  static double textMultiplier;
  static double imageSizeMultiplier;
  static double heightMultiplier;

  void int(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
    } else {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
    }
    _blockSizeHorizontal = _screenWidth / 100;
    _blockSizeVertical = _screenHeight / 100;

    textMultiplier = _blockSizeVertical;
    imageSizeMultiplier = _blockSizeHorizontal;
    heightMultiplier = _blockSizeVertical;

    print('Vertical Block Size: ' + _blockSizeVertical.toString());
    print('Horizontal Block Size: ' + _blockSizeHorizontal.toString());
  }
}
