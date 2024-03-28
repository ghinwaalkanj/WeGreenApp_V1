import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import 'package:we_green_v1/core/constant/color.dart';
import 'package:we_green_v1/features/add_waste/screens/add_waste_screens.dart';
import 'package:we_green_v1/features/home/screens/home_screen.dart';
import 'package:we_green_v1/features/profile/screens/profile_screen.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 8.h,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: AppColor.white,
          indicatorColor: AppColor.beige.withOpacity(0.4),
          //indicatorColor: AppColor.green.withOpacity(0.2),
          destinations: const [
            NavigationDestination(
              icon: Icon(
                Iconsax.home,
                color: AppColor.ink,
              ),
              label: 'Home',
            ),
            NavigationDestination(
              icon:
                  Icon(Icons.add_circle_outline_outlined, color: AppColor.ink),
              label: 'Add waste',
            ),
            NavigationDestination(
                icon: Icon(Iconsax.user, color: AppColor.ink),
                label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    HomeScreen(),
    AddWasteScreen(),
    ProfileScreen(),
  ];
}
