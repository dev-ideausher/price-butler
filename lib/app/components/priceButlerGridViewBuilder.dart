import 'package:flutter/material.dart';
import 'package:get/get.dart';

class priceButlerGridViewBuilder extends StatelessWidget {
  final int crossAxisCount;
  final int itemCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final List<String> productsList;
  final TextStyle textStyle;

  final List<String> productsName;

  const priceButlerGridViewBuilder({
    required this.crossAxisCount,
    required this.crossAxisSpacing,
    required this.mainAxisSpacing,
    required this.itemCount,
    required this.productsList,
    required this.productsName,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
      ),
      itemCount: itemCount,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Card(
              child: Image.asset(productsList[index]).paddingAll(10),
            ),
            // Adjust the spacing between the image and text
            Text(
              productsName[index],
              style: textStyle,
            ),
          ],
        );
      },
    );
  }
}
