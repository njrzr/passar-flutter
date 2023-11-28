import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:passar/utils/dimensions.dart';
import 'package:passar/utils/responsive_layout.dart';
import 'package:passar/widgets/appbar/appbar_widget.dart';
import 'package:passar/widgets/buttons/primary_button.dart';
import 'package:passar/widgets/others/preview/amount_preview_widget.dart';
import 'package:passar/widgets/others/preview/information_amount_widget.dart';
import 'package:passar/widgets/others/preview/recipient_preview_widget.dart';

import '../../../controller/categories/send_money/send_money_controller.dart';
import '../../../language/english.dart';

class SendMoneyPreviewScreen extends StatelessWidget {
  SendMoneyPreviewScreen({super.key});

  final controller = Get.put(SendMoneyController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileScaffold: Scaffold(
      appBar: const AppBarWidget(text: Strings.preview),
      body: _bodyWidget(context),
    ));
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize * 0.8),
      physics: const BouncingScrollPhysics(),
      children: [
        _amountWidget(context),
        _recipientWidget(context),
        _amountInformationWidget(context),
        _buttonWidget(context),
      ],
    );
  }

  _amountWidget(BuildContext context) {
    return previewAmount(amount: controller.enteredAmount);
  }

  _recipientWidget(BuildContext context) {
    return previewRecipient(
      recipient: Strings.recipientInformation,
      name: Strings.jhonsGrill,
      nameRow: controller.copyInputController.text,
      subTitle: Strings.jhonsGrillGmail,
      subTitleRow: Strings.qrAddress,
    );
  }

  _amountInformationWidget(BuildContext context) {
    return amountInformationWidget(
      information: Strings.amountInformation,
      enterAmount: Strings.enterAmount,
      enterAmountRow: controller.enteredAmount,
      fee: Strings.transferFee,
      feeRow: controller.transferFeeAmount,
      received: Strings.recipientReceived,
      receivedRow: controller.youWillGet,
      total: Strings.totalPayable,
      totalRow: controller.payableAmount,
    );
  }

  _buttonWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: Dimensions.marginSizeVertical * 2,
      ),
      child: PrimaryButton(title: Strings.confirm, onPressed: () {}),
    );
  }
}
