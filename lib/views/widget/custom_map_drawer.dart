import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xtyle/xtyle.dart';

class CustomMapDrawer extends StatelessWidget {
  const CustomMapDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.black.withOpacity(0.5),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: XtyleText(
                  'places',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      leading: Container(
                        width: 50.w,
                        height: 50.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset(
                            'assets/images/place1.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: XtyleText(
                        'winter camping',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        Get.back();
                      },
                    ),
                    SizedBox(height: 10.h),
                    ListTile(
                      leading: Container(
                        width: 50.w,
                        height: 50.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xffdddddd),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset(
                            'assets/images/place1.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: XtyleText(
                        'winter camping',
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        Get.back();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
