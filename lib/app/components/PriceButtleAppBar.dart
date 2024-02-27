import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pricebutler/app/services/responsive_size.dart';

class PriceButtlerAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final Widget? leading;
  final Widget? title;
  final List<Widget>? actions;
  final bool? centerTile;
  final bool? backIcon;
  final Color? color;
  final double? elevation;

  const PriceButtlerAppBar({
    Key? key,
    this.elevation,
    this.color,
    this.leading,
    this.actions,
    this.title,
    this.centerTile,
    this.backIcon,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(56.0); // Set your preferred height

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation,
      shadowColor: Colors.black,
      backgroundColor: color ?? Colors.transparent,
      title: title,
      centerTitle: centerTile,
      leading: backIcon == false
          ? null
          : leading ??
              IconButton(
                iconSize: 30.kw,
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.black,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
      actions: actions,
    );
  }
}
