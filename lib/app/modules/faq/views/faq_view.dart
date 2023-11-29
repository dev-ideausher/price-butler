import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pricebutler/app/components/PriceButtleAppBar.dart';
import 'package:pricebutler/app/services/colors.dart';
import 'package:pricebutler/app/services/responsive_size.dart';
import 'package:pricebutler/app/services/text_style_util.dart';

import '../controllers/faq_controller.dart';

class FaqView extends GetView<FaqController> {
  const FaqView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PriceButtlerAppBar(
          elevation: 1,
          color: Colors.white,
          title: Text('FAQ',
              style:
                  TextStyleUtil.inter500(fontSize: 20.kh, color: Colors.black)),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Top Queries',
                style: TextStyleUtil.inter700(
                    fontSize: 18.kh, color: Colors.black),
              ).paddingOnly(left: 18.kw, top: 34.kh),
              faqQuestions(
                faqquestion: 'What is price comparison and what does it do?',
                itemCount: 1,
                faqquestionList: controller.faqQuestionList,
              ),
              faqQuestions(
                faqquestion: 'What is price comparison and what does it do?',
                itemCount: 1,
                faqquestionList: controller.faqQuestionList,
              ),
              faqQuestions(
                faqquestion: 'What is price comparison and what does it do?',
                itemCount: 1,
                faqquestionList: controller.faqQuestionList,
              ),
              Divider(
                thickness: 8.kh,
                color: context.progressBarColor,
              ),
              Text('About Price Comparison',
                      style: TextStyleUtil.inter700(
                          fontSize: 18.kh, color: Colors.black))
                  .paddingOnly(left: 18.kw, top: 34.kh),
              faqQuestions(
                faqquestion: 'What is price comparison and what does it do?',
                itemCount: 1,
                faqquestionList: controller.faqQuestionList,
              ),
              faqQuestions(
                faqquestion: 'What is price comparison and what does it do?',
                itemCount: 1,
                faqquestionList: controller.faqQuestionList,
              ),
              Divider(
                thickness: 8.kh,
                color: context.progressBarColor,
              ),
              Text('Offers And Claims',
                      style: TextStyleUtil.inter700(
                          fontSize: 18.kh, color: Colors.black))
                  .paddingOnly(left: 18.kw, top: 34.kh),
              faqQuestions(
                faqquestion: 'What is price comparison and what does it do?',
                itemCount: 1,
                faqquestionList: controller.faqQuestionList,
              ),
              faqQuestions(
                faqquestion: 'What is price comparison and what does it do?',
                itemCount: 1,
                faqquestionList: controller.faqQuestionList,
              ),
            ],
          ),
        ));
  }
}

class faqQuestions extends StatelessWidget {
  final String faqquestion;
  final List<String> faqquestionList;
  final int itemCount;
  const faqQuestions({
    super.key,
    required this.faqquestion,
    required this.itemCount,
    required this.faqquestionList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ExpansionTile(
          title: Text(
            faqquestion,
            style: TextStyleUtil.inter500(fontSize: 14.kh, color: Colors.black),
          ),
          //backgroundColor: Colors.red,
          children: [
            Container(
                child: ListView.builder(
                    itemCount: itemCount,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Text(faqquestionList[index])
                          .paddingSymmetric(vertical: 16.kh, horizontal: 12.kw);
                    })).paddingOnly(left: 19.kw, right: 24.kw),
          ],
        ),
      ],
    );
  }
}
