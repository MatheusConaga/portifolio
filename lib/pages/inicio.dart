import 'package:flutter/material.dart';
import 'package:portifolio/styles/appColors.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text("Matheus Lula", style: TextStyle(color: Colors.white)),
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
        padding: EdgeInsets.only(top: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 8,
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
                      fontSize: 40,
                    ),
                  ),
                  Text(
                    "Matheus Lula",
                    style: TextStyle(
                      color: AppColors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 60,
                    ),
                  ),

                  Container(
                    width: 600,
                    height: 3,
                    color: Colors.white,
                  ),
                  Text(
                    "Desenvolvedor Mobile",
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),

                  Row(
                    children: [
                      Image.asset(
                        "assets/tecno/flutter.png",
                        width: 50,
                      ),
                      SizedBox(width: 20,),
                      Image.asset(
                        "assets/tecno/react.png",
                        width: 50,
                      ),
                      SizedBox(width: 20,),
                      Image.asset(
                        "assets/tecno/kotlin.png",
                        width: 50,
                      ),
                    ],
                  ),

                ],
              ),
            ],
          ),

      ),
    );
  }
}
