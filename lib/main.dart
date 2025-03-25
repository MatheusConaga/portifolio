import 'package:flutter/material.dart';
import 'package:portifolio/pages/inicio.dart';
import 'package:portifolio/styles/appTheme.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Portifolio",
    home: Inicio(),
    theme: AppTheme.theme,
  ));
}