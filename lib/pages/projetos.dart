import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portifolio/components/button.dart';
import 'package:portifolio/components/projectItem.dart';
import 'package:portifolio/components/secao.dart';
import 'package:portifolio/styles/appColors.dart';

class Projetos extends StatefulWidget {
  const Projetos({super.key});

  @override
  State<Projetos> createState() => _ProjetosState();
}

class _ProjetosState extends State<Projetos> {
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Secao(titulo: "Projetos"),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Wrap(
            alignment: WrapAlignment.spaceEvenly,
            runSpacing: 10,
            children: [
              ProjectItem(
                title: "Delta Comerce",
                descript: "Sistema de postagem e compra de produtos",
                image: "assets/projeto/deltacomerce.webp",
                link: "https://github.com/MatheusConaga/olx_clone",
              ),
              ProjectItem(
                title: "Em Breve!",
                image: "assets/projeto/indisponivel.webp",
                // link: "https://github.com/MatheusConaga/olx_clone",
              ),
              ProjectItem(
                title: "Em Breve!",
                image: "assets/projeto/indisponivel.webp",
                // link: "https://github.com/MatheusConaga/olx_clone",
              ),
            ],
          ),
        ),
        SizedBox(height: 30,),
        Button(title: "Ver todos os trabalhos"),
      ],
    );
  }
}
