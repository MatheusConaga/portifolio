import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portifolio/components/secao.dart';
import 'package:portifolio/styles/appColors.dart';
import 'package:portifolio/styles/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class Contato extends StatefulWidget {
  const Contato({super.key});

  @override
  State<Contato> createState() => _ContatoState();
}

class _ContatoState extends State<Contato> {
  @override
  Widget build(BuildContext context) {

    double largura = MediaQuery.of(context).size.width ;

    double fontSizePequena = Responsive.isMobile(context) ? 14 : (Responsive.isTablet(context) ? 18 : 20);

    double containerWidth = Responsive.isMobile(context) ? largura
        : (Responsive.isTablet(context) ? largura * 0.6 : largura * 0.45);

    double borda = Responsive.isMobile(context) ? 5
        : (Responsive.isTablet(context) ? 10 : 20);

    double pad = Responsive.isMobile(context) ? 20
        : (Responsive.isTablet(context) ? 20 : 15);

    double imageSize = Responsive.isMobile(context)
        ? largura * 0.08
        : Responsive.isTablet(context)
        ? largura * 0.05
        : largura * 0.04;


    return Container(
      child: Column(
        children: [
          Secao(titulo: "Contato"),
          IntrinsicHeight(
            child: Container(
              width: containerWidth,
              decoration: BoxDecoration(
                color: AppColors.darkblue.withOpacity(0.9),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowblue.withOpacity(0.8),
                    spreadRadius: 2,
                    offset: Offset(borda, borda * 0.5),
                  ),
                ],
              ),
              padding: EdgeInsets.only(top: pad, bottom: pad),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () async {
                          if (Responsive.isMobile(context)) {
                            final Uri emailUri = Uri(
                              scheme: 'mailto',
                              path: 'matheusphillip170@gmail.com',
                              queryParameters: {'subject': 'Contato via Portfólio'},
                            );

                            if (await canLaunchUrl(emailUri)) {
                              await launchUrl(emailUri, mode: LaunchMode.externalApplication);
                            } else {
                              print("Não foi possível abrir o aplicativo de e-mail");
                            }
                          } else {
                            final Uri emailUri = Uri.parse(
                                "https://mail.google.com/mail/?view=cm&fs=1&to=matheusphillip170@gmail.com&su=Contato%20via%20Portfólio");

                            if (await canLaunchUrl(emailUri)) {
                              await launchUrl(emailUri, mode: LaunchMode.externalApplication);
                            } else {
                              print("Não foi possível abrir o Gmail");
                            }
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/tecno/email.webp",
                              width: imageSize,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: pad),
                              child: Text(
                                "matheusphillip170@gmail.com",
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: fontSizePequena,
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
                            "assets/tecno/github.webp",
                            width: imageSize,
                          ),
                        ),
                      ),
                      SizedBox(width: pad),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () async{
                            await launchUrl(Uri.parse("https://linkedin.com/in/matheusconaga-devmobile"), mode: LaunchMode.externalApplication);
                          },
                          child: Image.asset(
                            "assets/tecno/linkedin.webp",
                            width: imageSize,
                          ),
                        ),
                      ),
                      SizedBox(width: pad),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () async{
                            await launchUrl(Uri.parse("https://www.instagram.com/lula.dev?igsh=Z29oYm1pNDVidnp6"), mode: LaunchMode.externalApplication);
                          },
                          child: Image.asset(
                            "assets/tecno/insta.webp",
                            width: imageSize,
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
