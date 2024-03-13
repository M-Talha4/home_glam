import '/theme/theme.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'services/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(
    GetMaterialApp(
      title: "HomeGlam",
      initialRoute: Routes.DASHBOARD,
      getPages: AppPages.routes,
      theme: Themes.lightTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
    ),
  );
  // SharedPreferencesHelper.initialize();

  // FirebaseService firebaseService = FirebaseService();
}
