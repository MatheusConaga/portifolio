import 'package:flutter/cupertino.dart';
import 'package:portifolio/styles/appColors.dart';
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

    Widget projectContainer = GestureDetector(
      onTap: () async {
        if (widget.link.isNotEmpty) {
          await launchUrl(Uri.parse(widget.link), mode: LaunchMode.externalApplication);
        }
      },
      child: Container(
        width: largura * 0.2,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.darkblue.withOpacity(0.9),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowblue.withOpacity(0.8),
              spreadRadius: 2,
              offset: const Offset(20, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              widget.image,
              width: largura * 0.12,
            ),
            Text(
              widget.title,
              style: TextStyle(
                color: AppColors.white,
                fontSize: largura * 0.016,
                fontWeight: FontWeight.bold,
              ),
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
                  fontSize: largura * 0.013,
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