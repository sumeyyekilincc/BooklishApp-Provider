import 'package:books/controller/firstpage_controller.dart';
import 'package:books/controller/mobile_controller.dart';
import 'package:books/controller/secondpage_controller.dart';
import 'package:books/views/welcoming.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ControllerFirstPage()),
        ChangeNotifierProvider(create: (_) => ControllerSecondPage()),
        ChangeNotifierProvider(create: (_) => ControllerMobile()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.abrilFatfaceTextTheme(),
      ),
      
      home: const Welcoming(),
    );
  }
}
