import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portifolio/components/secao.dart';
import 'package:portifolio/styles/appColors.dart';

class Sobre extends StatelessWidget {
  const Sobre({super.key});

  @override
  Widget build(BuildContext context) {

    var largura = MediaQuery.of(context).size.width ;
    var altura = MediaQuery.of(context).size.height;

    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           Secao(titulo: "Sobre mim"),
            Padding(
              padding: EdgeInsets.only(top: altura * 0.04, left: largura * 0.04, right: largura * 0.04),
              child: Container(
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: AppColors.blue.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
    "Me chamo Matheus Phillipe Lula Souza, tenho 22 anos."
   " Possuo um certa experiência na contrução de aplicativos com uso do Flutter e React Native, mas sempre busco aprimorar minhas habilidades, explorando também novas tecnologias como o Kotlin.\n"
    "Estou sempre em busca de desafios que me permitam evoluir como profissional e transformar ideias em experiências na palma da mão."
   "Seja bem-vindo ao meu portifólio!",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize:  largura * 0.02,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            
          ],
        ),
    );
  }
}
