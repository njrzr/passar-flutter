import 'package:flutter/material.dart';
import 'package:passar/utils/dimensions.dart';
import 'package:passar/utils/size.dart';
import 'package:passar/widgets/text_labels/title_heading5_widget.dart';

import '../../language/english.dart';

class LimitWidget extends StatelessWidget {
  const LimitWidget({Key? key, required this.fee, required this.limit})
      : super(key: key);
  final String fee;
  final String limit;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(vertical: Dimensions.marginSizeVertical * 0.2),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          Row(
            children: [
              TitleHeading5Widget(
                text: Strings.feesAndCharges,
                textAlign: TextAlign.left,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).primaryColor.withOpacity(0.6),
              ),
              TitleHeading5Widget(
                text: ": $fee",
                textAlign: TextAlign.left,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).primaryColor.withOpacity(0.6),
              ),
            ],
          ),
          verticalSpace(Dimensions.heightSize * 0.2),
          Row(
            children: [
              TitleHeading5Widget(
                text: Strings.limit,
                textAlign: TextAlign.left,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).primaryColor.withOpacity(0.6),
              ),
              TitleHeading5Widget(
                text: ": $limit",
                textAlign: TextAlign.left,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).primaryColor.withOpacity(0.6),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
