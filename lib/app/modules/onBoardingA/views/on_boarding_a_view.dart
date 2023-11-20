import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pricebutler/app/constants/image_constant.dart';
import 'package:pricebutler/app/routes/app_pages.dart';
import 'package:pricebutler/app/services/colors.dart';
import 'package:pricebutler/app/services/responsive_size.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../components/common_image_view.dart';
import '../../../services/text_style_util.dart';
import '../controllers/on_boarding_a_controller.dart';

class OnBoardingAView extends GetView<OnBoardingAController> {
  const OnBoardingAView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();
    int currentPage = 0;
    int totalPages = 3;

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: (index) {
                  currentPage = index;
                },
                children: [
                  Onboardinglabel(
                    imageAsset: ImageConstant.pngonBoardingA,
                    title: 'Shop for anything,\nSave on everything',
                    description:
                        'It is a long established fact that a reader will\nbe distracted by the readable content.',
                  ),
                  Onboardinglabel(
                    imageAsset: ImageConstant.pngonBoardingB,
                    title: 'Compare prices of any\nproduct you want',
                    description:
                        'It is a long established fact that a reader will\nbe distracted by the readable content.',
                  ),
                  Onboardinglabel(
                    imageAsset: ImageConstant.pngonBoardingC,
                    title:
                        'Earn with us! Share and\nearn affiliate commissions.',
                    description:
                        'It is a long established fact that a reader will\nbe distracted by the readable content.',
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    pageController.previousPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                  child: Text(
                    'Prev',
                    style: TextStyleUtil.inter400(
                      fontSize: 18.kh,
                      color: Color(0xFF787878),
                    ),
                  ),
                ),
                SmoothPageIndicator(
                  controller: pageController,
                  count: totalPages,
                  effect: WormEffect(
                    dotColor: Color.fromARGB(
                      20,
                      23,
                      34,
                      59,
                    ),
                    activeDotColor: context.brandColor1,
                    dotHeight: 10.kh,
                    dotWidth: 10.kw,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (currentPage < totalPages - 1) {
                      // If not the last page, go to the next page
                      print(currentPage);
                      pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    } else {
                      // If last page, navigate to the sign-in page
                      Get.toNamed(Routes.SIGN_IN);
                    }
                  },
                  child: Text(
                    'Next',
                    style: TextStyleUtil.inter400(
                      fontSize: 18.kh,
                      color: Color(0xFFE97F1F),
                    ),
                  ),
                ),
              ],
            )
          ],
        ).paddingOnly(left: 32.kw, right: 32.kw, bottom: 37.kh),
      ),
    );
  }
}

class Onboardinglabel extends StatelessWidget {
  final String? imageAsset;
  final String? svgAsset;
  final String title;
  final String description;
  final String? additionalText; // New optional text widget

  Onboardinglabel({
    this.imageAsset,
    required this.title,
    required this.description,
    this.svgAsset,
    this.additionalText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CommonImageView(
          imagePath: imageAsset,
          svgPath: svgAsset,
        ),
        39.kheightBox,
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyleUtil.inter700(fontSize: 24.kh, color: Colors.black),
        ),
        15.kheightBox,
        Text(
          description,
          textAlign: TextAlign.center,
          style:
              TextStyleUtil.inter400(fontSize: 17.kh, color: Color(0xFF787878)),
        ),
        15.kheightBox,
        if (additionalText !=
            null) // Render the additional text widget if provided
          Text(
            additionalText!,
            textAlign: TextAlign.center,
            style: TextStyleUtil.inter400(
                fontSize: 25.kh), // Customize the style as needed
          )
      ],
    );
  }
}
