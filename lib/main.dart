import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:project_gift/views/home_screen.dart';
import 'package:xtyle/xtyle.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Xtyle.init(
    configuration: XtyleConfig(
      mapper: {
        XtyleRegExp.korean: 'MaruBuri',
        XtyleRegExp.english: 'PontanoSans',
        XtyleRegExp.digit: 'Abel',
      },
      defaultFontFamily: 'Abel',
    ),
  );

  await initializeDateFormatting();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          defaultTransition: Transition.noTransition,
          debugShowCheckedModeBanner: false,
          title: 'Project Gift',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomeScreen(),
        );
      },
    );
  }
}
