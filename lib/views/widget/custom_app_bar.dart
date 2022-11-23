import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xtyle/xtyle.dart';

PreferredSize buildCustomAppBar(String title, {type}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(40.h),
    child: AppBar(
      centerTitle: true,
      titleSpacing: 0,
      title: XtyleText(
        title,
        style: TextStyle(
          color: const Color(0xff333333),
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      automaticallyImplyLeading: false,
      toolbarHeight: 40.h,
      elevation: 0,
      backgroundColor: Colors.white,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 20.w),
          child: Builder(builder: (context) {
            return GestureDetector(
              onTap: () => Scaffold.of(context).openEndDrawer(),
              child: Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border:
                      Border.all(width: 0.5.w, color: const Color(0xff777777)),
                ),
                child: Center(
                  child: XtyleText(
                    'menu',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: const Color(0xff777777),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    ),
  );
}
