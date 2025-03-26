import 'package:flutter/material.dart';
import 'package:portifolio/pages/apresentacao.dart';
import 'package:portifolio/pages/contato.dart';
import 'package:portifolio/pages/direitos.dart';
import 'package:portifolio/pages/projetos.dart';
import 'package:portifolio/pages/sobre.dart';
import 'package:portifolio/styles/appColors.dart';
import 'package:portifolio/styles/spacing.dart';

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
        toolbarHeight: Dbar,
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
              Apresentacao(),
              Sobre(),
              Projetos(),
              Contato(),
              Direitos(),
            ],
          ),
      ),

    );
  }
}
