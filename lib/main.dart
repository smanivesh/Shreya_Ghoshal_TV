import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiktok_clone/ad_state.dart';
import 'package:tiktok_clone/screens/nav_bar.dart';
//import 'package:tiktok_clone/screens/home_page.dart';
import 'dart:ffi';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final initFuture = MobileAds.instance.initialize();
  final adState = AdState(initFuture);

  runApp(Provider.value(value: adState, builder: (context, child) => MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      // home: HomePage(),
      home: Nav(),
    );
  }
}
//provider: ^4.3.3