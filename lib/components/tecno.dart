import 'package:flutter/material.dart';
import 'package:portifolio/styles/appColors.dart';

class Tecno extends StatelessWidget {
  const Tecno({
    required this.image,
    required this.title,
    super.key
  });

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {

    var largura = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          width: largura * 0.02,
        ),
        SizedBox(width: 10,),
        Text(
          title,
          style: TextStyle(
            color: AppColors.white,
            fontSize: largura * 0.015,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
