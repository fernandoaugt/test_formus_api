import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_formus_api/controller/home_controller.dart';
import 'package:test_formus_api/helper/routes.dart';

void main() {
  runApp(const MyApp());
  Get.put(HomeController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Formus Filmes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.urbanistTextTheme(),
        useMaterial3: true,
      ),
      defaultTransition: Transition.rightToLeft,
      initialRoute: PagesRoutes.home,
      getPages: Pages.routes,
    );
  }
}
