import 'package:flutter/material.dart';
import 'package:portifolio/pages/apresentacao.dart';
import 'package:portifolio/pages/contato.dart';
import 'package:portifolio/pages/direitos.dart';
import 'package:portifolio/pages/sobre.dart';
import 'package:portifolio/styles/appColors.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    var largura = MediaQuery.of(context).size.width ;
    var altura = MediaQuery.of(context).size.height;
    var alturaBarraStatus = MediaQuery.of(context).padding.top + 30;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: altura * 0.15,
        title: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            "Matheus Lula",
            style: TextStyle(
              color: Colors.white,
              fontSize: altura * 0.05 > 30 ? 30 : altura * 0.05,
            ),
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/barcolor.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: alturaBarraStatus),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: altura * 0.2),
                child: Apresentacao(),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: altura * 0.2),
                child: Sobre(),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: altura * 0.2),
                child: Contato(),
              ),
              Direitos(),
            ],
          ),
      ),

    );
  }
}
