import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pricebutler/app/components/PriceButtleAppBar.dart';
import 'package:pricebutler/app/components/common_image_view.dart';
import 'package:pricebutler/app/constants/image_constant.dart';
import 'package:pricebutler/app/services/colors.dart';
import 'package:pricebutler/app/services/responsive_size.dart';
import 'package:pricebutler/app/services/text_style_util.dart';

import '../controllers/coupons_controller.dart';

class CouponsView extends GetView<CouponsController> {
  const CouponsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PriceButtlerAppBar(
          elevation: 1,
          color: Colors.white,
          title: Text(
            'Coupons',
            style: TextStyleUtil.inter500(fontSize: 20.kh, color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.kw),
                      border: Border.all(color: context.lightGrey)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CommonImageView(
                            svgPath: ImageConstant.svgcouponicon,
                          ).paddingOnly(right: 10.kw),
                          Text(
                            'Available Coupons',
                            style: TextStyleUtil.nunito500(fontSize: 14.kh),
                          )
                        ],
                      ).paddingOnly(bottom: 16.kh),
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xFFF5FFFD),
                            borderRadius: BorderRadius.circular(8.kw),
                            border: Border.all(
                                color:
                                    const Color(0xFF2E6A5E).withOpacity(0.48))),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CommonImageView(
                                  svgPath: ImageConstant.svgcoupon1,
                                ).paddingOnly(right: 12.kw),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '1st purchase with CIMB bank ',
                                      style: TextStyleUtil.nunito500(
                                          fontSize: 14.kh),
                                    ).paddingOnly(bottom: 8.kh),
                                    Text(
                                      'Extra 10% off on your first purchase with CIMB card ',
                                      style: TextStyleUtil.nunito500(
                                          fontSize: 12.kh,
                                          color: context.couponsText),
                                    )
                                  ],
                                )
                              ],
                            ).paddingAll(12.kw),
                            CustomPaint(
                              painter: TicketPainter(
                                borderColor: Colors.black,
                                bgColor: const Color(0xFFFB9232),
                              ),
                              child: Container(
                                height: 48.kh,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        CommonImageView(
                                          svgPath:
                                              ImageConstant.svgavailablecoupons,
                                        ).paddingOnly(right: 10.kw),
                                        Text(
                                          'VQBX10',
                                          style: TextStyleUtil.nunito500(
                                              fontSize: 14.kh,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'Collect',
                                      style: TextStyleUtil.nunito800(
                                          fontSize: 14.kh, color: Colors.white),
                                    )
                                  ],
                                ).paddingOnly(left: 20.kw, right: 24.kw),
                              ),
                            ).paddingOnly(
                                left: 24.kw, right: 24.kw, bottom: 12.kh),
                          ],
                        ),
                      ).paddingOnly(bottom: 10.kh, top: 20),
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xFFF5FFFD),
                            borderRadius: BorderRadius.circular(8.kw),
                            border: Border.all(
                                color:
                                    const Color(0xFF2E6A5E).withOpacity(0.48))),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CommonImageView(
                                  svgPath: ImageConstant.svgcoupon2,
                                ).paddingOnly(right: 12.kw),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '1st purchase with CIMB bank ',
                                      style: TextStyleUtil.nunito500(
                                          fontSize: 14.kh),
                                    ).paddingOnly(bottom: 8.kh),
                                    Text(
                                      'Extra 5% off on your first purchase with CIMB card ',
                                      style: TextStyleUtil.nunito500(
                                          fontSize: 12.kh,
                                          color: context.couponsText),
                                    )
                                  ],
                                )
                              ],
                            ).paddingAll(12.kw),
                            CustomPaint(
                              painter: TicketPainter(
                                borderColor: Colors.black,
                                bgColor: const Color(0xFFFB9232),
                              ),
                              child: Container(
                                height: 48.kh,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        CommonImageView(
                                          svgPath:
                                              ImageConstant.svgavailablecoupons,
                                        ).paddingOnly(right: 10.kw),
                                        Text(
                                          'VQBX10',
                                          style: TextStyleUtil.nunito500(
                                              fontSize: 14.kh,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'Collect',
                                      style: TextStyleUtil.nunito800(
                                          fontSize: 14.kh, color: Colors.white),
                                    )
                                  ],
                                ).paddingOnly(left: 20.kw, right: 24.kw),
                              ),
                            ).paddingOnly(
                                left: 24.kw, right: 24.kw, bottom: 12.kh),
                          ],
                        ),
                      ),
                    ],
                  ).paddingAll(12.kh))
              .paddingSymmetric(horizontal: 24.kw, vertical: 24.kh),
        ));
  }
}

class TicketPainter extends CustomPainter {
  final Color borderColor;
  final Color bgColor;

  static const _cornerGap = 5.0;
  static const _cutoutRadius = 10.0;
  static const _cutoutDiameter = _cutoutRadius * 2;

  TicketPainter({required this.bgColor, required this.borderColor});

  @override
  void paint(Canvas canvas, Size size) {
    final maxWidth = size.width;
    final maxHeight = size.height;

    final cutoutStartPos = (maxHeight - maxHeight * 0.25);
    final leftCutoutStartY = cutoutStartPos;
    final rightCutoutStartY = cutoutStartPos - _cutoutDiameter;
    final dottedLineY = 220.kw;
    double dottedLineStartX = 5.kh;
    final double dottedLineEndX = 35.kh;
    final double dashWidth = 10.kw;
    final double dashSpace = 3.kh;

    final paintBg = Paint()
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round
      ..color = bgColor;

    final paintBorder = Paint()
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = borderColor
      ..isAntiAlias = true // Optional: Improve the quality of the dashed line
      ..strokeJoin = StrokeJoin.round; // Set the dash pattern directly

    final paintDottedLine = Paint()
      ..color = Colors.white
      ..strokeWidth = 1.2;
    canvas.drawLine(
      Offset(dottedLineStartX, dottedLineY),
      Offset(dottedLineStartX + dashWidth, dottedLineY),
      paintDottedLine,
    );

    var path = Path();

    path.moveTo(_cornerGap, 0);
    path.lineTo(maxWidth - _cornerGap, 0);
    _drawCornerArc(path, maxWidth, _cornerGap);
    path.lineTo(maxWidth, rightCutoutStartY);
    _drawCutout(path, maxWidth, rightCutoutStartY + _cutoutDiameter);
    path.lineTo(maxWidth, maxHeight - _cornerGap);
    _drawCornerArc(path, maxWidth - _cornerGap, maxHeight);
    path.lineTo(_cornerGap, maxHeight);
    _drawCornerArc(path, 0, maxHeight - _cornerGap);
    path.lineTo(0, leftCutoutStartY);
    _drawCutout(path, 0.0, leftCutoutStartY - _cutoutDiameter);
    path.lineTo(0, _cornerGap);
    _drawCornerArc(path, _cornerGap, 0);

    canvas.drawPath(path, paintBg);
    canvas.drawPath(path, paintBorder);

    while (dottedLineStartX < dottedLineEndX) {
      canvas.drawLine(
        Offset(dottedLineY, dottedLineStartX),
        Offset(
          dottedLineY,
          dottedLineStartX + dashWidth,
        ),
        paintDottedLine,
      );
      dottedLineStartX += dashWidth + dashSpace;
    }
  }

  _drawCutout(Path path, double startX, double endY) {
    path.arcToPoint(
      Offset(startX, endY),
      radius: const Radius.circular(_cutoutRadius),
      clockwise: false,
    );
  }

  _drawCornerArc(Path path, double endPointX, double endPointY) {
    path.arcToPoint(
      Offset(endPointX, endPointY),
      radius: const Radius.circular(_cornerGap),
    );
  }

  @override
  bool shouldRepaint(TicketPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(TicketPainter oldDelegate) => false;
}
