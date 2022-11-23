import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:project_gift/views/widget/custom_drawer.dart';
import 'package:xtyle/xtyle.dart';

// -- dev list
// appbar -> widget
// precache

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  final DateTime now = DateTime.now();

  final DateTime meet = DateTime(2022, 01, 01);

  // 일 단위
  final int goalDay = 500;

  // 년 단위
  final int goalYear = 2;

  String weekToKr(int date) {
    switch (date) {
      case 1:
        return '월';
      case 2:
        return '화';
      case 3:
        return '수';
      case 4:
        return '목';
      case 5:
        return '금';
      case 6:
        return '토';
      case 7:
        return '일';
      default:
        return '';
    }
  }

  // menu & event switch
  String drawerType = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final int between = daysBetween(meet, now);
    final int goal = goalDay - between - 1;
    final DateTime goalDate = now.add(Duration(days: goal));

    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: CustomDrawer(
        drawerType: drawerType,
      ),
      // appBar: buildCustomAppBar('', type: 'home'),
      body: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height,
            color: const Color(0xffeeeeee),
            // default image
            child: Image.asset(
              'assets/images/back.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top,
            child: Container(
              alignment: Alignment.centerRight,
              width: Get.width,
              height: 80.h,
              padding: EdgeInsets.only(right: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Builder(builder: (context) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          drawerType = '';
                        });
                        Scaffold.of(context).openEndDrawer();
                      },
                      child: Container(
                        width: 40.w,
                        height: 40.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 0.5.w, color: Colors.white),
                        ),
                        child: Center(
                          child: XtyleText(
                            'menu',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                  SizedBox(height: 5.h),
                  Builder(builder: (context) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          drawerType = 'event';
                        });
                        Scaffold.of(context).openEndDrawer();
                      },
                      child: Container(
                        width: 40.w,
                        height: 40.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 0.5.w, color: Colors.white),
                        ),
                        child: Center(
                          child: XtyleText(
                            'event',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          // SizedBox(
          //   width: 200.w,
          //   height: 200.w,
          //   child: LottieBuilder.network(
          //     'https://assets8.lottiefiles.com/packages/lf20_jvxwtdtp.json',
          //   ),
          // ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(bottom: 75.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '$between',
                              style: TextStyle(
                                fontFamily: 'PontanoSans',
                                fontSize: 50.sp,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              ' days',
                              style: TextStyle(
                                height: 2.w,
                                fontFamily: 'PontanoSans',
                                fontSize: 25.sp,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      '너와 함께한 시간',
                      style: TextStyle(
                        fontFamily: 'NanumMyeongjo',
                        fontSize: 20.sp,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'UPCOMING EVENT : ',
                          style: TextStyle(
                            fontFamily: 'PontanoSans',
                            fontSize: 13.sp,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '500일',
                          style: TextStyle(
                            fontFamily: 'NanumMyeongjo',
                            fontSize: 14.sp,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'D-$goal',
                      style: TextStyle(
                        fontFamily: 'PontanoSans',
                        fontSize: 14.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Text('${now.toString().substring(0, 10)}(${weekToKr(now.weekday)})'),
          // Text(
          //     '$goalDay일 $goal일 남음 ${goalDate.toString().substring(0, 10)}(${weekToKr(goalDate.weekday)})'),
          Positioned(
            left: 0,
            right: 0,
            bottom: 50.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 100.w,
                      height: 100.w,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.w),
                        // default image
                        child: Image.asset(
                          'assets/images/women.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    XtyleText(
                      '김소희',
                      style: TextStyle(fontSize: 12.sp, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  width: 50.w,
                  height: 50.w,
                  child: LottieBuilder.network(
                    'https://assets8.lottiefiles.com/packages/lf20_w1e3bapt.json',
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 100.w,
                      height: 100.w,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.w),
                        // default image
                        child: Image.asset(
                          'assets/images/man.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    XtyleText(
                      '이한솔',
                      style: TextStyle(fontSize: 12.sp, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
