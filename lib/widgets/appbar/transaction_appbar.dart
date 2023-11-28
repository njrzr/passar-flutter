import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:passar/utils/custom_color.dart';
import 'package:passar/utils/dimensions.dart';

import '../text_labels/title_heading4_widget.dart';
import 'back_button.dart';

class TransactionAppBarWidget extends AppBar {
  final String text;
  final VoidCallback? onTapLeading;
  final bool homeButtonShow;
  final PreferredSizeWidget? bottomBar;

  TransactionAppBarWidget(
      {required this.text,
      this.onTapLeading,
      this.homeButtonShow = false,
      this.bottomBar,
      super.key})
      : super(
          title: TitleHeading4Widget(
            text: text,
            fontSize: Dimensions.headingTextSize1,
            fontWeight: FontWeight.w500,
            color: CustomColor.primaryLightColor,
          ),
          elevation: 0,
          backgroundColor: CustomColor.primaryLightScaffoldBackgroundColor,
          actions: [
            Visibility(
              visible: homeButtonShow,
              child: IconButton(
                  onPressed: onTapLeading,
                  icon: const Icon(
                    Icons.home,
                    color: CustomColor.primaryLightColor,
                  )),
            )
          ],
          bottom: bottomBar,
          leading: BackButtonWidget(
            onTap: onTapLeading ??
                () {
                  Get.back();
                },
          ),
        );
}
