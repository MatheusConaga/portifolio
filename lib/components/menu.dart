import 'package:flutter/cupertino.dart';
import 'package:portifolio/components/menuItem.dart';
import 'package:flutter/material.dart';
import 'package:portifolio/styles/appColors.dart';

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
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      width: 500,
      decoration: BoxDecoration(
        color: AppColors.blue.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
    );
  }
}
