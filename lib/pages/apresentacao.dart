import 'package:flutter/material.dart';
import 'package:portifolio/styles/appColors.dart';

class Apresentacao extends StatefulWidget {
  const Apresentacao({super.key});

  @override
  State<Apresentacao> createState() => _ApresentacaoState();
}

class _ApresentacaoState extends State<Apresentacao> {
  @override
  Widget build(BuildContext context) {

    var largura = MediaQuery.of(context).size.width ;
    var altura = MediaQuery.of(context).size.height;
    var alturaBarraStatus = MediaQuery.of(context).padding.top + 20;

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: largura * 0.3,
            height: largura * 0.3,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: largura * 0.01,
              ),
              image: DecorationImage(
                image: AssetImage("assets/images/perfil_port.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Olá, eu sou o",
                style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: largura * 0.03,
                ),
              ),
              Text(
                "Matheus Lula",
                style: TextStyle(
                  color: AppColors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: largura * 0.05,
                ),
              ),

              Container(
                width: largura * 0.5,
                height: largura * 0.004,
                color: Colors.white,
              ),
              Text(
                "Desenvolvedor Mobile",
                style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: largura * 0.03,
                ),
              ),

              Row(
                children: [
                  Image.asset(
                    "assets/tecno/flutter.png",
                    width: largura * 0.04,
                  ),
                  SizedBox(width: largura * 0.01,),
                  Image.asset(
                    "assets/tecno/react.png",
                    width: largura * 0.04,
                  ),
                  SizedBox(width: largura * 0.01,),
                  Image.asset(
                    "assets/tecno/kotlin.png",
                    width: largura * 0.04,
                  ),
                ],
              ),

            ],
          ),
        ],
      ),
    );
  }
}
