import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:we_green_v1/common_widgets/bg.dart';
import 'package:we_green_v1/core/constant/color.dart';
import 'package:we_green_v1/core/constant/image_strings.dart';
import '../../../common_widgets/Drawer.dart';
import '../../../common_widgets/EndDrawer.dart';
import '../../../common_widgets/loading_screen.dart';
import '../../../common_widgets/navigation_menu.dart';
import '../../../core/class/statusrequest.dart';
import '../../../common_widgets/appBar.dart';
import '../controller/calender_controller.dart';

class CalenderScreen extends StatelessWidget {
  const CalenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CalenderControllerImp());

    return GetBuilder<CalenderControllerImp>(
      builder: (controller) => controller.statusRequest == StatusRequest.loading
          ? const LoadingScreen()
          : Scaffold(
              key: controller.scaffoldKey,
              drawer: const MyDrawer(),
              endDrawer: const NotificationDrawer(),
              body: Form(
                key: controller.form,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const bg(),
                    CustomAppBar(
                        image: Transform.scale(
                          scale: 0.25,
                          origin: Offset(0, -11.h),
                          child: Image.asset(AppImages.calender),
                        ),
                        onPressed: () {
                          controller.scaffoldKey.currentState?.openDrawer();
                        },
                        onTap: () {
                          controller.scaffoldKey.currentState?.openEndDrawer();
                        }),
                    Positioned(
                      top: 26.h,
                      child: Text(
                        'Calender',
                        style: TextStyle(
                          color: AppColor.green,
                          fontFamily: 'DMSans',
                          fontWeight: FontWeight.bold,
                          fontSize: 17.sp,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 25.h,
                      left: 5.w,
                      child: IconButton(
                        onPressed: () {
                          Get.offAll(const NavigationMenu());
                        },
                        icon: const Icon(Icons.arrow_back_outlined),
                        color: Colors.black54,
                      ),
                    ),
                    Positioned(
                      top: 31.h,
                      child: SizedBox(
                        height: 38.h,
                        width: 85.w,
                        child: TableCalendar(
                          firstDay: DateTime.utc(2010, 10, 16),
                          lastDay: DateTime.utc(2030, 3, 14),
                          focusedDay: DateTime.now(),
                          rowHeight: 4.4.h,
                          headerStyle: HeaderStyle(
                            formatButtonVisible: false,
                            titleTextStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: 'DMSans',
                              fontSize: 13.sp,
                              color: AppColor.ink,
                            ),
                          ),
                          calendarStyle: const CalendarStyle(
                            todayDecoration: BoxDecoration(
                                shape: BoxShape.rectangle, color: AppColor.ink),
                          ),
                          daysOfWeekStyle: const DaysOfWeekStyle(
                            weekendStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            weekdayStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 64.h,
                        right: 8.w,
                        child: GestureDetector(
                          onTap: () {
                            Get.defaultDialog(
                                radius: 25.sp,
                                title: 'Set date',
                                titlePadding:
                                    EdgeInsets.fromLTRB(0, 3.h, 40.w, 0),
                                titleStyle: TextStyle(
                                  color: AppColor.ink,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'DMSans',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13.sp,
                                ),
                                backgroundColor: Colors.white,
                                content: Container(
                                  height: 30.h,
                                  width: 80.w,
                                  padding:
                                      EdgeInsets.fromLTRB(0.w, 2.h, 0.w, 0),
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 7.w,
                                    vertical: 0.h,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 4.h,
                                        child: TextField(
                                          style: const TextStyle(
                                            fontFamily: 'DMSans',
                                          ),
                                          controller: controller.title,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              horizontal: 5.w,
                                            ),
                                            hintText: 'title',
                                            hintStyle: TextStyle(
                                              fontFamily: 'DMSans',
                                              fontSize: 11.sp,
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(11.sp),
                                              borderSide: const BorderSide(
                                                color: Colors.grey,
                                                width: 1.0,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(11.sp),
                                              borderSide: const BorderSide(
                                                color: Colors.grey,
                                                width: 1.0,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(11.sp),
                                              borderSide: const BorderSide(
                                                color: AppColor.green,
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      SizedBox(
                                        height: 4.h,
                                        child: TextField(
                                          style: const TextStyle(
                                            fontFamily: 'DMSans',
                                          ),
                                          readOnly: true,
                                          onTap: () {
                                            controller.pickDate();
                                          },
                                          decoration: InputDecoration(
                                            suffixIcon: const Icon(
                                              Icons.calendar_month,
                                              color: Colors.black38,
                                            ),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              horizontal: 5.w,
                                            ),
                                            hintText: 'date',
                                            hintStyle: TextStyle(
                                              fontFamily: 'DMSans',
                                              fontSize: 11.sp,
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(11.sp),
                                              borderSide: const BorderSide(
                                                color: Colors.grey,
                                                width: 1.0,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(11.sp),
                                              borderSide: const BorderSide(
                                                color: Colors.grey,
                                                width: 1.0,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(11.sp),
                                              borderSide: const BorderSide(
                                                color: AppColor.green,
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      SizedBox(
                                        height: 4.h,
                                        child: TextField(
                                          style: const TextStyle(
                                            fontFamily: 'DMSans',
                                          ),
                                          readOnly: true,
                                          onTap: () {
                                            controller.pickTime();
                                          },
                                          decoration: InputDecoration(
                                            suffixIcon: const Icon(
                                              Icons.access_time_rounded,
                                              color: Colors.black38,
                                            ),
                                            contentPadding:
                                            EdgeInsets.symmetric(
                                              horizontal: 5.w,
                                            ),
                                            hintText: 'time',
                                            hintStyle: TextStyle(
                                              fontFamily: 'DMSans',
                                              fontSize: 11.sp,
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(11.sp),
                                              borderSide: const BorderSide(
                                                color: Colors.grey,
                                                width: 1.0,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(11.sp),
                                              borderSide: const BorderSide(
                                                color: Colors.grey,
                                                width: 1.0,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(11.sp),
                                              borderSide: const BorderSide(
                                                color: AppColor.green,
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 4.h,
                                        alignment: Alignment.topLeft,
                                        padding: EdgeInsets.only(
                                          left: 2.w,
                                        ),
                                        margin: EdgeInsets.only(
                                          top: 1.h,
                                          right: 20.w,
                                        ),
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Obx(() => DropdownButton<String>(
                                              value: controller
                                                  .dropdownValue.value,
                                              icon: Icon(Icons
                                                  .keyboard_arrow_down_rounded),
                                              underline: Container(),
                                              onChanged: (String? newValue) {
                                                controller.changeDropdownValue(
                                                    newValue!);
                                              },
                                              items: <String>[
                                                'Online',
                                                'Zoom Meeting',
                                                'Waste Point',
                                              ].map<DropdownMenuItem<String>>(
                                                (String value) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: value,
                                                    child: Text(
                                                      value,
                                                      style: TextStyle(
                                                        fontFamily: 'DMSans',
                                                        color: AppColor.ink,
                                                        fontSize: 11.sp,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).toList(),
                                            )),
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      MaterialButton(
                                        height: 5.h,
                                        minWidth: 35.w,
                                        color: AppColor.green,
                                        onPressed: () {
                                          controller.addDate(context);
                                        },
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: Text(
                                          "save",
                                          style: TextStyle(
                                              color: AppColor.white,
                                              fontFamily: 'DMSans',
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ));
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 3.w),
                            alignment: Alignment.center,
                            height: 5.h,
                            width: 30.w,
                            child: Row(
                              children: [
                                Text(
                                  'Set date',
                                  style: TextStyle(
                                    fontFamily: 'DMSans',
                                    color: AppColor.ink,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11.sp,
                                  ),
                                ),
                                Icon(
                                  Icons.add,
                                  color: AppColor.green,
                                  size: 25.sp,
                                ),
                              ],
                            ),
                          ),
                        )),
                    Positioned(
                      bottom: 28.h,
                      child: SizedBox(
                        width: 100.w,
                        child: Divider(
                          color: Colors.black12,
                          thickness: 0.2.h,
                          endIndent: 1.w,
                          indent: 1.w,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 70.h,
                      child: SizedBox(
                        height: 30.h,
                        width: 95.w,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 2.w),
                          width: 100.w,
                          child: ListView.separated(
                            itemCount: controller.upcoming.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      children: [
                                        Text(
                                          DateFormat('d MMM').format(DateTime.parse(
                                              controller.upcoming[index]['date_date'])),
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'DMSans',
                                            fontSize: 7.sp,
                                          ),
                                        ),
                                        Text(
                                          controller.upcoming[index]
                                              ['date_time'],
                                          style: TextStyle(
                                            color: Colors.black45,
                                            fontFamily: 'DMSans',
                                            fontSize: 7.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 6,
                                    child: ListTile(
                                      title: FittedBox(
                                        child: Text(
                                          controller.upcoming[index]
                                              ['date_title'],
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontFamily: 'DMSans',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ),
                                      subtitle: Text(
                                        controller.upcoming[index]['date_type'],
                                        style: TextStyle(
                                          color: Colors.black45,
                                          fontFamily: 'DMSans',
                                          fontSize: 9.sp,
                                        ),
                                      ),
                                      leading: const CircleAvatar(
                                        backgroundColor: Colors.redAccent,
                                        child: Icon(
                                          Icons.calendar_month,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 10.sp,
                                    ),
                                  ),
                                ],
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return Divider(
                                color: Colors.black38,
                                thickness: 0.1.h,
                                endIndent: 1.w,
                                indent: 34.w,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
