import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:passar/backend/local_storage/local_storage.dart';
import 'package:passar/backend/utils/custom_loading_api.dart';
import 'package:passar/routes/routes.dart';
import 'package:passar/widgets/appbar/appbar_widget.dart';

import '../../controller/drawer/setting_controller.dart';
import '../../language/english.dart';
import '../../language/language_drop_down.dart';
import '../../utils/custom_color.dart';
import '../../utils/dimensions.dart';
import '../../utils/responsive_layout.dart';
import '../../utils/size.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/text_labels/title_heading2_widget.dart';
import '../../widgets/text_labels/title_heading4_widget.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});

  final controller = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: Scaffold(
        appBar: const AppBarWidget(text: Strings.settings),
        body: _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.marginSizeHorizontal * 0.9,
      ),
      child: Column(
        children: [
          _changePasswordText(context),
          _changeLanguageWidget(context),
          _deleteAccountWidget(context),
        ],
      ),
    );
  }

  _changeLanguageWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              flex: 3,
              child: TitleHeading4Widget(
                padding:
                    EdgeInsets.symmetric(vertical: Dimensions.paddingSize * .2),
                text: Strings.changeLanguage,
                fontWeight: FontWeight.normal,
                fontSize: Dimensions.headingTextSize3,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Expanded(child: ChangeLanguageWidget())
          ],
        ),
        Divider(
          thickness: Dimensions.radius * .1,
          color: CustomColor.whiteColor.withOpacity(.10),
        ),
      ],
    );
  }

  _changePasswordText(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        Container(
          margin: EdgeInsets.only(top: Dimensions.marginSizeVertical),
          child: InkWell(
            onTap: () {
              Get.toNamed(Routes.changePasswordScreen);
            },
            child: TitleHeading4Widget(
              text: Strings.changePassword,
              fontWeight: FontWeight.w500,
              fontSize: Dimensions.headingTextSize3,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        verticalSpace(Dimensions.heightSize),
        Divider(
          height: 1.5,
          color: Theme.of(context).primaryColor.withOpacity(0.1),
        ),
      ],
    );
  }

  _deleteAccountWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      mainAxisAlignment: mainStart,
      children: [
        verticalSpace(Dimensions.heightSize * 0.8),
        InkWell(
          onTap: () {
            _openDialogueForDeleteAccount(context);
          },
          child: Obx(
            () => controller.isLoading
                ? const CustomLoadingAPI()
                : Align(
                    alignment: Alignment.centerLeft,
                    child: TitleHeading4Widget(
                      text: Strings.deleteAccount,
                      fontWeight: FontWeight.w500,
                      fontSize: Dimensions.headingTextSize3,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
          ),
        ),
      ],
    );
  }

  _openDialogueForDeleteAccount(
    BuildContext context,
  ) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            alignment: Alignment.center,
            insetPadding: EdgeInsets.all(Dimensions.paddingSize * 0.3),
            contentPadding: EdgeInsets.zero,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            content: Builder(
              builder: (context) {
                var width = MediaQuery.of(context).size.width;
                return Container(
                  width: width * 0.84,
                  margin: EdgeInsets.all(Dimensions.paddingSize * 0.5),
                  padding: EdgeInsets.all(Dimensions.paddingSize * 0.9),
                  decoration: BoxDecoration(
                    color: CustomColor.whiteColor,
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius * 1.4),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: crossCenter,
                    children: [
                      SizedBox(height: Dimensions.heightSize * 2),
                      TitleHeading2Widget(text: Strings.deleteAccount.tr),
                      verticalSpace(Dimensions.heightSize * 1),
                      TitleHeading4Widget(
                          text: Strings.deleteAccountSubTitle.tr),
                      verticalSpace(Dimensions.heightSize * 1),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * .25,
                              child: PrimaryButton(
                                title: Strings.cancel.tr,
                                onPressed: () {
                                  Get.back();
                                },
                                borderColor: CustomColor.blackColor,
                                buttonColor: CustomColor.blackColor,
                              ),
                            ),
                          ),
                          horizontalSpace(Dimensions.widthSize),
                          Expanded(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * .25,
                              child: PrimaryButton(
                                title: Strings.okay.tr,
                                onPressed: () {
                                  controller.deleteAccountProcess();
                                  Get.back();
                                  LocalStorage.logout();
                                  Get.offNamedUntil(
                                      Routes.signInScreen, (route) => false);
                                },
                                borderColor: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        });
  }
}
