import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passar/language/language_controller.dart';
import 'package:passar/utils/size.dart';

import '../../controller/categories/send_money/send_money_controller.dart';
import '../../language/english.dart';
import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../text_labels/title_heading4_widget.dart';

class SendMoneyInputWithDropdown extends StatefulWidget {
  final String hint, icon, label;
  final int maxLines;
  final bool isValidator;
  final EdgeInsetsGeometry? paddings;
  final TextEditingController controller;

  const SendMoneyInputWithDropdown({
    Key? key,
    required this.controller,
    required this.hint,
    this.icon = "",
    this.isValidator = true,
    this.maxLines = 1,
    this.paddings,
    required this.label,
  }) : super(key: key);

  @override
  State<SendMoneyInputWithDropdown> createState() => _PrimaryInputWidgetState();
}

class _PrimaryInputWidgetState extends State<SendMoneyInputWithDropdown> {
  FocusNode? focusNode;
  final currencyController = Get.put(SendMoneyController());

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    focusNode!.dispose();
    super.dispose();
  }

  final languageController = Get.put(LanguageController());
  @override
  Widget build(BuildContext context) {
    bool isTablet() {
      return MediaQuery.of(context).size.shortestSide >= 600;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleHeading4Widget(
          text: widget.label,
          fontWeight: FontWeight.w600,
          color: CustomColor.primaryTextColor,
        ),
        verticalSpace(Dimensions.marginBetweenInputTitleAndBox),
        Row(
          children: [
            Expanded(
              flex: 9,
              child: TextFormField(
                validator: widget.isValidator == false
                    ? null
                    : (String? value) {
                        if (value!.isEmpty) {
                          return Strings.pleaseFillOutTheField;
                        } else {
                          return null;
                        }
                      },
                textInputAction: TextInputAction.done,
                controller: widget.controller,
                onTap: () {
                  setState(() {
                    focusNode!.requestFocus();
                  });
                },
                onChanged: (v) {
                  currencyController.getFee(
                      rate: currencyController.rate.value);
                },
                onFieldSubmitted: (value) {
                  setState(() {
                    focusNode!.unfocus();
                  });
                },
                focusNode: focusNode,
                textAlign: TextAlign.left,
                style: CustomStyle.darkHeading3TextStyle.copyWith(
                  color: CustomColor.primaryTextColor,
                ),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                keyboardType: TextInputType.number,
                maxLines: widget.maxLines,
                decoration: InputDecoration(
                  hintText: languageController.getTranslation(widget.hint),
                  hintStyle: GoogleFonts.inter(
                    fontSize: Dimensions.headingTextSize3,
                    fontWeight: FontWeight.w500,
                    color: CustomColor.primaryTextColor.withOpacity(0.2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius * 0.5),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor.withOpacity(0.2),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius * 0.5),
                    borderSide: BorderSide(
                        width: 2, color: Theme.of(context).primaryColor),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius * 0.5),
                    borderSide: const BorderSide(color: Colors.red, width: 2),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius * 0.5),
                    borderSide: const BorderSide(color: Colors.red, width: 2),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: Dimensions.widthSize * 1.7,
                    vertical: Dimensions.heightSize,
                  ),
                  suffixIcon: Obx(
                    () => Container(
                      height: Dimensions.inputBoxHeight,
                      padding:
                          EdgeInsets.only(left: Dimensions.widthSize * 0.5),
                      alignment: Alignment.centerRight,
                      width: isTablet()
                          ? Dimensions.widthSize * 6
                          : Dimensions.widthSize * 7.5,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(Dimensions.radius * 0.5),
                            bottomRight:
                                Radius.circular(Dimensions.radius * 0.5),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: DropdownButton(
                          iconEnabledColor: CustomColor.whiteColor,
                          iconSize: Dimensions.heightSize * 1.5,
                          dropdownColor: Theme.of(context).primaryColor,
                          underline: Container(),
                          items: currencyController.baseCurrencyList
                              .map<DropdownMenuItem<String>>(
                            (value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: GoogleFonts.inter(
                                    color: CustomColor.whiteColor,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              );
                            },
                          ).toList(),
                          onChanged: (String? value) {
                            currencyController.baseCurrency.value = value!;
                          },
                          value: currencyController.baseCurrency.value,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
