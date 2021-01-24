import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import './screens/splashscreen.dart';
import 'package:vena/services/auth.dart';
import './utils/colors.dart';
import './wrapper.dart';

import './models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<User>.value(value: AuthService().user),
      ],
      child: GetMaterialApp(
        routes: {
          '/wrapper': (context) => Wrapper(),
        },
        theme: ThemeData(
          cursorColor: redColor,
          primaryColor: redColor,
          // cursorColor: Color(0xFFFF7525),
          // primaryColor: Color(0xFFFF7525),
          // primarySwatch: Colors.orange,
        ),
        debugShowCheckedModeBanner: false,
        // onGenerateRoute: Routerr.generateRoute,
        title: 'Spot New theme',
        home: SplashScreen(),
      ),
    );
  }
}
