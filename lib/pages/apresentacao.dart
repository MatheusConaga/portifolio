import 'package:flutter/material.dart';
import 'package:portifolio/components/button.dart';
import 'package:portifolio/styles/appColors.dart';
import 'package:portifolio/styles/responsive.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Apresentacao extends StatefulWidget {
  const Apresentacao({super.key});

  @override
  State<Apresentacao> createState() => _ApresentacaoState();
}

class _ApresentacaoState extends State<Apresentacao> {
  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;


    double imageSize = Responsive.isMobile(context)
        ? largura * 0.4
        : Responsive.isTablet(context)
        ? largura * 0.3
        : largura * 0.2;
    double fontSizePequeno = Responsive.isMobile(context) ? 16 : (Responsive.isTablet(context) ? 20 : 30);
    double fontSizeGrande = Responsive.isMobile(context) ? 22 : (Responsive.isTablet(context) ? 30 : 40);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: Responsive.isMobile(context) ? 20 : 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Responsive.isMobile(context)
              ? Column(
            children: _buildContent(imageSize, fontSizePequeno, fontSizeGrande),
          )
              : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildContent(imageSize, fontSizePequeno, fontSizeGrande),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildContent(double imageSize, double fontSizePequeno, double fontSizeGrande) {
    return [
      Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Container(
          width: imageSize,
          height: imageSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white,
              width: imageSize * 0.02,
            ),
            image: DecorationImage(
              image: AssetImage("assets/images/perfil_port.webp"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Olá, eu sou o",
            style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
              fontSize: fontSizePequeno,
            ),
          ),
          Text(
            "Matheus Lula",
            style: TextStyle(
              color: AppColors.info,
              fontSize: fontSizeGrande,
              fontFamily: 'JockeyOne',
            ),
          ),
          Container(
            width: imageSize * 1.5,
            height: 3,
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 8),
          ),
          Text(
            "Desenvolvedor Mobile",
            style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
              fontSize: fontSizePequeno,
            ),
          ),
          const SizedBox(height: 10),
          Button(
            title: "Currículo CV",
            link: "https://www.canva.com/design/DAGiHbyWMs0/XhE6RPf_7el6Zaut96lmpw/edit?utm_content=DAGiHbyWMs0&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton",
          ),
        ],
      ),
    ];
  }
}
