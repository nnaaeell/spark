import 'package:flutter/material.dart';

double dime(context){
  double height=MediaQuery.of(context).size.height;
  double width=MediaQuery.of(context).size.width;
  return (width+height)/2;
}