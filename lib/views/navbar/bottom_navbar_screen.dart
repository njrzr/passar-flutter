import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:passar/controller/navbar/navbar_controller.dart';
import 'package:passar/custom_assets/assets.gen.dart';
import 'package:passar/routes/routes.dart';
import 'package:passar/views/others/custom_image_widget.dart';

import '../../language/english.dart';
import '../../utils/custom_color.dart';
import '../../utils/dimensions.dart';
import '../../widgets/bottom_navbar/bottom_navber.dart';
import '../../widgets/drawer/drawer_widget.dart';
import '../../widgets/text_labels/title_heading4_widget.dart';

class BottomNavBarScreen extends StatelessWidget {
  final bottomNavBarController = Get.put(NavbarController(), permanent: false);
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  BottomNavBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        drawer: CustomDrawer(),
        key: scaffoldKey,
        appBar: appBarWidget(context),
        extendBody: true,
        backgroundColor: Theme.of(context).primaryColor,
        bottomNavigationBar:
            buildBottomNavigationMenu(context, bottomNavBarController),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: bottomNavBarController
            .page[bottomNavBarController.selectedIndex.value],
      ),
    );
  }

  appBarWidget(BuildContext context) {
    bool isTablet() {
      return MediaQuery.of(context).size.shortestSide >= 600;
    }

    return AppBar(
      backgroundColor: bottomNavBarController.selectedIndex.value == 0
          ? Theme.of(context).primaryColor
          : CustomColor.primaryLightScaffoldBackgroundColor,
      elevation: bottomNavBarController.selectedIndex.value == 0 ? 0 : 0,
      centerTitle:
          bottomNavBarController.selectedIndex.value == 0 ? true : false,
      leading: bottomNavBarController.selectedIndex.value == 0
          ? GestureDetector(
              onTap: () {
                scaffoldKey.currentState!.openDrawer();
              },
              child: Padding(
                padding: EdgeInsets.only(
                  left: isTablet()
                      ? Dimensions.paddingSize * 0.2
                      : Dimensions.paddingSize,
                  right: isTablet() ? 0 : Dimensions.paddingSize * 0.2,
                ),
                child: CustomImageWidget(
                  path: Assets.icon.drawerMenu,
                  height: Dimensions.heightSize * 2,
                  width: Dimensions.widthSize * 2.4,
                  color: CustomColor.whiteColor,
                ),
              ),
            )
          : Container(),
      title: bottomNavBarController.selectedIndex.value == 0
          ? Padding(
              padding: EdgeInsets.all(Dimensions.paddingSize * 1.2),
              child: TitleHeading4Widget(
                  text: Strings.appName,
                  fontWeight: FontWeight.w500,
                  color: CustomColor.whiteColor,
                  fontSize: Dimensions.headingTextSize1 * 0.8),
            )
          : Container(
              padding: EdgeInsets.only(left: Dimensions.paddingSize),
              child: TitleHeading4Widget(
                text: Strings.notification,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w500,
                fontSize: Dimensions.headingTextSize1 * 0.8,
                color: Theme.of(context).primaryColor,
              ),
            ),
      actions: [
        bottomNavBarController.selectedIndex.value == 0
            ? Padding(
                padding: EdgeInsets.only(right: Dimensions.paddingSize * 0.6),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.profileScreen);
                  },
                  child: CustomImageWidget(
                    path: Assets.icon.profile,
                    height: Dimensions.heightSize * 2.4,
                    width: Dimensions.widthSize * 2.8,
                    color: CustomColor.whiteColor,
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
