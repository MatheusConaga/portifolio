import 'package:flutter/material.dart';
import 'package:portifolio/components/button.dart';
import 'package:portifolio/components/menu.dart';
import 'package:portifolio/components/menuItem.dart';
import 'package:portifolio/pages/apresentacao.dart';
import 'package:portifolio/pages/contato.dart';
import 'package:portifolio/pages/direitos.dart';
import 'package:portifolio/pages/projetos.dart';
import 'package:portifolio/pages/sobre.dart';
import 'package:portifolio/pages/tecnologias.dart';
import 'package:portifolio/styles/appColors.dart';
import 'package:portifolio/styles/responsive.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  final ScrollController _scrollController = ScrollController();
  final GlobalKey _apresentacaoKey = GlobalKey();
  final GlobalKey _sobreKey = GlobalKey();
  final GlobalKey _tecnologiasKey = GlobalKey();
  final GlobalKey _projetosKey = GlobalKey();
  final GlobalKey _contatoKey = GlobalKey();

  GlobalKey? _currentSection;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final keys = {
      _apresentacaoKey: _apresentacaoKey.currentContext?.findRenderObject(),
      _sobreKey: _sobreKey.currentContext?.findRenderObject(),
      _tecnologiasKey: _tecnologiasKey.currentContext?.findRenderObject(),
      _projetosKey: _projetosKey.currentContext?.findRenderObject(),
      _contatoKey: _contatoKey.currentContext?.findRenderObject(),
    };

    for (var entry in keys.entries) {
      if (entry.value != null) {
        final RenderBox box = entry.value as RenderBox;
        final position = box.localToGlobal(Offset.zero).dy;
        if (position >= 0 && position < 300) {
          setState(() => _currentSection = entry.key);
          break;
        }
      }
    }
  }
  void scrollToSection(GlobalKey sectionKey) {
    final context = sectionKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      setState(() => _currentSection = sectionKey);
    }
  }


  @override
  Widget build(BuildContext context) {
    var largura = MediaQuery.of(context).size.width ;
    var altura = MediaQuery.of(context).size.height;
    var alturaBarraStatus = MediaQuery.of(context).padding.top + 30;

    double fontSizeGrande = Responsive.isMobile(context) ? 22 : (Responsive.isTablet(context) ? 24 : 30);

    double imageSize = Responsive.isMobile(context)
        ? largura * 0.14
        : Responsive.isTablet(context)
        ? largura * 0.08
        : largura * 0.07;

    double Dbordas = Responsive.isDesktop(context)
        ? 100
        : Responsive.isTablet(context)
        ? 20
        : 30;

    double Dbar = Responsive.isDesktop(context)
        ? 120
        : Responsive.isTablet(context)
        ? 80
        : 90;


    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Dbar,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Matheus",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: fontSizeGrande,
                    fontFamily: 'JockeyOne',
                  ),
                ),
                Text(
                  "Lula",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: fontSizeGrande,
                    fontFamily: 'JockeyOne',
                  ),
                ),
              ],
            ),
            SizedBox(width: 10,),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: imageSize * 0.02,),
              ),
              child: ClipOval(
                child: Image.asset(
                  "assets/images/logo_lula.png",
                  width: imageSize,
                  height: imageSize,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
              onTap: () => scrollToSection(_apresentacaoKey),
            ),
            Expanded(
              child: Menu(
              scrollToSection: scrollToSection,
              currentSection: _currentSection ?? _apresentacaoKey,
              apresentacaoKey: _apresentacaoKey,
              sobreKey: _sobreKey,
              tecnologiasKey: _tecnologiasKey,
              projetosKey: _projetosKey,
              contatoKey: _contatoKey,
            ),
            ),
          ],
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
        controller: _scrollController,
        padding: EdgeInsets.only(top: alturaBarraStatus),
          child: Container(
            padding: EdgeInsets.only(left: Dbordas, right: Dbordas),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(key: _apresentacaoKey, child: Apresentacao()),
                    Container(key: _sobreKey, child: Sobre()),
                    Container(key: _tecnologiasKey, child: Tecnologias()),
                    Container(key: _projetosKey, child: Projetos()),
                    Container(key: _contatoKey, child: Contato()),
                  ],
                ),
                Direitos(),
              ],
            ),
          ),
      ),

    );
  }
}
