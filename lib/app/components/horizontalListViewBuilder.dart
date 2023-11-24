import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pricebutler/app/components/common_image_view.dart';
import 'package:pricebutler/app/constants/image_constant.dart';
import 'package:pricebutler/app/routes/app_pages.dart';
import 'package:pricebutler/app/services/colors.dart';
import 'package:pricebutler/app/services/responsive_size.dart';
import 'package:pricebutler/app/services/text_style_util.dart';

class HorizontalListViewBuilder extends StatelessWidget {
  final int itemCount;
  final List productImage;
  final List productNameList;
  final bool iconStar;
  final bool cancelIcon;
  final bool compareIcon;
  final bool priceGraphIcon;
  final List productDescription;
  final List productCurrentPrice;
  final List productPastPrice;
  final List productTotalReview;
  final List productRating;
  const HorizontalListViewBuilder(
      {super.key,
      required this.itemCount,
      required this.productImage,
      required this.productNameList,
      required this.productDescription,
      required this.productCurrentPrice,
      required this.productPastPrice,
      required this.productTotalReview,
      required this.productRating,
      required this.iconStar,
      required this.cancelIcon,
      required this.compareIcon,
      required this.priceGraphIcon});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: itemCount,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Row(
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(
                    Routes.PRODUC_DETAILS,
                    arguments: {
                      'productImage': productImage[index],
                      'productName': productNameList[index],
                      'productDescription': productDescription[index],
                      'productCurrentPrice': productCurrentPrice[index],
                      'productPastPrice': productPastPrice[index],
                      'productTotalReview': productTotalReview[index],
                      'productRating': productRating[index],
                    },
                  );
                },
                child: SizedBox(
                  width: 140.kw,
                  height: 208.kh,
                  child: Card(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          priceGraphIcon ? priceGraph() : SizedBox(),
                          cancelIcon
                              ? IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    CupertinoIcons.xmark,
                                    size: 18.kh,
                                  ))
                              : CommonImageView(
                                  svgPath: ImageConstant.svgheartline,
                                )
                        ],
                      ).paddingOnly(bottom: 4.kh),
                      Flexible(child: Image.asset(productImage[index])),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              productNameList[index],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyleUtil.inter700(
                                  fontSize: 12.kh, color: Colors.black),
                            ),
                          ),
                          compareIcon
                              ? CommonImageView(
                                  svgPath: ImageConstant.svgcompare,
                                  height: 18.kh,
                                  width: 18.kw,
                                )
                              : SizedBox()
                        ],
                      ),
                      Text(
                        productDescription[index],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyleUtil.inter400(
                            fontSize: 12.kh, color: context.GreyNeutral),
                      ).paddingOnly(top: 2.kh, bottom: 2.kh),
                      Row(
                        children: [
                          Text(
                            "\$${productCurrentPrice[index]}",
                            style: TextStyleUtil.inter500(
                              fontSize: 12.kh,
                              color: Colors.black,
                            ),
                          ).paddingOnly(right: 3.kw),
                          Text(
                            "\$${productPastPrice[index]}",
                            style: TextStyleUtil.interStrike400(
                                fontSize: 10.kh, color: context.GreyNeutral),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          iconStar
                              ? Icon(
                                  Icons.star,
                                  color: Color(0xFFF6BA1F),
                                  size: 12.kw,
                                )
                              : SizedBox(),
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
                      ).paddingOnly(top: 2.kh)
                    ],
                  ).paddingOnly(top: 8.kh, right: 8.kw, left: 8.kw)),
                ),
              ),
            ],
          );
        });
  }
}

class priceGraph extends StatelessWidget {
  const priceGraph({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: context.primaryLightGreen05,
            borderRadius: BorderRadius.circular(18)),
        child: Row(
          children: [
            Text('30%').paddingOnly(right: 5.kw),
            CommonImageView(
              svgPath: ImageConstant.svgtrendingdown,
            )
          ],
        ).paddingSymmetric(horizontal: 4.kh, vertical: 2.kw));
  }
}
