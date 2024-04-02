import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import 'package:we_green_v1/core/constant/color.dart';
import 'package:we_green_v1/features/add_waste/screens/add_waste_screens.dart';
import 'package:we_green_v1/features/home/screens/home_screen.dart';
import 'package:we_green_v1/features/profile/screens/profile_screen.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(() => AnimatedBottomNavigationBar.builder(
            itemCount: NavigationController().screens.length,
            tabBuilder: (int index, bool isActive) {
              final color = isActive ? AppColor.ink : Colors.grey;
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  controller.selectedIndex == index
                      ? Icon(
                          NavigationController().icons[index],
                          size: 22.sp,
                          color: color,
                        )
                      : Transform.translate(
                          offset: Offset(0, 1.h),
                          child: Icon(
                            NavigationController().icons[index],
                            size: 20.sp,
                            color: color,
                          ),
                        ),
                  SizedBox(height: 0.1.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      controller.selectedIndex == index
                          ? NavigationController()
                              .bottomnavigationbaritems[index]
                          : '',
                      maxLines: 1,
                      style: TextStyle(
                          color: color,
                          fontSize: isActive ? 8.sp : 8.sp,
                          fontFamily: 'DMSans',
                          fontWeight:
                              isActive ? FontWeight.bold : FontWeight.normal),
                    ),
                  )
                ],
              );
            },
            activeIndex: controller.selectedIndex.value,
            gapWidth: 2.w,
            notchSmoothness: NotchSmoothness.softEdge,
            onTap: (index) {
              controller.selectedIndex.value = index;
            },
          )),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const HomeScreen(),
    const AddWasteScreen(),
    const ProfileScreen(),
  ];
  final icons = [
    Iconsax.home,
    Icons.add_circle_outline_outlined,
    Iconsax.user,
  ];

  List bottomnavigationbaritems = [
    'home',
    'add waste',
    'profile',
  ];
}
