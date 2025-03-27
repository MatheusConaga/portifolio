import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portifolio/components/secao.dart';
import 'package:portifolio/styles/appColors.dart';
import 'package:portifolio/styles/spacing.dart';
import 'package:url_launcher/url_launcher.dart';


class Contato extends StatefulWidget {
  const Contato({super.key});

  @override
  State<Contato> createState() => _ContatoState();
}

class _ContatoState extends State<Contato> {
  @override
  Widget build(BuildContext context) {

    var largura = MediaQuery.of(context).size.width ;
    var altura = MediaQuery.of(context).size.height;

    return Container(
      child: Column(
        children: [
          Secao(titulo: "Contato"),
          IntrinsicWidth(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.darkblue.withOpacity(0.9),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowblue.withOpacity(0.8),
                    spreadRadius: 2,
                    offset: Offset(20, 10),
                  ),
                ],
              ),
              padding: EdgeInsets.all(largura * 0.02),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () async {
                          final Uri emailUri = Uri.parse(
                              "https://mail.google.com/mail/?view=cm&fs=1&to=matheusphillip170@gmail.com&su=Contato%20via%20Portfólio");
                          if (await canLaunchUrl(emailUri)) {
                            await launchUrl(emailUri, mode: LaunchMode.externalApplication);
                          } else {
                            print("Não foi possível abrir o Gmail");
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/tecno/email.png",
                              width: largura * 0.03,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "matheusphillip170@gmail.com",
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: largura * 0.015,
                                  // decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () async {
                            await launchUrl(Uri.parse("https://github.com/MatheusConaga"),mode: LaunchMode.externalApplication);
                          },
                          child: Image.asset(
                            "assets/tecno/github.png",
                            width: largura * 0.04,
                          ),
                        ),
                      ),
                      SizedBox(width: largura * 0.03,),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () async{
                            await launchUrl(Uri.parse("https://linkedin.com/in/matheusconaga-devmobile"), mode: LaunchMode.externalApplication);
                          },
                          child: Image.asset(
                            "assets/tecno/linkedin.png",
                            width: largura * 0.04,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
