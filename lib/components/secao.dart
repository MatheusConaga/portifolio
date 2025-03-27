import 'package:flutter/material.dart';
import 'package:portifolio/styles/appColors.dart';
import 'package:portifolio/styles/responsive.dart';

class Secao extends StatelessWidget {
  const Secao({
    required this.titulo,
    super.key
  });

  final String titulo;

  @override
  Widget build(BuildContext context) {

    var largura = MediaQuery.of(context).size.width ;

    double fontSizeGrande = Responsive.isMobile(context) ? 18 : (Responsive.isTablet(context) ? 25 : 30);

    return Padding(
      padding: EdgeInsets.only(top: largura * 0.05, bottom: largura * 0.02,),
      child: Row(
        children: [
          Icon(
            Icons.arrow_forward_rounded,
            color: AppColors.info,
            size: fontSizeGrande,
          ),
          SizedBox(width: largura * 0.01,),
          Text(
            this.titulo,
            style: TextStyle(
              color: AppColors.info,
              fontSize: fontSizeGrande,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
