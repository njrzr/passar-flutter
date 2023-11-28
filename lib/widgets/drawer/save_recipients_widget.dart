import 'package:passar/utils/custom_color.dart';
import 'package:passar/utils/custom_style.dart';
import 'package:passar/widgets/others/custom_glass/custom_glass_widget.dart';
import 'package:passar/widgets/text_labels/custom_title_heading_widget.dart';
import 'package:passar/widgets/text_labels/title_heading3_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/dimensions.dart';
import '../../utils/size.dart';
import '../text_labels/title_heading4_widget.dart';

class SaveRecipientWidget extends StatelessWidget {
  SaveRecipientWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.type,
    required this.onTap,
  });

  final List<String> moreList = [
    "Edit Recipient",
    "Remove Recipient",
    // "Send"
  ];
  final String title, subTitle, type;
  final void Function(String?) onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Dimensions.paddingSize * 0.3),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius),
          color: Theme.of(context).primaryColor.withOpacity(0.05),
        ),
        padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize * 0.2),
        height: Dimensions.heightSize * 6,
        child: Row(
          children: [
            horizontalSpace(Dimensions.marginSizeHorizontal * .4),
            Expanded(
              flex: 7,
              child: Column(
                crossAxisAlignment: crossStart,
                mainAxisAlignment: mainCenter,
                children: [
                  Row(
                    children: [
                      TitleHeading3Widget(
                        text: title,
                      ),
                      horizontalSpace(Dimensions.paddingSize * .5),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.paddingSize * .3,
                          vertical: Dimensions.paddingSize * .1,
                        ),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius),
                            color: CustomColor.yellowColor.withOpacity(.5)),
                        child: TitleHeading4Widget(
                          text: type,
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(Dimensions.widthSize * 0.7),
                  CustomTitleHeadingWidget(
                    text: subTitle,
                    style: CustomStyle.darkHeading4TextStyle.copyWith(
                        fontSize: Dimensions.headingTextSize5,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: (() {
                  _showDialog(context);
                }),
                child: Icon(
                  Icons.more_vert,
                  size: Dimensions.heightSize * 2,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showDialog(BuildContext context) {
    showDialog(
        barrierColor: CustomColor.whiteColor.withOpacity(0.8),
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: List.generate(
                    moreList.length,
                    (index) => Container(
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width * 0.6,
                      color: Theme.of(context).primaryColor.withOpacity(0.1),
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.widthSize * 1,
                          vertical: Dimensions.heightSize * 0.1),
                      child: TextButton(
                          onPressed: () {
                            onTap(moreList[index]);
                          },
                          child: Row(
                            children: [
                              Text(
                                moreList[index],
                                style: GoogleFonts.inter(
                                  fontSize: Dimensions.headingTextSize3,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          )),
                    ).customGlassWidget(
                        tintColor:
                            Theme.of(context).primaryColor.withOpacity(0.2),
                        clipBorderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(
                              index == 2 ? Dimensions.radius * 0.6 : 0),
                          bottomRight: Radius.circular(
                              index == 2 ? Dimensions.radius * 0.6 : 0),
                          topLeft: Radius.circular(
                              index == 0 ? Dimensions.radius * 0.6 : 0),
                          topRight: Radius.circular(
                              index == 0 ? Dimensions.radius * 0.6 : 0),
                        )),
                  ),
                ),
              ));
        });
  }
}
