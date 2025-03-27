import 'package:flutter/material.dart';
import 'package:portifolio/components/button.dart';
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Padding(
           padding: EdgeInsets.only(right: 20),
         child:  Container(
           width: largura * 0.2,
           height: largura * 0.2,
           decoration: BoxDecoration(
             shape: BoxShape.circle,
             border: Border.all(
               color: Colors.white,
               width: largura * 0.005,
             ),
             image: DecorationImage(
               image: AssetImage("assets/images/perfil_port.png"),
               fit: BoxFit.cover,
             ),
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
                  fontSize: largura * 0.02,
                ),
              ),
              Text(
                "Matheus Lula",
                style: TextStyle(
                  color: AppColors.info,
                  fontWeight: FontWeight.bold,
                  fontSize: largura * 0.03,
                ),
              ),

              Container(
                width: largura * 0.3,
                height: largura * 0.004,
                color: Colors.white,
              ),
              Text(
                "Desenvolvedor Mobile",
                style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: largura * 0.02,
                ),
              ),
              SizedBox(height: 10,),
              Button(title: "Currículo CV", link: "https://www.canva.com/design/DAGiHbyWMs0/XhE6RPf_7el6Zaut96lmpw/edit?utm_content=DAGiHbyWMs0&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton",),
            ],
          ),
        ],
      ),
    );
  }
}
