import 'package:flutter/material.dart';
import 'package:portifolio/styles/appColors.dart';
import 'package:portifolio/styles/responsive.dart';

class TecnoItem extends StatelessWidget {
  final String info;
  final List<Widget> children;

  const TecnoItem({
    required this.info,
    required this.children,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var largura = MediaQuery.of(context).size.width;

    double fontSizeTitle = Responsive.isMobile(context) ? 16 : (Responsive.isTablet(context) ? 22 : 25);

    int itemsPerRow = Responsive.isMobile(context) ? 1
        : (Responsive.isTablet(context) ? 2 : 3);

    double containerWidth = (largura / itemsPerRow) * 0.8;

    bool isMobile = Responsive.isMobile(context);

    return Container(
      width: containerWidth,
      padding: EdgeInsets.all(fontSizeTitle),
      decoration: BoxDecoration(
        color: AppColors.darkblue.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            info,
            style: TextStyle(
              color: AppColors.info,
              fontSize: fontSizeTitle,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: largura * 0.012,),
          Column(
            children: children,
          ),
        ],
      ),
    );
  }
}
