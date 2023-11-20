import 'package:flutter/material.dart';
import 'package:pricebutler/app/services/responsive_size.dart';

class HorizontalListViewBuilder extends StatelessWidget {
  final int itemCount;
  final List productImage;
  final List productNameList;
  const HorizontalListViewBuilder(
      {super.key,
      required this.itemCount,
      required this.productImage,
      required this.productNameList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: itemCount,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SizedBox(
              width: 140.kw,
              height: 208.kh,
              child: Card(
                  child: Column(
                children: [
                  Image.asset(productImage[index]),
                  Text(productNameList[index])
                ],
              )));
        });
  }
}
