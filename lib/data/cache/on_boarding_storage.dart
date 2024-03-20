
import 'package:shared_preferences/shared_preferences.dart';


const String onBoarding="onBoarding";

void saveOnBoardingState() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool(onBoarding,true);
}

Future<bool> passOnBoarding() async {
  var prefs=await SharedPreferences.getInstance();
  return prefs.getBool(onBoarding)==true;
}




