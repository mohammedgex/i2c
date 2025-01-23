import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skill_grow/core/Global/sharedPref.dart';
import 'package:skill_grow/features/authentication/view/login_view.dart';
import 'package:skill_grow/features/navigation_bar/views/bottom_navigation_bar.dart';
import 'package:skill_grow/features/profile/view/profile_view.dart';
import 'package:skill_grow/features/quiz/view/quiz_question_view.dart';

void main() async {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
  };
  // Make sure to initialize SharedPreferences globally
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences
      .getInstance(); // This ensures SharedPreferences is ready before the app starts.

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SharedPrefUtil.get('isLoggedin', false).then((value) => print(value));
    SharedPrefUtil.get('token', "").then((value) => print(value));
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: FutureBuilder<bool>(
            future: SharedPrefUtil.get('isLoggedin', false)
                .then((value) => value as bool), // Explicit cast
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator(); // Show a loading indicator
              }
              if (snapshot.hasData && snapshot.data == true) {
                return QuizQuestionView();
              } else {
                return LoginView();
              }
            },
          ),
        );
      },
    );
  }
}
