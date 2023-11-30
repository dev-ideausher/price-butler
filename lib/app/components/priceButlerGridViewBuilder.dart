import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pricebutler/app/services/colors.dart';
import 'package:pricebutler/app/services/responsive_size.dart';

import '../services/text_style_util.dart';
import 'horizontalListViewBuilder.dart';

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
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: childAspectRatio!.toDouble(),
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
  final List<String> availableStores;
  final List productDescription;
  final List productCurrentPrice;
  final List? productPastPrice;
  final List productTotalReview;
  final List productRating;
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
    required this.productDescription,
    required this.productCurrentPrice,
    required this.productPastPrice,
    required this.productTotalReview,
    required this.productRating,
    required this.availableStores,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
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
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const priceGraph().paddingOnly(right: 30),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        CupertinoIcons.xmark,
                        size: 18.kh,
                      ),
                    )
                  ],
                ).paddingOnly(bottom: 4.kh, top: 16.kh),
                Center(
                    child: Image.asset(
                  productsList[index],
                  height: 100.kh,
                ).paddingOnly()),
                Divider(
                  color: context.progressBarColor,
                  thickness: 1,
                  height: 4.kh,
                ),
                Text(
                  productsName![index],
                  style: textStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ).paddingOnly(top: 4.kh, bottom: 2.kh),
                Text(
                  productDescription![index],
                  style: TextStyleUtil.inter400(
                      fontSize: 10.kh, color: context.GreyNeutral),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ).paddingOnly(bottom: 2.kh),
                Row(
                  children: [
                    Text(
                      '\$${productCurrentPrice![index]}',
                      style: TextStyleUtil.inter500(
                          fontSize: 12.kh, color: context.GreyNeutral),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '\$${productPastPrice![index]}',
                      style: TextStyleUtil.interStrike400(
                          fontSize: 10.kh, color: context.GreyNeutral),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ).paddingOnly(bottom: 7.kh),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: const Color(0xFFF6BA1F),
                      size: 12.kw,
                    ),
                    Text(
                      "${productRating[index]}",
                      style: TextStyleUtil.inter700(
                        fontSize: 9.kh,
                        color: context.GreyNeutral,
                      ),
                    ).paddingOnly(right: 3.kw),
                    Text(
                      "${productTotalReview[index]}",
                      style: TextStyleUtil.interStrike400(
                          fontSize: 9.kh, color: context.GreyNeutral),
                    ),
                  ],
                ).paddingOnly(bottom: 5.kh),
                Row(
                  children: [
                    Text(
                      'Available On',
                      style: TextStyleUtil.inter400(
                          fontSize: 12.kh, color: context.GreyNeutral),
                    ),
                    Container(
                      height: 18.kh,
                      width: 18.kh,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xFFDEDEDE)),
                      child: Image.asset(
                        availableStores[0],
                      ),
                    ).paddingSymmetric(horizontal: 4.kw),
                    Container(
                      height: 18.kh,
                      width: 18.kh,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xFFDEDEDE)),
                      child: Image.asset(
                        availableStores[1],
                        height: 13.kh,
                        width: 13.kh,
                      ),
                    )
                  ],
                ).paddingOnly(bottom: 5.kh),
                Row(
                  children: [
                    Container(
                      height: 24.kh,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.kw),
                          border: Border.all(color: const Color(0xFFF2F2F2))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              print('buy');
                            },
                            child: Text('Buy',
                                    style: TextStyleUtil.inter400(
                                        fontSize: 10.kh, color: context.Green))
                                .paddingOnly(left: 20),
                          ),
                          SizedBox(
                            height: 12.kh,
                            child: const VerticalDivider(
                              thickness: 1,
                              color: Color(0xFFF2F2F2),
                            ),
                          ).paddingOnly(left: 15.kw, right: 15.kw),
                          GestureDetector(
                            onTap: () {
                              print('Compare');
                            },
                            child: Text('Compare',
                                    style: TextStyleUtil.inter400(
                                        fontSize: 10.kh, color: context.Green))
                                .paddingOnly(right: 15.kw),
                          ),
                        ],
                      ),
                    ).paddingOnly(top: 10),
                  ],
                )
              ],
            ).paddingSymmetric(
              horizontal: 12.kw,
            ),
          ),
        );
      },
    );
  }
}
/*
     return SizedBox(
          width: 140.kw,
          height: 278.kh,
          child: Card(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                Expanded(
                  child: Image.asset(
                    productsList[index],
                  ).paddingAll(10),
                ),
                Text(
                  productsName![index],
                  style: textStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  productDescription![index],
                  style: TextStyleUtil.inter400(
                      fontSize: 10.kh, color: context.GreyNeutral),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Text(
                      '\$${productCurrentPrice![index]}',
                      style: TextStyleUtil.inter500(
                          fontSize: 12.kh, color: context.GreyNeutral),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '\$${productPastPrice![index]}',
                      style: TextStyleUtil.interStrike400(
                          fontSize: 10.kh, color: context.GreyNeutral),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Text(
                  productDescription![index],
                  style: textStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Color(0xFFF6BA1F),
                      size: 12.kw,
                    ),
                    Text(
                      "${productRating[index]}",
                      style: TextStyleUtil.inter700(
                        fontSize: 9.kh,
                        color: context.GreyNeutral,
                      ),
                    ).paddingOnly(right: 3.kw),
                    Text(
                      "${productTotalReview[index]}",
                      style: TextStyleUtil.interStrike400(
                          fontSize: 9.kh, color: context.GreyNeutral),
                    ),
                  ],
                ).paddingOnly(top: 2.kh),
                Row(
                  children: [
                    Text(
                      'Available On',
                      style: TextStyleUtil.inter400(
                          fontSize: 12.kh, color: context.GreyNeutral),
                    )
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      availableStores[0],
                      height: 13.kh,
                      width: 13.kh,
                    ),
                    Image.asset(
                      availableStores[1],
                      height: 13.kh,
                      width: 13.kh,
                    )
                  ],
                )
              ])),
        );
 */
