import 'package:flutter/cupertino.dart';
import 'package:portifolio/styles/appColors.dart';
import 'package:portifolio/styles/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectItem extends StatefulWidget {
  const ProjectItem({
    required this.title,
    this.descript = "",
    this.link = "",
    required this.image,
    super.key,
  });

  final String title;
  final String descript;
  final String link;
  final String image;

  @override
  State<ProjectItem> createState() => _ProjectItemState();
}

class _ProjectItemState extends State<ProjectItem> {
  @override
  Widget build(BuildContext context) {

    var largura = MediaQuery.of(context).size.width;
    var altura = MediaQuery.of(context).size.height;

    double fontSizeTitle = Responsive.isMobile(context) ? 16 : (Responsive.isTablet(context) ? 22 : 25);

    double containerWidth = Responsive.isMobile(context) ? largura * 0.35
        : (Responsive.isTablet(context) ? largura * 0.35 : largura * 0.22);

    double containerHeight = Responsive.isMobile(context) ? altura * 0.35
        : (Responsive.isTablet(context) ? altura * 0.4 : altura * 0.5);

    double borda = Responsive.isMobile(context) ? 5
        : (Responsive.isTablet(context) ? 10 : 20);

    double fontTitle = Responsive.isMobile(context) ? 14 : (Responsive.isTablet(context) ? 20 : 25);

    double fontDescript = Responsive.isMobile(context) ? 10 : (Responsive.isTablet(context) ? 16 : 20);

    double imageSize = Responsive.isMobile(context)
        ? largura * 0.2
        : Responsive.isTablet(context)
        ? largura * 0.15
        : largura * 0.12;

    Widget projectContainer = GestureDetector(
      onTap: () async {
        if (widget.link.isNotEmpty) {
          await launchUrl(Uri.parse(widget.link), mode: LaunchMode.externalApplication);
        }
      },
      child: Container(
        height: containerHeight,
        width: containerWidth,
        padding: const EdgeInsets.all(10),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              widget.image,
              width: imageSize,
            ),
            Text(
              widget.title,
              style: TextStyle(
                color: AppColors.white,
                fontSize: fontTitle,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            if (widget.descript.isNotEmpty) ...[
              Container(
                width: largura * 0.5,
                height: largura * 0.002,
                color: AppColors.white,
              ),
              Text(
                widget.descript,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: fontDescript,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );

    return widget.link.isNotEmpty
        ? MouseRegion(cursor: SystemMouseCursors.click, child: projectContainer)
        : projectContainer;
  }
}