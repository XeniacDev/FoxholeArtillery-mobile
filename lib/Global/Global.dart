import "package:foxhole_artillery/HomeScreen.dart";

//Global class to find and access some variables in anywhere.
class Global {

  //Global instance of HomeScreen.dart root widget to use setState() from any place of program.
  static HomeScreenState homeScreen;

  //to realize that what ArtilleryType is selected.
  static String whatSelected="";
  //list of ArtilleryType
  static Map<String, bool> artilleryItems = {
    "Field Artillery": false,
    "GunShip": false,
    "Howitzer": false,
    "Mortar": false
  };

  //handleSelection to handle the selection of artillery types and change the current selected one.
  static void handleSelection(String whatSelect) {
    if(whatSelect != whatSelected) {
      artilleryItems[whatSelect] = true;
      artilleryItems[whatSelected] = false;
      whatSelected = whatSelect;
      homeScreen.setState(()=>null);
    } else {}
  }


}