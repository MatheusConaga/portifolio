import 'package:flutter/cupertino.dart';
import 'package:portifolio/components/menuItem.dart';
import 'package:flutter/material.dart';
import 'package:portifolio/styles/appColors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portifolio/styles/responsive.dart';



class Menu extends StatelessWidget {
  const Menu({
    required this.scrollToSection,
    required this.currentSection,
    required this.apresentacaoKey,
    required this.sobreKey,
    required this.tecnologiasKey,
    required this.projetosKey,
    required this.contatoKey,
    super.key,
  });

  final Function(GlobalKey) scrollToSection;
  final GlobalKey currentSection;
  final GlobalKey apresentacaoKey;
  final GlobalKey sobreKey;
  final GlobalKey tecnologiasKey;
  final GlobalKey projetosKey;
  final GlobalKey contatoKey;

  @override
  Widget build(BuildContext context) {

    var largura = MediaQuery.of(context).size.width ;

    double imageSize = Responsive.isMobile(context)
        ? largura * 0.3
        : Responsive.isTablet(context)
        ? largura * 0.1
        : largura * 0.1;

    double sizeContainer = Responsive.isMobile(context)
        ? 100
        : Responsive.isTablet(context)
        ? 430
        : 500;


    return Row(
      mainAxisAlignment: Responsive.isMobile(context) ? MainAxisAlignment.end : MainAxisAlignment.center,
    children: [
      Responsive.isMobile(context) ?
      PopupMenuButton<String>(
          icon: Icon(
            Icons.menu,
            color: AppColors.white,
            size: 35,
          ),
        onSelected: (String value){
          switch (value) {
            case 'Início':
              scrollToSection(apresentacaoKey);
              break;
            case 'Sobre':
              scrollToSection(sobreKey);
              break;
            case 'Tecnologias':
              scrollToSection(tecnologiasKey);
              break;
            case 'Projetos':
              scrollToSection(projetosKey);
              break;
            case 'Contato':
              scrollToSection(contatoKey);
              break;
          }
        },
        itemBuilder: (BuildContext context) => [
          PopupMenuItem(value: "Início", child: Text("Início")),
          PopupMenuItem(value: "Sobre", child: Text("Sobre")),
          PopupMenuItem(value: "Tecnologias", child: Text("Tecnologias")),
          PopupMenuItem(value: "Projetos", child: Text("Projetos")),
          PopupMenuItem(value: "Contato", child: Text("Contato")),
        ],
      )
       : Container(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        width: sizeContainer,
        decoration: BoxDecoration(
          color: AppColors.blue.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MenuItem(
              title: "Início",
              func: () => scrollToSection(apresentacaoKey),
              isActive: currentSection == apresentacaoKey,
            ),
            MenuItem(
              title: "Sobre",
              func: () => scrollToSection(sobreKey),
              isActive: currentSection == sobreKey,
            ),
            MenuItem(
              title: "Tecnologias",
              func: () => scrollToSection(tecnologiasKey),
              isActive: currentSection == tecnologiasKey,
            ),
            MenuItem(
              title: "Projetos",
              func: () => scrollToSection(projetosKey),
              isActive: currentSection == projetosKey,
            ),
            MenuItem(
              title: "Contato",
              func: () => scrollToSection(contatoKey),
              isActive: currentSection == contatoKey,
            ),
          ],
        ),
      ),
    ],
    );
  }
}
