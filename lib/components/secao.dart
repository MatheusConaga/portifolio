import 'package:flutter/material.dart';
import 'package:portifolio/styles/appColors.dart';

class Secao extends StatelessWidget {
  const Secao({
    required this.titulo,
    super.key
  });

  final String titulo;

  @override
  Widget build(BuildContext context) {

    var largura = MediaQuery.of(context).size.width ;

    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(
            Icons.arrow_forward_rounded,
            color: AppColors.blue,
            size: largura * 0.04,
          ),
          SizedBox(width: largura * 0.01,),
          Text(
            this.titulo,
            style: TextStyle(
              color: AppColors.blue,
              fontSize: largura * 0.03,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
