import 'package:flutter/material.dart';
import 'package:get/get.dart';

class priceButlerGridViewBuilder extends StatelessWidget {
  final int crossAxisCount;
  final int itemCount;
  final double crossAxisSpacing;
  final double? childAspectRatio;
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
    this.childAspectRatio,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: mainAxisSpacing),
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
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        );
      },
    );
  }
}

class wishListGridViewBuilder extends StatelessWidget {
  final int crossAxisCount;
  final int itemCount;
  final double crossAxisSpacing;
  final double? childAspectRatio;
  final double mainAxisSpacing;
  final List<String> productsList;
  final List<String>? productsDescription;
  final TextStyle textStyle;

  final List<String>? productsName;

  const wishListGridViewBuilder({
    required this.crossAxisCount,
    required this.crossAxisSpacing,
    required this.mainAxisSpacing,
    required this.itemCount,
    required this.productsList,
    this.productsName,
    required this.textStyle,
    this.childAspectRatio,
    this.productsDescription,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
        childAspectRatio: childAspectRatio!.toDouble(),
      ),
      itemCount: itemCount,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Card(
          child: Column(
            children: [
              Image.asset(productsList[index]).paddingAll(10),
              Text(
                productsName![index],
                style: textStyle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                productsDescription![index],
                style: textStyle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      },
    );
  }
}
