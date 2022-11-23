import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_gift/controllers/diary_controller.dart';
import 'package:project_gift/views/diary_detail_screen.dart';
import 'package:project_gift/views/diary_write_screen.dart';
import 'package:project_gift/views/widget/custom_app_bar.dart';
import 'package:project_gift/views/widget/custom_drawer.dart';
import 'package:xtyle/xtyle.dart';

// page color custom
// man, woman card color custom

class DiaryScreen extends StatelessWidget {
  DiaryScreen({Key? key}) : super(key: key);

  // onInit 활성화 UniqueKey
  final DiaryController _diaryController = Get.put(DiaryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: const CustomDrawer(
        drawerType: '',
      ),
      appBar: buildCustomAppBar('diary', type: 'logo'),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        width: Get.width,
        height: Get.height - 30.h,
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),

            // time set
            Row(
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.grey,
                  ),
                  onPressed: () {
                    Get.bottomSheet(
                      Container(
                        height: 200.h,
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: CarouselSlider.builder(
                                itemCount: 2040,
                                itemBuilder: (BuildContext context,
                                        int itemIndex, int pageViewIndex) =>
                                    SizedBox(
                                  width: Get.width,
                                  child: Center(
                                      child: XtyleText(
                                    itemIndex.toString(),
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      color: Colors.white,
                                    ),
                                  )),
                                ),
                                options: CarouselOptions(
                                  autoPlay: false,
                                  enlargeCenterPage: true,
                                  viewportFraction: 0.2,
                                  aspectRatio: 2.0,
                                  initialPage: 2022,
                                ),
                              ),
                            ),
                            OutlinedButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: XtyleText(
                                'Confirm',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      backgroundColor: Colors.black.withOpacity(0.5),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      XtyleText(
                        '2022',
                        style: TextStyle(
                          color: const Color(0xff333333),
                          fontSize: 14.sp,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_drop_down_rounded,
                        color: Color(0xff777777),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 5.w),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.grey,
                  ),
                  onPressed: () {
                    Get.bottomSheet(
                      Container(
                        height: 200.h,
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: CarouselSlider.builder(
                                itemCount: 12,
                                itemBuilder: (BuildContext context,
                                        int itemIndex, int pageViewIndex) =>
                                    Center(
                                        child: XtyleText(
                                  '${itemIndex + 1}',
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    color: Colors.white,
                                  ),
                                )),
                                options: CarouselOptions(
                                  autoPlay: false,
                                  enlargeCenterPage: true,
                                  viewportFraction: 0.2,
                                  aspectRatio: 2.0,
                                  initialPage: 10,
                                ),
                              ),
                            ),
                            OutlinedButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: XtyleText(
                                'Confirm',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13.sp),
                              ),
                            ),
                          ],
                        ),
                      ),
                      backgroundColor: Colors.black.withOpacity(0.5),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    );
                  },
                  child: Row(
                    children: [
                      XtyleText(
                        '11',
                        style: TextStyle(
                          color: const Color(0xff333333),
                          fontSize: 14.sp,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_drop_down_rounded,
                        color: Color(0xff777777),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 10.h,
            ),

            // dairy card
            Obx(() => diary.isEmpty
                ? Container()
                : Expanded(
                    child: GridView.builder(
                      itemCount: diary.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 1 / 0.2,
                        mainAxisSpacing: 10.w,
                        crossAxisSpacing: 10.w,
                      ),
                      itemBuilder: (context, index) {
                        final content = diary[index]['content'];
                        final date = diary[index]['date'];
                        return Column(
                          children: [
                            ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.w),
                              ),
                              onTap: () {
                                Get.to(() => DiaryDetailScreen(index: index));
                              },
                              title: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: XtyleText(
                                      content.toString(),
                                      overflow: TextOverflow.clip,
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: const Color(0xff333333),
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: XtyleText(
                                      date.toString(),
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: const Color(0xffaaaaaa),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(),
                          ],
                        );
                      },
                    ),
                  )),
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
            Get.to(() => const DiaryWriteScreen());
          },
          child: XtyleText(
            'Write',
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
