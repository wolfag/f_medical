import 'package:device_preview/device_preview.dart';
import 'package:f_medical/pages/choose_topic_page.dart';
import 'package:f_medical/pages/get_started_page.dart';
import 'package:f_medical/utils/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      builder: DevicePreview.appBuilder,
      locale: DevicePreview.locale(context),
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: kColorPrimary,
      ),
      initialRoute: '$GetStartedPage',
      routes: {
        '$GetStartedPage': (_) => const GetStartedPage(),
        '$ChooseTopicPage': (_) => const ChooseTopicPage(),
      },
    );
  }
}
