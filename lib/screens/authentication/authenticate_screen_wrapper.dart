// import 'package:detox/models/category.dart';
// import 'package:provider/provider.dart';

// import './signup.dart';
// import './login.dart';
import 'package:flutter/material.dart';
import './login_page.dart';
import './signup_page.dart';
// import 'package:mcq_app_new/UI/authentication/Login.dart';
// import 'package:mcq_app_new/UI/authentication/Register.dart';

class AuthenticateScreenWrapper extends StatefulWidget {
  bool showSignIn = true;
  AuthenticateScreenWrapper(this.showSignIn);
  // static const id = 'auth';
  @override
  _AuthenticateScreenWrapperState createState() =>
      _AuthenticateScreenWrapperState();
}

class _AuthenticateScreenWrapperState extends State<AuthenticateScreenWrapper> {
  void toggleView() {
    //print(showSignIn.toString());
    setState(() => widget.showSignIn = !widget.showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    // Provider.of<Categories>(context).addCategories();
    if (widget.showSignIn) {
      return LoginPage(toggleView);
    } else {
      return SignupPage(toggleView);
    }
  }
}
