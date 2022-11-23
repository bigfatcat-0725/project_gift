import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_gift/views/widget/custom_app_bar.dart';
import 'package:project_gift/views/widget/custom_drawer.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:xtyle/xtyle.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final XtyleTextController _textEditingController = XtyleTextController();

  DateTime selectedDay = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  DateTime focusedDay = DateTime.now();

  Map<DateTime, List<Event>> events = {
    DateTime.utc(2022, 11, 19): [Event('Date'), Event('Shopping')],
    DateTime.utc(2022, 11, 20): [Event('Date')],
  };

  List<Event> _getEventsForDay(DateTime day) {
    return events[day] ?? [];
  }

  CalendarFormat format = CalendarFormat.month;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: const CustomDrawer(
        drawerType: '',
      ),
      appBar: buildCustomAppBar('calendar', type: 'logo'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            XtyleText(
              '${selectedDay.year}. ${selectedDay.month < 10 ? '0${selectedDay.month}' : selectedDay.month}',
              style: TextStyle(
                fontSize: 14.sp,
                color: const Color(0xff333333),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              color: Colors.white,
              width: double.infinity,
              child: TableCalendar(
                locale: 'en_US',
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: focusedDay,
                headerVisible: false,
                onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
                  setState(() {
                    this.selectedDay = selectedDay;
                    this.focusedDay = focusedDay;
                  });
                },
                onPageChanged: (DateTime day) {
                  setState(() {
                    selectedDay = day;
                    focusedDay = day;
                  });
                },
                selectedDayPredicate: (DateTime day) {
                  return isSameDay(selectedDay, day);
                },
                calendarStyle: CalendarStyle(
                  tablePadding: EdgeInsets.symmetric(horizontal: 20.w),
                  cellPadding: EdgeInsets.zero,
                  outsideDaysVisible: false,
                  defaultTextStyle: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xff333333),
                    fontFamily: 'PontanoSans',
                  ),
                  selectedTextStyle: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xff333333),
                    fontFamily: 'PontanoSans',
                  ),
                  todayTextStyle: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xff333333),
                    fontFamily: 'PontanoSans',
                  ),
                  weekendTextStyle: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xff333333),
                    fontFamily: 'PontanoSans',
                  ),
                  holidayTextStyle: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xff333333),
                    fontFamily: 'PontanoSans',
                  ),
                  disabledTextStyle: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xff333333),
                    fontFamily: 'PontanoSans',
                  ),
                  todayDecoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffeeeeee),
                  ),
                  selectedDecoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffdddddd),
                  ),
                  markersMaxCount: 1,
                  markerSize: 4.w,
                  markerDecoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        width: 0.5.w, color: const Color(0xff999999)),
                    shape: BoxShape.circle,
                  ),
                ),
                eventLoader: _getEventsForDay,
                calendarFormat: format,
                onFormatChanged: (CalendarFormat format) {
                  setState(() {
                    this.format = format;
                  });
                },
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: events[selectedDay]?.length ?? 0,
                  itemBuilder: (context, index) {
                    final data = events[selectedDay]![index];

                    return Padding(
                      padding: EdgeInsets.only(bottom: 5.h),
                      child: ListTile(
                        // trailing: InkWell(
                        //   onTap: () {
                        //     // remove logic
                        //     setState(() {
                        //       events[selectedDay]!.removeAt(index);
                        //     });
                        //   },
                        //   child: const Icon(
                        //     Icons.clear_outlined,
                        //     color: Color(
                        //       0xffcccccc,
                        //     ),
                        //   ),
                        // ),
                        tileColor: const Color(0xffeeeeee),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.w),
                        ),
                        title: Container(
                          decoration: const BoxDecoration(
                              // image: DecorationImage(
                              //   image: AssetImage('assets/images/line.png'),
                              //   fit: BoxFit.fitWidth,
                              // ),
                              ),
                          child: XtyleText(
                            data.title,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: const Color(0xff333333),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
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
            Get.bottomSheet(
              Container(
                width: double.infinity,
                height: 150.h,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        XtyleText(
                          selectedDay.toString().substring(0, 10),
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: const Color(0xff333333),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextField(
                          controller: _textEditingController,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: const Color(
                              0xff333333,
                            ),
                          ),
                          maxLines: 1,
                          cursorColor: const Color(0xff333333),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0.5.w, color: const Color(0xffdddddd)),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.w, color: const Color(0xffdddddd)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    OutlinedButton(
                      onPressed: () {
                        // add logic
                        final list = events[selectedDay] ?? [];
                        final addEvent = Event(_textEditingController.text);
                        list.add(addEvent);
                        events.addAll({selectedDay: list});
                        setState(() {});
                        Get.back();
                      },
                      child: XtyleText(
                        'Confirm',
                        style: TextStyle(
                          color: const Color(0xff333333),
                          fontSize: 11.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              backgroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            );
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

class Event {
  String title;

  Event(this.title);
}
