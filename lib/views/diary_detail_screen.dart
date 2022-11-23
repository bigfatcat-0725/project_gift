import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_gift/controllers/diary_controller.dart';
import 'package:project_gift/views/diary_repair_screen.dart';
import 'package:project_gift/views/widget/custom_app_bar.dart';
import 'package:project_gift/views/widget/custom_drawer.dart';
import 'package:xtyle/xtyle.dart';

class DiaryDetailScreen extends StatefulWidget {
  const DiaryDetailScreen({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  State<DiaryDetailScreen> createState() => _DiaryDetailScreenState();
}

class _DiaryDetailScreenState extends State<DiaryDetailScreen> {
  final XtyleTextController _readController = XtyleTextController();
  final DiaryController _diaryController = Get.put(DiaryController());

  @override
  void initState() {
    _readController.text = diary[widget.index]['content'];
    super.initState();
  }

  @override
  void dispose() {
    _readController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: const CustomDrawer(
        drawerType: '',
      ),
      appBar: buildCustomAppBar('detail'),
      body: Obx(() => Container(
            width: Get.width,
            height: Get.height - 30.h,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                XtyleText(
                  'Date : ${diary[widget.index]['date']}',
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: const Color(0xff333333),
                  ),
                ),
                SizedBox(height: 10.h),
                XtyleText(
                  '''${diary[widget.index]['content']}''',
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: const Color(
                      0xff333333,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          )),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 1.w,
            color: const Color(0xffcccccc),
          ),
        ),
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          elevation: 0,
          onPressed: () {
            Get.to(
              () => DiaryRepairScreen(
                detailText: _readController.text,
                index: widget.index,
              ),
            );
          },
          child: XtyleText(
            'Repair',
            style: TextStyle(
              color: const Color(0xff777777),
              fontSize: 11.sp,
            ),
          ),
        ),
      ),
    );
  }
}
