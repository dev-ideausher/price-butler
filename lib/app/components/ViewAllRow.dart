import 'package:flutter/material.dart';
import 'package:pricebutler/app/services/colors.dart';
import 'package:pricebutler/app/services/responsive_size.dart';
import 'package:pricebutler/app/services/text_style_util.dart';

class ViewAllRow extends StatelessWidget {
  final String? label;
  final Function()? onPressed;
  final double? fontsize;
  const ViewAllRow({super.key, this.label, this.onPressed, this.fontsize});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label!,
          style: TextStyleUtil.inter500(
              fontSize: fontsize ?? 18.kh, color: Colors.black),
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          runSpacing: 1,
          spacing: -12,
          children: [
            TextButton(
              onPressed: onPressed,
              child: Text(
                'View All',
                style: TextStyleUtil.inter500(
                    fontSize: 12.kh, color: context.Green),
              ),
            ),
            Icon(
              Icons.arrow_forward_rounded,
              color: context.Green,
              size: 18.kh,
            ),
          ],
        )
      ],
    );
  }
}
