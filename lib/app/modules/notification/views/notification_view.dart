import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pricebutler/app/components/PriceButtleAppBar.dart';
import 'package:pricebutler/app/components/common_image_view.dart';
import 'package:pricebutler/app/components/horizontalListViewBuilder.dart';
import 'package:pricebutler/app/constants/image_constant.dart';
import 'package:pricebutler/app/services/colors.dart';
import 'package:pricebutler/app/services/responsive_size.dart';
import 'package:pricebutler/app/services/text_style_util.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PriceButtlerAppBar(
          elevation: 0,
          title: Text('Notifications',
              style:
                  TextStyleUtil.inter500(fontSize: 20.kh, color: Colors.black)),
        ),
        body: Column(
          children: [
            Divider(
              color: context.progressBarColor,
              thickness: 10,
              height: 8.kh,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Text(
                      'New',
                      style: TextStyleUtil.inter700(
                          fontSize: 16.kh, color: Colors.black),
                    ).paddingOnly(right: 12.kw),
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFFFF4EA),
                          borderRadius: BorderRadius.circular(6.kw)),
                      child: Text(
                        '2',
                        style: TextStyleUtil.inter500(
                            fontSize: 12.kh, color: context.oneStarColor),
                      ).paddingSymmetric(horizontal: 12.kw),
                    )
                  ],
                ),
                notificationListViewBuilder(),
                Row(
                  children: [
                    Text(
                      'Earlier',
                      style: TextStyleUtil.inter700(
                          fontSize: 16.kh, color: Colors.black),
                    ).paddingOnly(right: 12.kw),
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFFFF4EA),
                          borderRadius: BorderRadius.circular(6.kw)),
                      child: Text(
                        '2',
                        style: TextStyleUtil.inter500(
                            fontSize: 12.kh, color: context.oneStarColor),
                      ).paddingSymmetric(horizontal: 12.kw),
                    )
                  ],
                ).paddingOnly(top: 22.kh),
                notificationListViewBuilder(),
              ],
            ).paddingSymmetric(horizontal: 21.kw, vertical: 24.kh)
          ],
        ));
  }
}

class notificationListViewBuilder extends StatelessWidget {
  final bool? showGraph;
  const notificationListViewBuilder({
    super.key,
    this.showGraph,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: [
              CommonImageView(
                imagePath: ImageConstant.pngiphone,
                height: 24.kh,
                width: 24.kw,
              ).paddingOnly(right: 12.kw),
              Expanded(
                child: RichText(
                    maxLines: 5,
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Great news! The Price of the',
                            style: TextStyleUtil.inter500(
                                fontSize: 14.kh, color: Colors.black)),
                        TextSpan(
                            text: '\'Iphone 14\' ',
                            style: TextStyleUtil.inter500(
                                fontSize: 14.kh, color: context.Green)),
                        TextSpan(
                            text:
                                'in your wishlist has dropped. Don\'t miss out on this deal!',
                            style: TextStyleUtil.inter500(
                                fontSize: 14.kh, color: Colors.black))
                      ],
                    )),
              ),
              Column(
                children: [
                  if (showGraph != null && showGraph!)
                    priceGraph(
                            height: 16,
                            width: 46,
                            textStyle: TextStyleUtil.inter400(
                                fontSize: 10.kh, color: context.Green))
                        .paddingOnly(bottom: 14.kh),
                  Text(
                    '9:45 am',
                    style: TextStyleUtil.inter400(
                        fontSize: 12.kh, color: context.GreyNeutral),
                  ).paddingOnly(left: 12.kw),
                ],
              ),
            ],
          ).paddingOnly(top: 18.kw);
        });
  }
}
