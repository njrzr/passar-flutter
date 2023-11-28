import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passar/backend/utils/custom_loading_api.dart';
import 'package:passar/custom_assets/assets.gen.dart';
import 'package:passar/language/language_controller.dart';
import 'package:passar/utils/responsive_layout.dart';
import 'package:passar/utils/size.dart';
import 'package:passar/views/others/custom_image_widget.dart';
import 'package:passar/widgets/buttons/custom_text_button.dart';
import 'package:passar/widgets/buttons/primary_button.dart';
import 'package:passar/widgets/text_labels/title_heading2_widget.dart';
import 'package:passar/widgets/text_labels/title_heading4_widget.dart';

import '../../../controller/auth/registration/registration_controller.dart';
import '../../../language/english.dart';
import '../../../utils/custom_color.dart';
import '../../../utils/dimensions.dart';
import '../../../widgets/inputs/primary_input_filed.dart';

final phoneNumberFormKey = GlobalKey<FormState>();

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({super.key});

  final _signUpFormKey = GlobalKey<FormState>();
  final controller = Get.put(RegistrationController());
  final languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: Scaffold(
        body: _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.paddingSize * 0.05,
      ),
      physics: const BouncingScrollPhysics(),
      child: SizedBox(
        height: height,
        width: width,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            _logoWidget(
              context,
              logoHeight: height * 0.3,
            ),
            _bottomContainerWidget(
              context,
              height: height * 0.8,
              child: Column(
                children: [
                  _titleAndSubtitleWidget(context),
                  _inputAndForgotWidget(context),
                  _buttonWidget(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _logoWidget(BuildContext context, {required double logoHeight}) {
    return Container(
      height: logoHeight,
      margin: EdgeInsets.only(top: Dimensions.marginSizeVertical),
      padding: EdgeInsets.only(
        top: Dimensions.paddingSize * 3,
        bottom: Dimensions.paddingSize * 1.5,
      ),
      child: Center(
        child: CustomImageWidget(
          path: Assets.logo.logo.path,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.1,
        ),
      ),
    );
  }

  _bottomContainerWidget(BuildContext context,
      {required Widget child, required double height}) {
    Radius borderRadius = const Radius.circular(20);
    return Container(
        height: height,
        margin: EdgeInsets.symmetric(
            horizontal: Dimensions.marginSizeHorizontal * 0.55),
        decoration: BoxDecoration(
          color: CustomColor.whiteColor,
          borderRadius:
              BorderRadius.only(topLeft: borderRadius, topRight: borderRadius),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(0.015),
              spreadRadius: 7,
              blurRadius: 5,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        padding: EdgeInsets.all(Dimensions.paddingSize),
        child: child);
  }

  _titleAndSubtitleWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: Dimensions.marginSizeVertical * 0.5,
      ),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          TitleHeading2Widget(text: Strings.signUpInformation.tr),
          verticalSpace(
            Dimensions.heightSize * 0.5,
          ),
          TitleHeading4Widget(
            text: Strings.signUpDetails.tr,
          ),
        ],
      ),
    );
  }

  _inputAndForgotWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: Dimensions.marginSizeVertical * 0.8,
      ),
      child: Column(
        crossAxisAlignment: crossEnd,
        mainAxisSize: mainMin,
        children: [
          Form(
            key: _signUpFormKey,
            child: PrimaryInputWidget(
              controller: controller.emailController,
              hint: Strings.enterEmailAddress.tr,
              label: Strings.emailAddress.tr,
            ),
          ),
        ],
      ),
    );
  }

  _buttonWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: Dimensions.marginSizeVertical,
        top: Dimensions.marginSizeVertical,
      ),
      child: Column(
        mainAxisAlignment: mainCenter,
        children: [
          Obx(
            () => controller.isLoading
                ? const CustomLoadingAPI()
                : PrimaryButton(
                    title: Strings.signUp.tr,
                    onPressed: () {
                      if (_signUpFormKey.currentState!.validate()) {
                        controller.checkExistUserProcess();
                      }
                    },
                    buttonTextColor: CustomColor.whiteColor,
                  ),
          ),
          verticalSpace(Dimensions.heightSize * 2.5),
          RichText(
            text: TextSpan(
              text: languageController
                  .getTranslation(Strings.alreadyHaveAnAccount),
              style: GoogleFonts.inter(
                fontSize: Dimensions.headingTextSize5,
                color: CustomColor.primaryTextColor.withOpacity(
                  0.8,
                ),
                fontWeight: FontWeight.w500,
              ),
              children: [
                WidgetSpan(
                  child: CustomTextButton(
                    onPressed: () {
                      controller.onPressedSignIn();
                    },
                    text: languageController.getTranslation(Strings.richSignin),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
