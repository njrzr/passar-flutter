import 'package:get/get.dart';
import 'package:passar/backend/services/api_endpoint.dart';
import 'package:passar/routes/routes.dart';
import 'package:passar/views/auth/kyc_from/wait_for_approval_screen.dart';
import 'package:passar/views/auth/login/otp_verification_screen.dart';
import 'package:passar/views/auth/registration/email_otp_screen.dart';
import 'package:passar/views/auth/registration/registration_screen.dart';
import 'package:passar/views/categories/add_money/add_money_preview_screen.dart';
import 'package:passar/views/categories/bill_pay/bill_pay_screen.dart';
import 'package:passar/views/categories/mobile_topup/mobile_topup_screen.dart';
import 'package:passar/views/categories/remittance/remitance_preview_screen.dart';
import 'package:passar/views/categories/send_money/qr_code_screen.dart';
import 'package:passar/views/categories/send_money/send_money_preview_screen.dart';
import 'package:passar/views/categories/send_money/send_money_screen.dart';
import 'package:passar/views/categories/virtual_card/flutter_wave_virtual_card/add_fund_screen.dart';
import 'package:passar/views/categories/virtual_card/flutter_wave_virtual_card/card_details_screen.dart';
import 'package:passar/views/categories/virtual_card/flutter_wave_virtual_card/fund_preview_screen.dart';
import 'package:passar/views/categories/withdraw/withdraw_preview_screen.dart';
import 'package:passar/views/drawer/bill_payment_log_screen.dart';
import 'package:passar/views/drawer/change_password_screen.dart';
import 'package:passar/views/drawer/mobile_log_screen.dart';
import 'package:passar/views/drawer/saved_recipient_screen.dart';
import 'package:passar/views/drawer/setting_screen.dart';
import 'package:passar/views/drawer/transaction_logs_screen.dart';
import 'package:passar/views/navbar/bottom_navbar_screen.dart';
import 'package:passar/views/navbar/dashboard_screen.dart';
import 'package:passar/views/navbar/notification_screen.dart';
import 'package:passar/views/onboard/onboard_screen.dart';
import 'package:passar/views/profile/2fa/enable_2fa_screen.dart';
import 'package:passar/views/profile/2fa/two_fa_otp_screen.dart';
import 'package:passar/views/profile/my_wallet_screen.dart';
import 'package:passar/views/profile/profile_screen.dart';
import 'package:passar/views/profile/update_kyc_screen.dart';
import 'package:passar/views/profile/update_profile_screen.dart';

import '../bindings/splash_screen_binding.dart';
import '../language/english.dart';
import '../views/auth/kyc_from/kyc_from_screen.dart';
import '../views/auth/login/email_verification_screen.dart';
import '../views/auth/login/reset_password_screen.dart';
import '../views/auth/login/signin_screen.dart';
import '../views/categories/add_money/add_money_manual_payment_screen.dart';
import '../views/categories/add_money/add_money_screen.dart';
import '../views/categories/add_money/flutterwave_web_payment_screen.dart';
import '../views/categories/add_money/pagadito_web_payment_screen.dart';
import '../views/categories/add_money/paypal_web_payment_screen.dart';
import '../views/categories/add_money/razor_pay_web_screen.dart';
import '../views/categories/add_money/stripe_web_payment_screen.dart';
import '../views/categories/bill_pay/billpay_preview_screen.dart';
import '../views/categories/make_payment/make_payment_qr_code_screen.dart';
import '../views/categories/make_payment/make_payment_screen.dart';
import '../views/categories/mobile_topup/mobile_preview_screen.dart';
import '../views/categories/received_money/money_received_screen.dart';
import '../views/categories/remittance/add_recipient_screen.dart';
import '../views/categories/remittance/edit_recipient_screen.dart';
import '../views/categories/remittance/remitance_screen.dart';
import '../views/categories/virtual_card/flutter_wave_virtual_card/transaction_history_screen.dart';
import '../views/categories/virtual_card/sudo_virtual_card/sudo_add_fund_screen.dart';
import '../views/categories/virtual_card/sudo_virtual_card/sudo_card_details_screen.dart';
import '../views/categories/virtual_card/virtual_card_screen.dart';
import '../views/categories/withdraw/withdraw_flutterwave_screen.dart';
import '../views/categories/withdraw/withdraw_manual_payment_screen.dart';
import '../views/categories/withdraw/withdraw_screen.dart';
import '../views/drawer/giftcard_log_screen.dart';
import '../views/drawer/web_view.dart';
import '../views/splash_screen/splash_screen.dart';

class RoutePageList {
  static var list = [
    //!auth
    GetPage(
      name: Routes.splashScreen,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.onboardScreen,
      page: () => OnboardScreen(),
    ),

    GetPage(
      name: Routes.signInScreen,
      page: () => const SignInScreen(),
    ),
    GetPage(
      name: Routes.resetOtpScreen,
      page: () => ResetOtpScreen(),
    ),
    GetPage(
      name: Routes.resetPasswordScreen,
      page: () => ResetPasswordScreen(),
    ),
    GetPage(
      name: Routes.registrationScreen,
      page: () => RegistrationScreen(),
    ),
    GetPage(
      name: Routes.emailOtpScreen,
      page: () => EmailOtpScreen(),
    ),

    // GetPage(
    //   name: Routes.facelockConfirmScreen,
    //   page: () => FaceLockConfirmScreen(),
    // ),
    // GetPage(
    //   name: Routes.facelockCaptureScreen,
    //   page: () => FaceLockCaptureScreen(),
    // ),
    // GetPage(
    //   name: Routes.fingerprintScreen,
    //   page: () => FingerPrintScreen(),
    // ),
    GetPage(
      name: Routes.kycFromScreen,
      page: () => KycFromScreen(),
    ),
    GetPage(
      name: Routes.waitForApprovalScreen,
      page: () => const WaitForApprovalScreen(),
    ),

    //!categories
    GetPage(
      name: Routes.bottomNavBarScreen,
      page: () => BottomNavBarScreen(),
    ),
    GetPage(
      name: Routes.dashboardScreen,
      page: () => DashboardScreen(),
    ),
    GetPage(
      name: Routes.notificationScreen,
      page: () => NotificationScreen(),
    ),

    GetPage(
      name: Routes.qRCodeScreen,
      page: () => const QRCodeScreen(),
    ),
    GetPage(
      name: Routes.moneyTransferScreen,
      page: () => MoneyTransferScreen(),
    ),
    GetPage(
      name: Routes.sendMoneyPreviewScreen,
      page: () => SendMoneyPreviewScreen(),
    ),
    GetPage(
      name: Routes.moneyReceiveScreen,
      page: () => MoneyReceiveScreen(),
    ),
    GetPage(
      name: Routes.remittanceScreen,
      page: () => RemittanceScreen(),
    ),
    GetPage(
      name: Routes.remittancePreviewScreen,
      page: () => RemittancePreviewScreen(),
    ),
    GetPage(
      name: Routes.addRecipientScreen,
      page: () => AddRecipientScreen(),
    ),
    GetPage(
      name: Routes.editRecipientScreen,
      page: () => EditRecipientScreen(),
    ),
    //todo_virtual card
    GetPage(
      name: Routes.virtualCardScreen,
      page: () => VirtualCardScreen(),
    ),
    GetPage(
      name: Routes.cardDetailsScreen,
      page: () => CardDetailsScreen(),
    ),
    GetPage(
      name: Routes.addFundScreen,
      page: () => AddFundScreen(appBarTitle: Strings.addFund),
    ),
    GetPage(
      name: Routes.buyCardScreen,
      page: () => AddFundScreen(appBarTitle: Strings.createCard),
    ),
    GetPage(
      name: Routes.sudoCreateCardScreen,
      page: () => SudoAddFundScreen(appBarTitle: Strings.createCard),
    ),
    GetPage(
      name: Routes.sudoAddFuncCardScreen,
      page: () => SudoAddFundScreen(appBarTitle: Strings.addFund),
    ),
    GetPage(
      name: Routes.addFundPreviewScreen,
      page: () => const AddFundPreviewScreen(),
    ),
    GetPage(
      name: Routes.transactionHistoryScreen,
      page: () => TransactionHistoryScreen(),
    ),

    //deposti,withdraw,mobile,billpay
    GetPage(
      name: Routes.addMoneyScreen,
      page: () => DepositScreen(),
    ),
    GetPage(
      name: Routes.depositPreviewScreen,
      page: () => DepositPreviewScreen(),
    ),
    GetPage(
      name: Routes.withdrawScreen,
      page: () => WithdrawScreen(),
    ),
    GetPage(
      name: Routes.withdrawPreviewScreen,
      page: () => WithdrawPreviewScreen(),
    ),
    GetPage(
      name: Routes.mobileToUpScreen,
      page: () => MobileTopUpScreen(),
    ),
    GetPage(
      name: Routes.mobilePreviewScreen,
      page: () => const MobilePreviewScreen(),
    ),
    GetPage(
      name: Routes.billPayScreen,
      page: () => BillPayScreen(),
    ),
    GetPage(
      name: Routes.billPayPreviewScreen,
      page: () => const BillpayPreviewScreen(),
    ),
    GetPage(
      name: Routes.makePaymentQRCodeScreen,
      page: () => const MakePaymentQRCodeScreen(),
    ),
    GetPage(
      name: Routes.makePaymentScreen,
      page: () => MakePaymentScreen(),
    ),
    GetPage(
      name: Routes.makePaymentPreviewScreen,
      page: () => SendMoneyPreviewScreen(),
    ),

    //!drawer screens
    GetPage(
      name: Routes.saveRecipientScreen,
      page: () => SaveRecipientScreen(),
    ),

    GetPage(
      name: Routes.transactionLogScreen,
      page: () => TransactionLogScreen(),
    ),
    GetPage(
        name: Routes.giftCardLogScreen, page: () => const GiftCardLogScreen()),
    GetPage(
      name: Routes.billPaymentLogScreen,
      page: () => BillPaymentLogScreen(),
    ),
    GetPage(
      name: Routes.mobileLogScreen,
      page: () => MobileLogScreen(),
    ),
    GetPage(
      name: Routes.settingScreen,
      page: () => SettingScreen(),
    ),
    GetPage(
      name: Routes.changePasswordScreen,
      page: () => ChangePasswordScreen(),
    ),

    //!profile screen
    GetPage(
      name: Routes.profileScreen,
      page: () => ProfileScreen(),
    ),
    GetPage(
      name: Routes.myWalletScreen,
      page: () => const MyWalletScreen(),
    ),
    GetPage(
      name: Routes.updateProfileScreen,
      page: () => UpdateProfileScreen(),
    ),
    GetPage(
      name: Routes.updateKycScreen,
      page: () => UpdateKycScreen(),
    ),
    GetPage(
      name: Routes.enable2FaScreen,
      page: () => Enable2FaScreen(),
    ),
    GetPage(
      name: Routes.otp2FaScreen,
      page: () => Otp2FaScreen(),
    ),
    GetPage(
      name: Routes.paypalWebPaymentScreen,
      page: () => PaypalWebPaymentScreen(),
    ),
    GetPage(
      name: Routes.flutterWaveWebPaymentScreen,
      page: () => FlutterWaveWebPaymentScreen(),
    ),

    GetPage(
      name: Routes.stripeWebPaymentScreen,
      page: () => StripeWebPaymentScreen(),
    ),
    GetPage(
      name: Routes.sendMoneyManualPaymentScreen,
      page: () => AddMoneyManualPaymentScreen(),
    ),
    GetPage(
      name: Routes.withdrawManualPaymentScreen,
      page: () => WithdrawManualPaymentScreen(),
    ),
    GetPage(
      name: Routes.withdrawFlutterwaveScreen,
      page: () => WithdrawFlutterWaveScreen(),
    ),

    GetPage(
      name: Routes.emailVerificationScreen,
      page: () => EmailVerificationScreen(),
    ),
    GetPage(
      name: Routes.sudoCardDetailsScreen,
      page: () => SudoCardDetailsScreen(),
    ),

    GetPage(
      name: Routes.razorPayScreen,
      page: () => RazorPayWebPaymentScreen(),
    ),

    GetPage(
      name: Routes.pagaditoWebPaymentScreen,
      page: () => PagaditoWebPaymentScreen(),
    ),

    GetPage(
      name: Routes.helpCenterScreen,
      page: () => WebScreen(
        title: Strings.helpCenter,
        url: "${ApiEndpoint.mainDomain}/contact",
      ),
    ),

    GetPage(
      name: Routes.privacyScreen,
      page: () => WebScreen(
        title: Strings.privacyPolicy,
        url: "${ApiEndpoint.mainDomain}/page/privacy-policy",
      ),
    ),
    GetPage(
      name: Routes.aboutUsScreen,
      page: () => WebScreen(
        title: Strings.aboutUs,
        url: "${ApiEndpoint.mainDomain}/about",
      ),
    ),
  ];
}
