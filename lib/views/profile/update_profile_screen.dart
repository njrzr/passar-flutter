import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:passar/backend/utils/custom_loading_api.dart';
import 'package:passar/utils/dimensions.dart';
import 'package:passar/utils/responsive_layout.dart';
import 'package:passar/utils/size.dart';
import 'package:passar/widgets/appbar/appbar_widget.dart';
import 'package:passar/widgets/buttons/primary_button.dart';
import 'package:passar/widgets/inputs/phone_number_with_contry_code_input.dart';

import '../../controller/profile/update_profile_controller.dart';
import '../../language/english.dart';
import '../../routes/routes.dart';
import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../widgets/inputs/country_picker_input_widget.dart';
import '../../widgets/inputs/primary_input_filed.dart';
import '../../widgets/others/congratulation_widget.dart';
import '../../widgets/others/image_picker/image_picker.dart';
import '../../widgets/text_labels/custom_title_heading_widget.dart';

class UpdateProfileScreen extends StatelessWidget {
  UpdateProfileScreen({super.key});

  final controller = Get.put(UpdateProfileController());
  final _fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: Scaffold(
        appBar: const AppBarWidget(
          text: Strings.updateProfile,
        ),
        body: Obx(
          () => controller.isLoading
              ? const CustomLoadingAPI()
              : _bodyWidget(
                  context,
                ),
        ),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.marginSizeHorizontal * 0.9,
      ),
      physics: const BouncingScrollPhysics(),
      children: [
        _imgWidget(context),
        _inputWidget(context),
        _buttonWidget(context),
      ],
    );
  }

  _imgWidget(BuildContext context) {
    return ImagePickerWidget();
  }

  _inputWidget(BuildContext context) {
    return Form(
      key: _fromKey,
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          Row(
            children: [
              Expanded(
                child: PrimaryInputWidget(
                  hint: Strings.enterFirstName,
                  label: Strings.firstName,
                  controller: controller.firstNameController,
                ),
              ),
              horizontalSpace(Dimensions.widthSize),
              Expanded(
                child: PrimaryInputWidget(
                  hint: Strings.enterLastName,
                  label: Strings.lastName,
                  controller: controller.lastNameController,
                ),
              ),
            ],
          ),
          verticalSpace(Dimensions.heightSize),
          PrimaryInputWidget(
            controller: controller.emailController,
            hint: Strings.enterEmailAddress,
            label: Strings.emailAddress,
          ),
          verticalSpace(Dimensions.heightSize),
          CustomTitleHeadingWidget(
            text: Strings.country,
            style: CustomStyle.darkHeading4TextStyle.copyWith(
              fontWeight: FontWeight.w600,
              color: CustomColor.primaryTextColor,
            ),
          ),
          verticalSpace(Dimensions.heightSize * 0.5),

          ProfileCountryCodePickerWidget(
            initialSelection: controller.countryName.value,
            onChanged: (value) {
              controller.countryName.value = value.name.toString();
              controller.phoneCode.value = value.toString();
            },
            controller: controller.countryController,
          ),
          PhoneNumberInputWidget(
            readOnly: true,
            countryCode: controller.phoneCode,
            controller: controller.phoneController,
            hint: Strings.enterPhone,
            label: Strings.phoneNumber,
          ),

          //ended country number picker
          verticalSpace(
            Dimensions.heightSize,
          ),
          Row(
            children: [
              Expanded(
                child: PrimaryInputWidget(
                  hint: Strings.enterCity,
                  label: Strings.city,
                  controller: controller.cityController,
                ),
              ),
              horizontalSpace(Dimensions.widthSize),
              Expanded(
                child: PrimaryInputWidget(
                  hint: Strings.enterZipCode,
                  label: Strings.zipCode,
                  controller: controller.zipCodeController,
                ),
              ),
            ],
          ),
          verticalSpace(Dimensions.heightSize),
        ],
      ),
    );
  }

  _buttonWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: Dimensions.marginSizeVertical,
      ),
      child: Obx(
        () => controller.isUpdateLoading
            ? const CustomLoadingAPI()
            : PrimaryButton(
                title: Strings.updateProfile,
                onPressed: () {
                  if (_fromKey.currentState!.validate()) {
                    if (controller.imageController.isImagePathSet.value) {
                      controller
                          .profileUpdateWithImageProcess()
                          .then((value) => StatusScreen.show(
                              context: context,
                              subTitle: value.message.success.first,
                              onPressed: () {
                                Get.offAllNamed(Routes.bottomNavBarScreen);
                              }));
                    } else {
                      controller
                          .profileUpdateWithOutImageProcess()
                          .then((value) => StatusScreen.show(
                              context: context,
                              subTitle: value.message.success.first,
                              onPressed: () {
                                Get.offAllNamed(Routes.bottomNavBarScreen);
                              }));
                    }
                  }
                },
              ),
      ),
    );
  }
}
