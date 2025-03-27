import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portifolio/components/secao.dart';
import 'package:portifolio/styles/appColors.dart';
import 'package:portifolio/styles/spacing.dart';

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
            Container(
              padding: EdgeInsets.only(right: 50, left: 50),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Me chamo Matheus Phillipe Lula Souza, tenho 22 anos. "
                          "Possuo uma certa experiência na construção de aplicativos com uso do ",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: largura * 0.015,
                      ),
                    ),
                    TextSpan(
                      text: "Flutter",
                      style: TextStyle(
                        color: AppColors.info,
                        fontSize: largura * 0.015,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: " e ",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: largura * 0.015,
                      ),
                    ),
                    TextSpan(
                      text: "React Native",
                      style: TextStyle(
                        color: AppColors.info,
                        fontSize: largura * 0.015,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: ", mas sempre busco aprimorar minhas habilidades, explorando também novas tecnologias como o ",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: largura * 0.015,
                      ),
                    ),
                    TextSpan(
                      text: "Kotlin",
                      style: TextStyle(
                        color: AppColors.info,
                        fontSize: largura * 0.015,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: ". Estou sempre em busca de desafios que me permitam evoluir como profissional e transformar ideias em experiências na palma da mão."
                          " Seja bem-vindo ao meu portfólio!",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: largura * 0.015,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.justify,
              )

            ),
            
          ],
        ),
    );
  }
}
