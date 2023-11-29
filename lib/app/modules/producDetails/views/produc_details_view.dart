import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bullet_list/flutter_bullet_list.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pricebutler/app/components/PriceButtleButton.dart';
import 'package:pricebutler/app/components/common_image_view.dart';
import 'package:pricebutler/app/components/horizontalListViewBuilder.dart';
import 'package:pricebutler/app/components/storesListViewBuilder.dart';
import 'package:pricebutler/app/services/colors.dart';
import 'package:pricebutler/app/services/responsive_size.dart';
import 'package:pricebutler/app/services/text_style_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../components/PriceButtleAppBar.dart';
import '../../../components/ViewAllRow.dart';
import '../../../constants/image_constant.dart';
import '../controllers/produc_details_controller.dart';

class ProducDetailsView extends GetView<ProducDetailsController> {
  const ProducDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Map arguments = Get.arguments as Map;
    final pageController = PageController();
    int currentPage = 0;
    // int totalPages = 3;

    return Scaffold(
      bottomNavigationBar: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            PriceButtlerButton(
                onpressed: () {},
                label: 'Add To WishList',
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: context.Green),
                    borderRadius: BorderRadius.circular(8.kw)),
                labelStyle: TextStyleUtil.inter400(
                    fontSize: 16.kh, color: context.Green),
                color: context.buttonUnfilledColor),
            PriceButtlerButton(
                onpressed: () {
                  _showCompareBottomSheet(context, arguments);
                },
                label: 'Compare Now',
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.kw)),
                labelStyle: TextStyleUtil.inter400(
                    fontSize: 16.kh, color: Colors.white),
                color: context.buttonFillColor)
          ],
        ).paddingOnly(left: 31.kw, right: 31.kw),
      ),
      appBar: PriceButtlerAppBar(
        elevation: 2,
        color: Colors.white,
        title: Text(
          '${arguments['productName']}',
          style: TextStyleUtil.inter500(fontSize: 18.kh, color: Colors.black),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              showShareBottomSheet();
            },
            child: SvgPicture.asset(ImageConstant.svgshare),
          ),
          SvgPicture.asset(ImageConstant.svgheartline)
              .paddingOnly(right: 24.kw, left: 16.kw),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              productImageCaraosel(
                  pageController, currentPage, arguments, context),
              productOverview(arguments: arguments, context: context)
                  .paddingOnly(
                      bottom: 24.kw, top: 34.kh, right: 24.kw, left: 24.kw),
              Divider(
                color: context.progressBarColor,
                thickness: 10,
                height: 8.kh,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Available At 3 Stores',
                      style: TextStyleUtil.inter400(
                        fontSize: 12.kh,
                        color: const Color(0xFF424244),
                      )).paddingSymmetric(vertical: 15.kh),
                  SizedBox(
                      height: 68.kh,
                      child: Obx(() {
                        return storesListViewBuilder(
                          itemCount: controller.storesName.length,
                          storeName: controller.storesName,
                          storeIcon: controller.storesIcon,
                          productPrice: controller.productPrice,
                        );
                      })),
                ],
              ).paddingSymmetric(
                horizontal: 24.kw,
              ),
              priceAlertBar().paddingSymmetric(vertical: 15.kh),
              productDetails().paddingSymmetric(
                horizontal: 24.kw,
              ),
              Divider(
                color: context.progressBarColor,
                thickness: 10,
                height: 8.kh,
              ),
              customerReview(context)
                  .paddingSymmetric(horizontal: 24.kw, vertical: 26.kh),
              Divider(
                color: context.progressBarColor,
                thickness: 10,
                height: 8.kh,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ViewAllRow(
                    label: 'Related Products',
                    fontsize: 16.kh,
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 210.kh,
                    child: HorizontalListViewBuilder(
                      itemCount: 3,
                      cancelIcon: false,
                      compareIcon: true,
                      priceGraphIcon: true,
                      iconStar: true,
                      productImage: controller.productImage,
                      productNameList: controller.productsNameList,
                      productDescription: controller.productsDescription,
                      productCurrentPrice: controller.productsCurrentPrice,
                      productPastPrice: controller.productsLastPrice,
                      productTotalReview: controller.productRating,
                      productRating: controller.productTotalReview,
                    ),
                  ),
                ],
              ).paddingSymmetric(horizontal: 24.kw, vertical: 10.kh),
            ],
          ),
        ),
      ),
    );
  }

  Column customerReview(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RatingandReviews(context),
        SizedBox(
            width: 325.kw,
            child: Divider(
              thickness: 1,
              color: context.progressBarColor,
            )),
        Text(
          'Customer Reviews (8)',
          style: TextStyleUtil.inter700(fontSize: 12.kh, color: Colors.black),
        ),
        ListView.builder(
            itemCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            controller.reviewerName[index]!,
                            style: TextStyleUtil.inter400(
                                fontSize: 14.kh, color: Colors.black),
                          ).paddingOnly(right: 8.kw),
                          Text(
                            'from',
                            style: TextStyleUtil.inter400(
                                fontSize: 10.kh, color: context.GreyNeutral),
                          ).paddingOnly(right: 5.kw),
                          Text(
                            controller.storesName[index]!,
                            style: TextStyleUtil.inter400(
                                fontSize: 10.kh, color: context.oneStarColor),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: context.GreyNeutral),
                                borderRadius: BorderRadius.circular(6.kh)),
                            child: Row(
                              children: [
                                Text(
                                  '5',
                                  style: TextStyleUtil.inter400(
                                      fontSize: 12.kh, color: Colors.black),
                                ),
                                CommonImageView(
                                  svgPath: ImageConstant.svgstar,
                                )
                              ],
                            ).paddingAll(4.kh),
                          ).paddingOnly(right: 8.kw),
                          Text(
                            '8 days ago',
                            style: TextStyleUtil.inter400(
                                fontSize: 12.kh, color: context.GreyNeutral),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    'Mind blowing purchase',
                    style: TextStyleUtil.inter700(
                        fontSize: 14.kh, color: Colors.black),
                  ).paddingSymmetric(vertical: 10.kh),
                  Text(
                    'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using product, making it look like readable English.',
                    style: TextStyleUtil.inter400(
                        fontSize: 12.kh, color: context.GreyNeutral),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                          onTap: () {},
                          child: const Icon(Icons.thumb_up_off_alt_outlined)),
                      GestureDetector(
                              onTap: () {},
                              child: const Icon(Icons.thumb_down_alt_outlined))
                          .paddingSymmetric(horizontal: 13.kw, vertical: 10.kh),
                      GestureDetector(
                          onTap: () {},
                          child: const Icon(Icons.more_vert_rounded)),
                    ],
                  ),
                  SizedBox(
                    width: 374.kw,
                    child: Divider(
                      thickness: 1,
                      color: context.GreyNeutral,
                    ),
                  )
                ],
              ).paddingOnly(bottom: 10.kh);
            }),
        GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              Text('View all 6 reviews',
                  style: TextStyleUtil.inter700(
                    fontSize: 12.kh,
                    color: context.Green,
                  )),
              Icon(
                Icons.arrow_forward_outlined,
                color: context.Green,
                size: 18.kh,
              )
            ],
          ),
        ),
      ],
    );
  }

  Column RatingandReviews(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Rating & Reviews',
          style: TextStyleUtil.inter700(fontSize: 14.kh, color: Colors.black),
        ),
        Row(
          children: [
            Icon(
              Icons.verified_rounded,
              color: context.TeritaryGreen,
            ).paddingOnly(right: 6.kw),
            Text(
              'By Verified Buyers',
              style: TextStyleUtil.inter700(
                  fontSize: 14.kh, color: context.TeritaryGreen),
            ),
          ],
        ).paddingOnly(top: 5.kh, bottom: 35.kh),
        Row(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      '24',
                      style: TextStyleUtil.inter500(
                          fontSize: 24.kh, color: Colors.black),
                    ),
                    CommonImageView(
                      svgPath: ImageConstant.svgstar,
                    )
                  ],
                ),
                Text(
                  '123 Verified Users',
                  style: TextStyleUtil.inter400(
                      fontSize: 14.kh, color: const Color(0xFF424244)),
                ).paddingOnly(top: 10.kw),
              ],
            ).paddingOnly(right: 21.kw),
            const SizedBox(
              height: 129,
              child: VerticalDivider(
                color: Color(0xFFDEDEDE),
                thickness: 1,
              ),
            ).paddingOnly(right: 19.kw),
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  reverse: true,
                  itemBuilder: (BuildContext context, int index) {
                    final RxList<Color?> reviewColor = [
                      context.oneStarColor,
                      context.twoStarColor,
                      context.threeStarColor,
                      context.fourStarColor,
                      context.fiveStarColor,
                    ].obs;
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          controller.reviewStars[index]!,
                          style: TextStyleUtil.inter400(
                              fontSize: 12.kh, color: Colors.black),
                        ),
                        CommonImageView(
                          svgPath: ImageConstant.svgstar,
                          svgColor: Colors.black,
                        ),
                        SizedBox(
                          width: 124.kw,
                          child: LinearProgressIndicator(
                            value: controller.reviewProgress[index].toDouble(),
                            color: reviewColor[index]!,
                            backgroundColor: context.progressBarColor,
                          ),
                        ).paddingSymmetric(horizontal: 8.kw),
                        Text(
                          controller.totalReviewCount[index]!,
                          style: TextStyleUtil.inter400(
                              fontSize: 12.kh, color: context.GreyNeutral),
                        ),
                      ],
                    ).paddingOnly(bottom: 10.kh);
                  }),
            )
          ],
        ),
      ],
    );
  }

  Column productDetails() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Product Details',
          style: TextStyleUtil.inter700(fontSize: 18.kh, color: Colors.black),
        ),
        Text(
          'Features',
          style: TextStyleUtil.inter600(fontSize: 14.kh, color: Colors.black),
        ).paddingOnly(top: 12.kh, bottom: 8.kh),
        FlutterBulletList(
          data: controller.data,
          textStyle:
              TextStyleUtil.inter400(fontSize: 14.kh, color: Colors.black),
          bulletColor: Colors.black,
          bulletSize: 2,
        ),
      ],
    );
  }

  Container priceAlertBar() {
    return Container(
      height: 38.kh,
      decoration: const BoxDecoration(color: Color(0xFFFFF4EA)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonImageView(
            svgPath: ImageConstant.svgnotificationline,
            svgColor: const Color(0xFFFB9232),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Set Price Alert',
              style: TextStyleUtil.inter400(
                  fontSize: 14.kh, color: const Color(0xFFFB9232)),
            ),
          )
        ],
      ),
    );
  }

  Column productImageCaraosel(PageController pageController, int currentPage,
      Map<dynamic, dynamic> arguments, BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: 40.h,
            width: 100.w,
            child: Card(
                elevation: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                        child: PageView(
                            controller: pageController,
                            onPageChanged: (index) {
                              currentPage = index;
                            },
                            children: [
                          Image.asset(
                            arguments['productImage'],
                            fit: BoxFit.contain,
                          ),
                        ])),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color(0xFFADADAD), width: 1),
                          borderRadius: BorderRadius.circular(16.kh)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.star,
                            color: const Color(0xFFF6BA1F),
                            size: 12.kw,
                          ),
                          Text(
                            '${arguments['productTotalReview']}',
                            style: TextStyleUtil.inter700(
                                fontSize: 11.kh, color: Colors.black),
                          ),
                          SizedBox(
                            height: 13.kh,
                            child: VerticalDivider(
                              color: context.GreyNeutral,
                              thickness: 1,
                              width: 10,
                            ),
                          ),
                          Text(
                            '${arguments['productRating']}',
                            style: TextStyleUtil.inter400(
                                fontSize: 11.kh, color: context.GreyNeutral),
                          ),
                        ],
                      ).paddingOnly(
                          left: 6.kw, right: 6.kw, top: 4.kw, bottom: 4.kw),
                    ).paddingOnly(bottom: 13.kh, right: 29.kw, top: 10.kh),
                  ],
                ))),
        SmoothPageIndicator(
          controller: pageController,
          count: 1,
          effect: WormEffect(
            dotColor: const Color.fromARGB(
              20,
              23,
              34,
              59,
            ),
            activeDotColor: context.GreyNeutral,
            dotHeight: 10.kh,
            dotWidth: 10.kw,
          ),
        ).paddingOnly(top: 12.kh),
      ],
    );
  }
}

class productOverview extends StatelessWidget {
  const productOverview({
    super.key,
    required this.arguments,
    required this.context,
  });

  final Map arguments;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          '${arguments['productName']}',
          style: TextStyleUtil.inter500(fontSize: 18.kh, color: Colors.black),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('\$${arguments['productCurrentPrice']}',
                style: TextStyleUtil.inter700(
                  fontSize: 16.kh,
                  color: Colors.black,
                )),
            Text(
              '\$${arguments['productPastPrice']}',
              style: TextStyleUtil.inter400(
                decoration: TextDecoration.lineThrough,
                fontSize: 14.kh,
                color: context.GreyNeutral,
              ),
            ),
            const priceGraph(),
            Text('price drop by 30%',
                style: TextStyleUtil.inter400(
                  fontSize: 12.kh,
                  color: context.GreyNeutral,
                )),
            PriceButtlerButton(
                onpressed: () {},
                label: 'Buy Now',
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                edgeInsets: EdgeInsets.only(
                    top: 8.kh, left: 16.kh, right: 16.kh, bottom: 8.kh),
                labelStyle: TextStyleUtil.inter400(fontSize: 12.kh),
                color: context.Green),
          ],
        ),
        RichText(
            text: TextSpan(
                text: 'Best price by ',
                style: TextStyleUtil.inter400(
                    fontSize: 12.kh, color: context.GreyNeutral),
                children: <TextSpan>[
              TextSpan(
                  text: 'Amazon',
                  style: TextStyleUtil.inter400(
                      fontSize: 12.kh, color: Colors.black))
            ])),
      ],
    );
  }
}

void _showCompareBottomSheet(
    BuildContext context, Map<dynamic, dynamic> arguments) {
  Get.bottomSheet(
      SingleChildScrollView(
        child: Container(
          //height: 332.kh,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Compare',
                        style: TextStyleUtil.inter500(
                          fontSize: 18.kh,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 18.kh,
                        child: VerticalDivider(
                          thickness: 1,
                          color: context.GreyNeutral,
                        ),
                      ),
                      Text(
                        '1 product added',
                        style: TextStyleUtil.inter500(
                          fontSize: 14.kh,
                          color: context.GreyNeutral,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(CupertinoIcons.xmark),
                  )
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 195.kh,
                    //width: 193.kw,
                    child: HorizontalListViewBuilder(
                      itemCount: 1,
                      iconStar: false,
                      cancelIcon: true,
                      productImage: [
                        arguments['productImage'],
                      ],
                      productNameList: [arguments['productName']],
                      productDescription: [arguments['productDescription']],
                      productCurrentPrice: [arguments['productCurrentPrice']],
                      productPastPrice: [
                        arguments['productPastPrice'],
                      ],
                      productTotalReview: [''],
                      productRating: [''],
                      compareIcon: false,
                      priceGraphIcon: false,
                    ),
                  ),
                  Card(
                    color: Color(0xFFF2F2F2),
                    child: Center(
                        child: Column(
                      children: [
                        Container(
                          height: 47.kh,
                          width: 47.kw,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: context.Green),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.add),
                          ),
                        ).paddingOnly(bottom: 6.kh),
                        Text(
                          'Add Product',
                          style: TextStyleUtil.inter400(
                            fontSize: 12.kh,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ).paddingSymmetric(horizontal: 55.kw, vertical: 59.kh)),
                  )
                ],
              ).paddingOnly(bottom: 18.kh),
              PriceButtlerButton(
                  onpressed: () {},
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: context.buttonFillColor),
                      borderRadius: BorderRadius.circular(8.kh)),
                  label: 'Add Product',
                  labelStyle: TextStyleUtil.inter400(
                      fontSize: 16.kh, color: context.buttonFillColor),
                  color: context.buttonUnfilledColor)
            ],
          ).paddingSymmetric(horizontal: 24.kw, vertical: 24.kh),
        ),
      ),
      isScrollControlled: true);
}

void showShareBottomSheet() {
  Get.bottomSheet(
    SingleChildScrollView(
      child: Container(
        height: 252.kh,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Share via',
                  style: TextStyleUtil.inter500(
                    fontSize: 18.kh,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(CupertinoIcons.xmark),
                )
              ],
            ),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
              ),
              itemCount: 5,
              itemBuilder: (context, index) {
                return _buildSocialRow(
                  index: index,
                  onTap: () {
                    // Handle share action for each platform
                    // Implement your logic here
                    Get.back();
                  },
                );
              },
            ),
          ],
        ).paddingSymmetric(horizontal: 24.kw, vertical: 24.kh),
      ),
    ),
  );
}

Widget _buildSocialRow({required int index, required VoidCallback onTap}) {
  List<Map<String, dynamic>> socialPlatforms = [
    {'imagePath': ImageConstant.pngFacebook, 'text': 'Facebook'},
    {'imagePath': ImageConstant.pngInstagram, 'text': 'Instagram'},
    {'imagePath': ImageConstant.pngWhatsapp, 'text': 'Whatsapp'},
    {'imagePath': ImageConstant.pngLinkedin, 'text': 'Linkedin'},
    {'svgPath': ImageConstant.svgtwitter, 'text': 'Twitter'},
  ];

  return InkWell(
    onTap: onTap,
    child: Container(
      child: Column(
        children: [
          socialPlatforms[index]['imagePath'] != null
              ? Image.asset(
                  socialPlatforms[index]['imagePath'],
                  height: 32.kh,
                  width: 32.kw,
                )
              : SvgPicture.asset(
                  socialPlatforms[index]['svgPath'],
                  height: 32.kh,
                  width: 32.kw,
                ),
          Text(socialPlatforms[index]['text']),
        ],
      ),
    ),
  );
}
