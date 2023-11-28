import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:passar/routes/routes.dart';
import 'package:passar/utils/responsive_layout.dart';
import 'package:passar/utils/size.dart';

import '../../../custom_assets/assets.gen.dart';
import '../../../language/english.dart';
import '../../../utils/dimensions.dart';
import '../../../widgets/buttons/primary_button.dart';
import '../../../widgets/text_labels/title_subtitle_widget.dart';
import '../../others/custom_image_widget.dart';

class WaitForApprovalScreen extends StatelessWidget {
  const WaitForApprovalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          body: _bodyWidget(context),
        ),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize),
      child: Column(
        mainAxisAlignment: mainCenter,
        children: [
          _imageWidget(context),
          _textWidget(context),
          _buttonWidget(context),
        ],
      ),
    );
  }

  _imageWidget(BuildContext context) {
    return CustomImageWidget(
      path: Assets.clipart.waitForApproval,
      height: Dimensions.iconSizeLarge * 6,
      width: Dimensions.iconSizeLarge * 6,
    );
  }

  _textWidget(BuildContext context) {
    return TitleSubTitleWidget(
      title: Strings.waitApproval.tr,
      subtitle: Strings.waitForYourSubmitted,
      crossAxisAlignment: crossCenter,
    );
  }

  _buttonWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimensions.marginSizeVertical * 1.4),
      child: PrimaryButton(
        title: Strings.goToDashboard.tr,
        onPressed: (() {
          Get.offAllNamed(Routes.bottomNavBarScreen);
        }),
        borderColor: Theme.of(context).primaryColor,
        buttonColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
