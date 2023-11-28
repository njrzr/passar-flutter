import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passar/utils/basic_screen_imports.dart';

import '../../language/language_controller.dart';

class PrimaryInputWidget extends StatefulWidget {
  final String hint, icon, label;
  final int maxLines;
  final bool isValidator;
  final EdgeInsetsGeometry? paddings;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged? onChanged;
  final ValueChanged? onFieldSubmitted;
  final bool? readOnly;

  const PrimaryInputWidget({
    Key? key,
    required this.controller,
    required this.hint,
    this.icon = "",
    this.isValidator = true,
    this.maxLines = 1,
    this.paddings,
    required this.label,
    this.keyboardType,
    this.inputFormatters,
    this.onChanged,
    this.onFieldSubmitted,
    this.readOnly,
  }) : super(key: key);

  @override
  State<PrimaryInputWidget> createState() => _PrimaryInputWidgetState();
}

class _PrimaryInputWidgetState extends State<PrimaryInputWidget> {
  FocusNode? focusNode;

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleHeading4Widget(
          text: widget.label,
          fontWeight: FontWeight.w600,
          color: CustomColor.primaryTextColor,
        ),
        verticalSpace(7),
        Obx(
          () => TextFormField(
            readOnly: widget.readOnly ?? false,
            validator: widget.isValidator == false
                ? null
                : (String? value) {
                    if (value!.isEmpty) {
                      return Strings.pleaseFillOutTheField;
                    } else {
                      return null;
                    }
                  },
            textInputAction: TextInputAction.next,
            controller: widget.controller,
            onTap: () {
              setState(() {
                focusNode!.requestFocus();
              });
            },
            onFieldSubmitted: widget.onFieldSubmitted ??
                (value) {
                  setState(() {
                    focusNode!.unfocus();
                  });
                },
            onChanged: widget.onChanged,
            focusNode: focusNode,
            textAlign: TextAlign.left,
            style: CustomStyle.darkHeading3TextStyle.copyWith(
              color: CustomColor.primaryTextColor,
            ),
            keyboardType: widget.keyboardType,
            inputFormatters: widget.inputFormatters,
            maxLines: widget.maxLines,
            decoration: InputDecoration(
              hintText: languageController.getTranslation(widget.hint),
              hintStyle: GoogleFonts.inter(
                fontSize: Dimensions.headingTextSize3,
                fontWeight: FontWeight.w500,
                color: CustomColor.primaryTextColor.withOpacity(0.2),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
                borderSide: const BorderSide(
                  color: CustomColor.transparent,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor.withOpacity(0.2),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
                borderSide:
                    BorderSide(width: 2, color: Theme.of(context).primaryColor),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: Dimensions.widthSize * 1.7,
                vertical: Dimensions.heightSize,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
