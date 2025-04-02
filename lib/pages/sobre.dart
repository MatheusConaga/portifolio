import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portifolio/components/secao.dart';
import 'package:portifolio/styles/appColors.dart';
import 'package:portifolio/styles/responsive.dart';

class Sobre extends StatelessWidget {
  const Sobre({super.key});

  @override
  Widget build(BuildContext context) {

    double fontSizePequena = Responsive.isMobile(context) ? 14 : (Responsive.isTablet(context) ? 18 : 22);

    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           Secao(titulo: "Sobre mim"),
            Container(
              padding: EdgeInsets.only(right: 10, left: 10),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Me chamo Matheus Phillipe Lula Souza, tenho 22 anos. "
                          "Possuo uma certa experiência na construção de aplicativos com uso do ",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: fontSizePequena,
                      ),
                    ),
                    TextSpan(
                      text: "Flutter",
                      style: TextStyle(
                        color: AppColors.info,
                        fontSize: fontSizePequena,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: " e ",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: fontSizePequena,
                      ),
                    ),
                    TextSpan(
                      text: "React Native",
                      style: TextStyle(
                        color: AppColors.info,
                        fontSize: fontSizePequena,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: ", mas sempre busco aprimorar minhas habilidades, explorando também novas tecnologias como o ",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: fontSizePequena,
                      ),
                    ),
                    TextSpan(
                      text: "Kotlin",
                      style: TextStyle(
                        color: AppColors.info,
                        fontSize: fontSizePequena,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: ". Estou sempre em busca de desafios que me permitam evoluir como profissional e transformar ideias em experiências na palma da mão."
                          " Seja bem-vindo ao meu portfólio!",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: fontSizePequena,
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
