import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_gift/views/calendar_screen.dart';
import 'package:project_gift/views/diary_screen.dart';
import 'package:project_gift/views/home_screen.dart';
import 'package:project_gift/views/map_screen.dart';
import 'package:project_gift/views/setting_screen.dart';
import 'package:xtyle/xtyle.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
    required this.drawerType,
  }) : super(key: key);

  final String drawerType;

  // event list 는 시간순(d-day 낮은순)으로 정렬 되어야 함.

  @override
  Widget build(BuildContext context) {
    if (drawerType == 'event') {
      return Drawer(
        backgroundColor: Colors.black.withOpacity(0.5),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          Text(
                            '500일',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontFamily: 'NanumMyeongjo',
                            ),
                          ),
                        ],
                      ),
                      trailing: Text(
                        'D-174 (2023.01.01)',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontFamily: 'NanumMyeongjo',
                        ),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Text(
                            '600일',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontFamily: 'NanumMyeongjo',
                            ),
                          ),
                        ],
                      ),
                      trailing: Text(
                        'D-274 (2023.01.01)',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontFamily: 'NanumMyeongjo',
                        ),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(5.w),
                child: Container(
                  width: 100.w,
                  height: 25.h,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.w, color: Colors.white),
                    borderRadius: BorderRadius.circular(5.w),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 15.w,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Drawer(
        backgroundColor: Colors.black.withOpacity(0.5),
        child: SafeArea(
          child: ListView(
            children: [
              Container(
                height: 200.h,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                alignment: Alignment.center,
                child: Container(
                  width: 150.w,
                  height: 150.w,
                  decoration: const BoxDecoration(
                    color: Color(0xffeeeeee),
                    shape: BoxShape.circle,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(150.w),
                    child: Image.asset(
                      'assets/images/flower.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // child: SvgPicture.asset(
                //   'assets/images/couple.svg',
                //   fit: BoxFit.contain,
                // ),
              ),
              ListTile(
                title: Row(
                  children: [
                    SizedBox(
                      width: 20.w,
                    ),
                    Container(
                      width: 2.w,
                      height: 2.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.1),
                      ),
                    ),
                    SizedBox(
                      width: 2.5.w,
                    ),
                    Container(
                      width: 2.w,
                      height: 2.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.2),
                      ),
                    ),
                    SizedBox(
                      width: 2.5.w,
                    ),
                    Container(
                      width: 2.w,
                      height: 2.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                    SizedBox(
                      width: 2.5.w,
                    ),
                    Container(
                      width: 2.w,
                      height: 2.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                    SizedBox(
                      width: 2.5.w,
                    ),
                    Container(
                      width: 2.w,
                      height: 2.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(1),
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    XtyleText(
                      'home',
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Get.back();
                  Get.to(() => const HomeScreen());
                },
              ),
              ListTile(
                title: Row(
                  children: [
                    SizedBox(
                      width: 20.w,
                    ),
                    Container(
                      width: 2.w,
                      height: 2.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.1),
                      ),
                    ),
                    SizedBox(
                      width: 2.5.w,
                    ),
                    Container(
                      width: 2.w,
                      height: 2.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.2),
                      ),
                    ),
                    SizedBox(
                      width: 2.5.w,
                    ),
                    Container(
                      width: 2.w,
                      height: 2.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                    SizedBox(
                      width: 2.5.w,
                    ),
                    Container(
                      width: 2.w,
                      height: 2.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                    SizedBox(
                      width: 2.5.w,
                    ),
                    Container(
                      width: 2.w,
                      height: 2.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(1),
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    XtyleText(
                      'calendar',
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Get.back();
                  Get.to(() => const CalendarScreen());
                },
              ),
              ListTile(
                title: Row(
                  children: [
                    SizedBox(
                      width: 20.w,
                    ),
                    Container(
                      width: 2.w,
                      height: 2.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.1),
                      ),
                    ),
                    SizedBox(
                      width: 2.5.w,
                    ),
                    Container(
                      width: 2.w,
                      height: 2.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.2),
                      ),
                    ),
                    SizedBox(
                      width: 2.5.w,
                    ),
                    Container(
                      width: 2.w,
                      height: 2.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                    SizedBox(
                      width: 2.5.w,
                    ),
                    Container(
                      width: 2.w,
                      height: 2.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                    SizedBox(
                      width: 2.5.w,
                    ),
                    Container(
                      width: 2.w,
                      height: 2.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(1),
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    XtyleText(
                      'diary',
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Get.back();
                  Get.to(() => DiaryScreen());
                },
              ),
              ListTile(
                title: Row(
                  children: [
                    SizedBox(
                      width: 20.w,
                    ),
                    Container(
                      width: 2.w,
                      height: 2.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.1),
                      ),
                    ),
                    SizedBox(
                      width: 2.5.w,
                    ),
                    Container(
                      width: 2.w,
                      height: 2.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.2),
                      ),
                    ),
                    SizedBox(
                      width: 2.5.w,
                    ),
                    Container(
                      width: 2.w,
                      height: 2.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                    SizedBox(
                      width: 2.5.w,
                    ),
                    Container(
                      width: 2.w,
                      height: 2.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                    SizedBox(
                      width: 2.5.w,
                    ),
                    Container(
                      width: 2.w,
                      height: 2.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(1),
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    XtyleText(
                      'map',
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Get.back();
                  Get.to(() => const MapScreen());
                },
              ),
              ListTile(
                title: Row(
                  children: [
                    SizedBox(
                      width: 20.w,
                    ),
                    Container(
                      width: 2.w,
                      height: 2.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.1),
                      ),
                    ),
                    SizedBox(
                      width: 2.5.w,
                    ),
                    Container(
                      width: 2.w,
                      height: 2.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.2),
                      ),
                    ),
                    SizedBox(
                      width: 2.5.w,
                    ),
                    Container(
                      width: 2.w,
                      height: 2.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                    SizedBox(
                      width: 2.5.w,
                    ),
                    Container(
                      width: 2.w,
                      height: 2.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                    SizedBox(
                      width: 2.5.w,
                    ),
                    Container(
                      width: 2.w,
                      height: 2.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(1),
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    XtyleText(
                      'settings',
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Get.back();
                  Get.to(() => const SettingScreen());
                },
              ),
            ],
          ),
        ),
      );
    }
  }
}
