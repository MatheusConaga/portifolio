import 'package:flutter/material.dart';
import 'package:portifolio/components/secao.dart';
import 'package:portifolio/components/tecno.dart';
import 'package:portifolio/components/tecnoItem.dart';
import 'package:portifolio/styles/appColors.dart';
import 'package:portifolio/styles/responsive.dart';

class Tecnologias extends StatelessWidget {
  const Tecnologias({super.key});

  @override
  Widget build(BuildContext context) {

    var largura = MediaQuery.of(context).size.width;
    bool isMobile = Responsive.isMobile(context);

    return Container(
      child: Column(
        children: [
          Secao(titulo: "Tecnologias"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TecnoItem(
                info: "Front-End",
                children: [
                  Tecno(title: "Flutter",image: "assets/tecno/flutter.png",),
                  SizedBox(height: largura * 0.015,),
                  Tecno(title: "React Native",image: "assets/tecno/react.png",),
                  SizedBox(height: largura * 0.015,),
                  Tecno(title: "Kotlin",image: "assets/tecno/kotlin.png",),
                ],
              ),
              TecnoItem(
                info: "Back-End",
                children: [
                  Tecno(title: "JavaScript",image: "assets/tecno/js.png",),
                  SizedBox(height: largura * 0.015,),
                  Tecno(title: "Typescript",image: "assets/tecno/ts.png",),
                  SizedBox(height: largura * 0.015,),
                  Tecno(title: "Python",image: "assets/tecno/python.png",),
                ],
              ),
              TecnoItem(
                info: "Banco de Dados",
                children: [
                  Tecno(title: "Firebase",image: "assets/tecno/firebase.png",),
                  SizedBox(height: largura * 0.015,),
                  Tecno(title: "MongoDB",image: "assets/tecno/mongo.png",),
                  SizedBox(height: largura * 0.015,),
                  Tecno(title: "Postgress",image: "assets/tecno/postg.png",),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
