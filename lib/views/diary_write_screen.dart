import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_gift/controllers/diary_controller.dart';
import 'package:project_gift/views/widget/custom_app_bar.dart';
import 'package:project_gift/views/widget/custom_drawer.dart';
import 'package:xtyle/xtyle.dart';

import 'diary_screen.dart';

class DiaryWriteScreen extends StatefulWidget {
  const DiaryWriteScreen({Key? key}) : super(key: key);

  @override
  State<DiaryWriteScreen> createState() => _DiaryWriteScreenState();
}

class _DiaryWriteScreenState extends State<DiaryWriteScreen> {
  final XtyleTextController _writeController = XtyleTextController();
  final DiaryController _diaryController = Get.put(DiaryController());

  final String _now = DateTime.now().toString().substring(0, 19);

  final Map<String, FocusNode> _focusNode = {
    'write': FocusNode(),
  };

  @override
  void initState() {
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
      appBar: buildCustomAppBar('write'),
      body: Container(
        width: Get.width,
        height: Get.height - 30.h,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
      ),
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
            if (_writeController.text == '') {
            } else {
              _diaryController.write(_now, _writeController.text);
              Get.to(() => DiaryScreen());
            }
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
