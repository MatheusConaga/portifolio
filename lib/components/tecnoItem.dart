import 'package:flutter/material.dart';
import 'package:portifolio/styles/appColors.dart';

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

    return Container(
      width: largura * 0.2,
      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
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
              fontSize: largura * 0.018,
              fontWeight: FontWeight.bold,
            ),
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
