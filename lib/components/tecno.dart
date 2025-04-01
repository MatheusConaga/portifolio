import 'package:flutter/material.dart';
import 'package:portifolio/styles/appColors.dart';
import 'package:portifolio/styles/responsive.dart';

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

    double fontSizePequena = Responsive.isMobile(context) ? 14 : (Responsive.isTablet(context) ? 20 : 25);

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            image,
            width: fontSizePequena,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: TextStyle(
              color: AppColors.white,
              fontSize: fontSizePequena,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
