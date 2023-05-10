import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../res/app_colors.dart';
import '/routes/app_pages.dart';
import '/flavors/build_config.dart';
import '/flavors/env_config.dart';
import 'app_binding.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final EnvConfig _envConfig = BuildConfig.instance.config;

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [
        Locale('en', ''),
        Locale('vi', ''),
      ],
      path: 'assets/translation',
      fallbackLocale: const Locale('en', ''),
      child: Builder(
        builder: (context) {
          return GetMaterialApp(
            title: _envConfig.appName,
            initialRoute: AppPages.INITIAL,
            initialBinding: AppBinding(),
            getPages: AppPages.routes,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: ThemeData(
              primarySwatch: AppColors.colorPrimarySwatch,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              brightness: Brightness.light,
              primaryColor: AppColors.colorPrimary,
              textTheme: const TextTheme(
                labelLarge: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              fontFamily: 'SVN-Gilroy',
            ),
            debugShowCheckedModeBanner: false,
            builder: (context, myWidget) {
              myWidget = MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaleFactor: 1.0,
                ),
                child: myWidget ?? Container(),
              );
              return myWidget;
            },
          );
        }
      ),
    );
  }
}
