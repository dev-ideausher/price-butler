import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pricebutler/app/services/responsive_size.dart';

class brandListviewBuilder extends StatelessWidget {
  final int itemCount;
  final List<String> brandLogos;
  const brandListviewBuilder(
      {super.key, required this.itemCount, required this.brandLogos});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: itemCount,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: 58.0,
            height: 58.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white, // You can customize the color as needed
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(0, 1), // changes the position of the shadow
                ),
              ],
            ),
            child: Center(child: Image.asset(brandLogos[index])),
          ).paddingOnly(right: 14.kw);
        });
  }
}
