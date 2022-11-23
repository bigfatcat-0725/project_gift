import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_gift/views/widget/custom_app_bar.dart';
import 'package:project_gift/views/widget/custom_drawer.dart';
import 'package:xtyle/xtyle.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: const CustomDrawer(
        drawerType: '',
      ),
      appBar: buildCustomAppBar('settings'),
      body: ListView(
        children: [
          SizedBox(
            height: 10.h,
          ),
          ListTile(
            horizontalTitleGap: 0,
            contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
            onTap: () {},
            title: XtyleText(
              'home setting',
              style: TextStyle(
                fontSize: 14.sp,
                color: const Color(0xff333333),
              ),
            ),
          ),
          Divider(
            indent: 20.w,
            endIndent: 20.w,
            color: const Color(0xffbbbbbb),
          ),
          ListTile(
            horizontalTitleGap: 0,
            contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
            onTap: () {},
            title: XtyleText(
              'info & inquiry',
              style: TextStyle(
                fontSize: 14.sp,
                color: const Color(0xff333333),
              ),
            ),
          ),
          Divider(
            indent: 20.w,
            endIndent: 20.w,
            color: const Color(0xffbbbbbb),
          ),
          ListTile(
            horizontalTitleGap: 0,
            contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
            onTap: () {},
            title: XtyleText(
              'privacy',
              style: TextStyle(
                fontSize: 14.sp,
                color: const Color(0xff333333),
              ),
            ),
          ),
          Divider(
            indent: 20.w,
            endIndent: 20.w,
            color: const Color(0xffbbbbbb),
          ),
        ],
      ),
    );
  }
}
