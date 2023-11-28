import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:passar/backend/utils/custom_loading_api.dart';
import 'package:passar/controller/categories/deposit/deposti_controller.dart';
import 'package:passar/utils/responsive_layout.dart';
import 'package:passar/widgets/appbar/appbar_widget.dart';

import '../../../language/english.dart';
import '../../../widgets/others/customInput_widget.dart/deposit_keyboard.dart';

class DepositScreen extends StatelessWidget {
  DepositScreen({super.key});

  final controller = Get.put(DepositController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: Scaffold(
        appBar: const AppBarWidget(text: Strings.addMoney),
        body: Obx(
          () => controller.isLoading
              ? const CustomLoadingAPI()
              : _bodyWidget(context),
        ),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return CustomAmountWidget(
      isLoading: controller.isInsertLoading.obs,
      buttonText: Strings.addMoney,
      onTap: () {
        debugPrint(controller.selectedCurrencyAlias.value);
        if (controller.selectedCurrencyType.value.contains("AUTOMATIC")) {
          if (controller.selectedCurrencyAlias.contains('paypal')) {
            controller.addMoneyPaypalInsertProcess();
          } else if (controller.selectedCurrencyAlias.contains('flutterwave')) {
            controller.addMoneyFlutterWaveInsertProcess();
          } else if (controller.selectedCurrencyAlias.contains('stripe')) {
            controller.addMoneyStripeInsertProcess();
          } else if (controller.selectedCurrencyAlias.contains('razorpay')) {
            controller.addMoneyRazorPayInsertProcess();
          }
           else if (controller.selectedCurrencyAlias.contains('pagadito')) {
            controller.addMoneyPagaditoInsertProcess();
          }
        } else if (controller.selectedCurrencyType.value.contains('MANUAL')) {
          controller.manualPaymentGetGatewaysProcess();
        }
      },
    );
  }
}
