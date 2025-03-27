import 'package:flutter/material.dart';
import 'package:portifolio/styles/appColors.dart';
import 'package:portifolio/styles/responsive.dart';
import 'package:url_launcher/url_launcher.dart';


class Button extends StatefulWidget {
  const Button({
    required this.title,
    this.link = "",
    super.key
  });

  final String title;
  final String link;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {

  // double fontSizeGrande = Responsive.isMobile(context) ? 20 : (Responsive.isTablet(context) ? 26 : 40);

  @override
  Widget build(BuildContext context) {

    double fontSizePequeno = Responsive.isMobile(context) ? 14 : (Responsive.isTablet(context) ? 16 : 20);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.blue,
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        foregroundColor: AppColors.darkblue,
      ),
        onPressed: () async{
          if (widget.link.isNotEmpty){
           await launchUrl(Uri.parse(widget.link), mode: LaunchMode.externalApplication);
          }
        },
        child: Text(
          widget.title,
          style: TextStyle(
            color: AppColors.white,
            fontSize: fontSizePequeno,
            fontWeight: FontWeight.bold,
          ),
        ),
    );
  }
}
