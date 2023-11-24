import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pricebutler/app/services/responsive_size.dart';

class PriceButtlerAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String? label;
  final Widget? leading;
  final Widget? title;
  final List<Widget>? actions;
  final bool? centerTile;
  final Color? color;
  final double? elevation;
  const PriceButtlerAppBar(
      {Key? key,
      this.label,
      this.elevation,
      this.color,
      this.leading,
      this.actions,
      this.title,
      this.centerTile})
      : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(56.0); // Set your preferred height

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation,
      backgroundColor: color ?? Colors.transparent,
      title: title,
      centerTitle: centerTile,
      leading: leading ??
          IconButton(
            iconSize: 30.kw,
            icon: Icon(
              Icons
                  .arrow_back_rounded, // Your prefix icon, you can change it to your desired icon
              color: Colors.black, // Customize the icon color
            ),
            onPressed: () {
              Get.back();
            },
          ),
      actions: actions,
    );
  }
}
