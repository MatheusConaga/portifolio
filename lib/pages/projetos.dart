import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

    var largura = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: Column(
        children: [
         Secao(titulo: "Projetos"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ProjectItem(
                title: "Delta Comerce",
                descript: "Sistema de postagem e compra de produtos",
                image: "assets/projeto/deltacomerce.png",
                link: "https://github.com/MatheusConaga/olx_clone",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
