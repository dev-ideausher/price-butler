import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pricebutler/app/components/common_image_view.dart';
import 'package:pricebutler/app/services/responsive_size.dart';
import 'package:pricebutler/app/services/text_style_util.dart';

class storesListViewBuilder extends StatelessWidget {
  final int itemCount;
  final List<String?>? storeName;
  final List<String?>? storeIcon;
  final List<String?>? productPrice;
  const storesListViewBuilder(
      {super.key,
      required this.itemCount,
      this.storeName,
      this.storeIcon,
      this.productPrice});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: itemCount,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                color: Color(0xFFDDF7EB),
                border: Border.all(color: Color(0xFF85C8B3), width: 1),
                borderRadius: BorderRadius.circular(8.kw)),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonImageView(
                        imagePath: storeIcon![index]!,
                        height: 21.kh,
                        width: 21.kh,
                      ).paddingOnly(right: 2.kw),
                      Text(
                        storeName![index]!,
                        style: TextStyleUtil.inter400(
                            fontSize: 12.kh, color: Color(0xFF424242)),
                      ),
                    ],
                  ).paddingSymmetric(horizontal: 16.kw, vertical: 8.kh),
                ),
                Text(
                  productPrice![index]!,
                  style: TextStyleUtil.inter400(
                      fontSize: 14.kh, color: Colors.black),
                ),
              ],
            ),
          ).paddingOnly(right: 8.kw);
        });
  }
}
