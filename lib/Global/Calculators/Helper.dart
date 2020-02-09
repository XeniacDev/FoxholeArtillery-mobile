import 'dart:math';
import 'package:foxhole_artillery/Global/Global.dart';

class Helper {
  static String currentError;
  static String currentRadioTitle;

// Helper methods
  static convert_angle(angle) {
    return ((angle > 360) ? angle - 360 : angle);
  }

  static rad(angle) {
    return (pi * angle / 180);
  }

  static deg(angle) {
    return (angle * 180 / pi);
  }

//  static numberConverter(number) {
//    return int.tryParse(number);
//  }

  static roundNumbersByFive(number) {
    num temp = number / 5;

//    return number % 5 < 3 ? (number % 5 == 0 ? number : Math.floor(number / 5) * 5) : Math.ceil(number / 5) * 5;
    return number % 5 < 3
        ? (number % 5 == 0 ? number : temp.floor() * 5)
        : temp.ceil() * 5;
  }

  static floatNumbersRounding(number) {
    var result = 0;
    var placeholder;

    // we need to split number to two parts
    String numberSplitter = number.toString();
    List<String> numberSplitterList = numberSplitter.split(".");

    placeholder = numberSplitterList;
    int numberFloatPart = int.parse(numberSplitterList[1]);

    if (numberFloatPart != 5) {
      result = roundNumbersByFive(numberFloatPart);
      if (result == 10) {
        result = int.parse(placeholder[0]);
        return result += 1;
      } else {
        if (result == 5) {
          // convert array to number
          String placeholderIntNumber = placeholder[0].toString();

          return double.parse((placeholderIntNumber + '.' + result.toString()));
        } else {
          return int.parse(placeholder[0]);
        }
      }
    } else {
      return number;
    }
  }

  static targetRangeChecker(correctCoords, artilleryType) {
    var ranges = artilleryType;
    var result = false;
    if (correctCoords > ranges["MaxRange"] ||
        correctCoords < ranges["MinRange"]) {
      result = true;
      if (correctCoords > ranges["MaxRange"]) {
        currentError = errorList["farTarget"];
      } else if (correctCoords < ranges["MinRange"]) {
        currentError = errorList["closeTarget"];
      }
    } else {
      // errorLabel.classList.add("display_none");
      currentError = errorList["happyHunting"];
    }
    return result;
  }

  // use this for data validation
  static isValid(
      enemyDisValue, enemyAzimValue, friendlyDisValue, friendlyAzimValue) {
    var isValid = true;
    // Conditions
    // 1. dis === dis and azim === azim
    if ((enemyDisValue == friendlyDisValue &&
        enemyAzimValue == friendlyAzimValue)) {
      isValid = false;
    }
    // more errors if we need :)
    return isValid;
  }

  static calcData(e_dist, e_azi, f_dist, f_azi) {
    var a_delt;
    var r_dist;
    var a_step;
    var r_azi;

//    //convert user inputs to int
//    e_dist = numberConverter(e_dist);
//    e_azi = numberConverter(e_azi);
//    f_dist = numberConverter(f_dist);
//    f_azi = numberConverter(f_azi);

    a_delt = (e_azi > f_azi) ? rad(e_azi - f_azi) : rad(f_azi - e_azi);

    r_dist = sqrt(
        e_dist * e_dist + f_dist * f_dist - 2 * e_dist * f_dist * cos(a_delt));

    if (r_dist >= 45 && e_dist != 0) {
      var temp = deg(acos(
          (-(e_dist * e_dist) + f_dist * f_dist + r_dist * r_dist) /
              (2 * f_dist * r_dist)));
      a_step = temp.round();

      if (convert_angle(deg(a_delt)) > 180) {
        r_azi = (e_azi > f_azi) ? f_azi + 180 + a_step : f_azi + 180 - a_step;
      } else {
        //r_azi = (e_azi > f_azi) ? f_azi + 180 - a_step : f_azi + 180 + a_step;
        if (e_azi > f_azi) {
          r_azi = f_azi + 180 - a_step;
        } else {
          r_azi = f_azi + 180 + a_step;
        }
      }

      r_azi = convert_angle(r_azi.round()).toDouble();

      // check if dis is higher than maxRange || minRange
      // ..

      WriteResults(r_dist, r_azi);
    }
  }

  // we use this class to show best coords as possbile
  static correctedDistance(distance, Artilleryobject) {
    var result;
    var floatDistance = distance;
    floatDistance = double.parse(distance.toStringAsFixed(1));

    switch (Artilleryobject) {
      case "Field Artillery":

      case "Gunboat":
        var intDistance = floatDistance.round();
        // get next and previous number
        var nextNumber = intDistance + 1;

        if ((floatDistance - intDistance) < (nextNumber - floatDistance)) {
          // close to previous number
          result = floatDistance.round();
        } else {
          result = floatDistance.round();
        }
        break;
      case "Howitzer":
        result = floatNumbersRounding(floatDistance);
        result = roundNumbersByFive(result);
        break;
      case "Mortar":
        result = floatNumbersRounding(floatDistance);
        break;
    }
    return result;
  }

  static WriteResults(resultDistance, resultAzimuth) {
    var correctCoordinates;
    // .. save R_dis by one floating point
    // .. check for how increase distance
    // .... first we need to know what type of arty is checked right now
    // .... after that we can access the Max and min rnage
    // .... check for maxRange and minRange errors
    switch (currentRadioTitle) {
      case "Field Artillery":
        correctCoordinates = correctedDistance(
          resultDistance,
          // send arty-type data for calculate the distance for each arty
          currentRadioTitle,
        );
        targetRangeChecker(
            correctCoordinates, artilleryRanges["Field Artillery"]);
        break;
      case "Gunboat":
        correctCoordinates = correctedDistance(
          resultDistance,
          // send arty-type data for calculate the distance for each arty
          currentRadioTitle,
        );
        targetRangeChecker(correctCoordinates, artilleryRanges["Gunboat"]);
        break;
      case "Howitzer":
        correctCoordinates = correctedDistance(
          resultDistance,
          // send arty-type data for calculate the distance for each arty
          currentRadioTitle,
        );
        targetRangeChecker(correctCoordinates, artilleryRanges["Howitzer"]);
        break;
      case "Mortar":
        correctCoordinates = correctedDistance(
          resultDistance,
          // send arty-type currentRadioTitle for calculate the distance for each arty
          currentRadioTitle,
        );
        targetRangeChecker(correctCoordinates, artilleryRanges["Mortar"]);
        break;
    }
    // write the data
    resultDistance = correctCoordinates;

    Global.enemyCoordinates["distance"] = resultDistance.toString();
    Global.enemyCoordinates["azimuth"] = resultAzimuth.toString();
  }

  // Arty ranges
  static const Map<String, Map<String, double>> artilleryRanges = {
    "Mortar": {
      "MinRange": 45,
      "MaxRange": 65,
    },
    "Howitzer": {
      "MinRange": 75,
      "MaxRange": 150,
    },
    "Gunboat": {
      "MinRange": 50,
      "MaxRange": 100,
    },
    "Field Artillery": {
      "MinRange": 75,
      "MaxRange": 150,
    }
  };

  static Map<String, String> errorList = {
    "emptyFields": "Fields can not be empty",
    "closeTarget": "Target is too close",
    "farTarget": "Target is too far",
    "sameCoords": "Coordinates must not be the same.",
    "lowRange": "distance can't be less than 45m",
    "happyHunting": "Happy hunting",
    "cantCopy": "There're no coords for copying",
    "canCopy": "Copied to clipboard"
  };
}
