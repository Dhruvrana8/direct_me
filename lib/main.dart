import 'package:direct_me/constants/app_strings.dart';
import 'package:direct_me/screens/Dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/app_provider.dart';

import 'package:direct_me/constants/colors.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CustomProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: APP_STRINGS.APP_NAME,
        theme: ThemeData(
          primarySwatch: CUSTOM_COLOR.PRIMARY,
        ),
        home: const Dashboard(title: "TITLE"));
  }
}
