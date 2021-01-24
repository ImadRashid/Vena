import 'package:flutter/material.dart';
import './screens/onboarding.dart';
import './screens/homepage.dart';
// import 'package:spotadate/models/user.dart';
// import 'package:spotadate/screens/onboarding.dart';
import './models/user.dart';
// import 'screens/authentication/onboarding.dart';
// import './home_page.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  static var routeName = '/wrapper';
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user == null) {
      print("User is null");
      return OnBoardingPage();
    } else {
      print("User is not null and Logged In");
      return HomePage();
    }
  }
}
