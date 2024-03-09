

import 'package:flutter/material.dart';

void navigateTo(BuildContext context, Widget widget) {
  Navigator.push(
      context, MaterialPageRoute(builder: (BuildContext context) => widget));
}

void navigateReplace(context, Widget widget) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (BuildContext context) => widget));
}