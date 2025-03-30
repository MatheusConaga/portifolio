import 'package:flutter/material.dart';
import 'package:portifolio/styles/appColors.dart';
import 'package:portifolio/styles/responsive.dart';

class MenuItem extends StatefulWidget {
  final String title;
  final VoidCallback func;
  final bool isActive;

  const MenuItem({
    required this.title,
    required this.func,
    this.isActive = false,
    super.key,
  });

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {

    double fontMenu = Responsive.isMobile(context)
        ? 12
        : Responsive.isTablet(context)
        ? 16
        : 20;


    Widget item = MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.isActive ? null : widget.func,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
            color: widget.isActive
                ? AppColors.blue
                : isHovered
                ? AppColors.shadowblue.withOpacity(0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            widget.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: fontMenu,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );

    return widget.isActive
        ? item
        : MouseRegion(cursor: SystemMouseCursors.click, child: item);
  }
}
