import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pricebutler/app/components/PriceButtleButton.dart';
import 'package:pricebutler/app/components/common_image_view.dart';
import 'package:pricebutler/app/constants/image_constant.dart';
import 'package:pricebutler/app/services/colors.dart';
import 'package:pricebutler/app/services/responsive_size.dart';

import '../../../routes/app_pages.dart';
import '../../../services/text_style_util.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ProfileController());
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF1C926D),
                    Color(0xFF045A40),
                  ],
                  begin: Alignment.centerRight,
                  end: Alignment.bottomRight,
                  stops: [
                    0,
                    1,
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Profile',
                        style: TextStyleUtil.inter500(
                            fontSize: 20.kh, color: Colors.white),
                      ).paddingOnly(bottom: 22.kh),
                      Row(
                        children: [
                          Container(
                            height: 56.kh,
                            width: 56.kw,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Colors.white, width: 1.kw)),
                            child: Center(
                              child: Text(
                                'NK',
                                style: TextStyleUtil.inter500(fontSize: 18.kh),
                              ),
                            ),
                          ).paddingOnly(right: 13.kw),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Hi Nick Jhon',
                                      style: TextStyleUtil.inter500(
                                          fontSize: 20.kh),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.mode_edit_rounded,
                                          size: 24.kh,
                                          color: Colors.white,
                                        )),
                                  ],
                                ),
                                Text(
                                  '123456789',
                                  style:
                                      TextStyleUtil.inter400(fontSize: 14.kh),
                                ),
                              ]),
                        ],
                      ).paddingOnly(bottom: 16.kh),
                      PriceButtlerButton(
                          onpressed: () {},
                          label: '680 SuperCoins',
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.kw),
                              side: const BorderSide(color: Color(0xFFF9AB34))),
                          labelStyle: TextStyleUtil.inter400(fontSize: 16.kh),
                          color: Colors.transparent),
                    ],
                  ).paddingOnly(left: 24.kw, right: 24.kw, top: 14, bottom: 20),
                  ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(20)),
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ButtonBar(
                              alignment: MainAxisAlignment.center,
                              children: [
                                PriceButtlerButton(
                                  onpressed: () {
                                    Get.toNamed(Routes.HISTORY);
                                  },
                                  label: 'History',
                                  svgPath: ImageConstant.svghistory,
                                  edgeInsets: EdgeInsets.symmetric(
                                      vertical: 12.kh, horizontal: 32.kw),
                                  shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color: Color(0xFFADADAD)),
                                      borderRadius:
                                          BorderRadius.circular(8.kw)),
                                  labelStyle: TextStyleUtil.inter400(
                                      fontSize: 16.kh, color: Colors.black),
                                  color: Colors.white,
                                ).paddingOnly(right: 24.kw),
                                PriceButtlerButton(
                                  onpressed: () {
                                    Get.toNamed(Routes.COUPONS);
                                  },
                                  label: 'Coupons',
                                  svgPath: ImageConstant.svgcoupon,
                                  edgeInsets: EdgeInsets.symmetric(
                                      vertical: 12.kh, horizontal: 32.kw),
                                  shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color: Color(0xFFADADAD)),
                                      borderRadius:
                                          BorderRadius.circular(8.kw)),
                                  labelStyle: TextStyleUtil.inter400(
                                      fontSize: 16.kh, color: Colors.black),
                                  color: Colors.white,
                                ),
                              ],
                            ).paddingOnly(top: 12.kh),
                            Divider(
                              thickness: 8.kh,
                              color: context.progressBarColor,
                            ).paddingOnly(bottom: 12.kw),
                            Obx(
                              () => profileMenu(
                                svgPath: controller.profileMenuIcon,
                                itemCount: controller.profileMenuIcon.length,
                                menutitle: controller.menuTitle,
                                titleDescription: controller.titleDescription,
                                pageIndex: controller.profileMenuButton,
                              ),
                            ),
                            Divider(
                              thickness: 8.kh,
                              color: context.progressBarColor,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.logout,
                                  size: 24.kh,
                                ).paddingOnly(right: 12.kw),
                                Text('Logout',
                                    style: TextStyleUtil.inter400(
                                        fontSize: 16.kh,
                                        color: const Color(0xFF424244)))
                              ],
                            ).paddingSymmetric(
                                horizontal: 30.kw, vertical: 20.kh)
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class profileMenu extends StatelessWidget {
  final List<String> svgPath;
  final List<String> menutitle;
  final List<String> titleDescription;
  final List<String> pageIndex;
  final int itemCount;
  const profileMenu({
    super.key,
    required this.svgPath,
    required this.menutitle,
    required this.titleDescription,
    required this.itemCount,
    required this.pageIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
            itemCount: itemCount,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(pageIndex[index]);
                    },
                    child: Row(
                      children: [
                        CommonImageView(
                          svgPath: svgPath[index],
                        ).paddingOnly(right: 12.kw),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              menutitle[index],
                              style: TextStyleUtil.inter700(
                                  fontSize: 16.kh, color: Colors.black),
                            ).paddingOnly(bottom: 5.kw),
                            Text(
                              titleDescription[index],
                              style: TextStyleUtil.inter400(
                                  fontSize: 12.kh, color: Colors.black),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: context.progressBarColor,
                  ),
                ],
              );
            }),
        TextButton(
            onPressed: () {
              Get.toNamed(Routes.ABOUTUS);
            },
            child: Text(
              'About US',
              style: TextStyleUtil.inter400(
                  fontSize: 16.kh, color: const Color(0xFF424244)),
            )),
        TextButton(
            onPressed: () {
              Get.toNamed(Routes.TERMSOFUSE);
            },
            child: Text(
              'Terms Of Use',
              style: TextStyleUtil.inter400(
                  fontSize: 16.kh, color: const Color(0xFF424244)),
            )),
        TextButton(
            onPressed: () {
              Get.toNamed(Routes.PRIVACYPOLICY);
            },
            child: Text(
              'Privacy Policy',
              style: TextStyleUtil.inter400(
                  fontSize: 16.kh, color: const Color(0xFF424244)),
            )),
      ],
    ).paddingSymmetric(horizontal: 24.kw);
  }
}
