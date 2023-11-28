import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:passar/utils/responsive_layout.dart';
import 'package:passar/widgets/appbar/appbar_widget.dart';

import '../../../backend/utils/custom_loading_api.dart';
import '../../../controller/categories/withdraw_controller/withdraw_controller.dart';
import '../../../language/english.dart';
import '../../../widgets/others/customInput_widget.dart/withdraw_keyboard_widget.dart';

class WithdrawScreen extends StatelessWidget {
  WithdrawScreen({super.key});

  final controller = Get.put(WithdrawController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: Scaffold(
        appBar: const AppBarWidget(text: Strings.withdraw),
        body: Obx(
          () => controller.isLoading
              ? const CustomLoadingAPI()
              : _bodyWidget(context),
        ),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        WithdrawKeyboardWidget(
          isLoading: controller.isInsertLoading.obs,
          buttonText: Strings.withdraw,
          onTap: () {
            debugPrint(controller.selectedCurrencyAlias.value);
            if (controller.amountTextController.text.isNotEmpty) {
              if (controller.selectedCurrencyType.value.contains("AUTOMATIC")) {
                if (controller.selectedCurrencyAlias.value == "flutterwave-ngn-money-out-automatic" ||
                    controller.selectedCurrencyAlias.value ==
                        "flutterwave-usd-money-out-automatic" ||
                    controller.selectedCurrencyAlias.value ==
                        "flutterwave-tzs-money-out-automatic") {
                  controller.automaticPaymentFlutterwaveInsertProcess();
                }
              } else {
                controller.manualPaymentGetGatewaysProcess();
              }
            }
          },
        ),
      ],
    );
  }
}
