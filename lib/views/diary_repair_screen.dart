import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_gift/controllers/diary_controller.dart';
import 'package:project_gift/views/diary_detail_screen.dart';
import 'package:project_gift/views/widget/custom_app_bar.dart';
import 'package:project_gift/views/widget/custom_drawer.dart';
import 'package:xtyle/xtyle.dart';

class DiaryRepairScreen extends StatefulWidget {
  const DiaryRepairScreen({
    Key? key,
    required this.detailText,
    required this.index,
  }) : super(key: key);
  final String detailText;
  final int index;

  @override
  State<DiaryRepairScreen> createState() => _DiaryRepairScreenState();
}

class _DiaryRepairScreenState extends State<DiaryRepairScreen> {
  final XtyleTextController _writeController = XtyleTextController();
  final DiaryController _diaryController = Get.put(DiaryController());

  final Map<String, FocusNode> _focusNode = {
    'write': FocusNode(),
  };

  @override
  void initState() {
    _writeController.text = widget.detailText;
    _focusNode['write']!.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    _writeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: const CustomDrawer(
        drawerType: '',
      ),
      appBar: buildCustomAppBar('repair'),
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
                Expanded(
                  child: TextField(
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: const Color(
                        0xff333333,
                      ),
                    ),
                    controller: _writeController,
                    focusNode: _focusNode['write'],
                    cursorColor: const Color(0xff333333),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
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
            var newDate = DateTime.now().toString().substring(0, 19);
            _diaryController.repair(
                newDate, _writeController.text, widget.index);
            Get.back();
            Get.off(() => DiaryDetailScreen(
                  index: widget.index,
                ));
          },
          child: XtyleText(
            'Save',
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
