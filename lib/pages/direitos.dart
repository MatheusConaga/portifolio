import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portifolio/styles/appColors.dart';

class Direitos extends StatelessWidget {
  const Direitos({super.key});

  @override
  Widget build(BuildContext context) {

    var largura = MediaQuery.of(context).size.width ;

    return Container(
      child: Text(
        "Copyright © 2025. Desenvolvido em Flutter  por Matheus Lula.",
        style: TextStyle(
          color: AppColors.white.withOpacity(0.7),
          fontWeight: FontWeight.bold,
          fontSize: largura * 0.015,
        ),
      ),
    );
  }
}
