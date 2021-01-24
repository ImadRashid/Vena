import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';
// import 'package:spotadate/main.dart';
import './signup_page.dart';
import '../../services/auth.dart';
// import 'package:linkedin_login/linkedin_login.dart';
// import 'package:spot/config.dart';
// import 'package:spot/models/user.dart';
// import 'package:spot/network/api/spot_apis.dart';
// import 'package:spot/pages/linkedin_page.dart';
// import 'package:spot/pages/reset_password_page.dart';
// import 'package:spot/pages/signup_page.dart';
// import 'package:spot/pages/token_page.dart';
// import 'package:spotadate/utils/colors.dart';

// import '../forgot_password_page.dart';
// import '../home_page.dart';

class LoginPage extends StatefulWidget {
  final Function toggleView;
  LoginPage(this.toggleView);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final AuthService _auth = AuthService();
  bool isProgressEnabled = false;

  final _formKey = GlobalKey<FormState>();

  final _emailEditingController = TextEditingController();
  final _passwordEditingController = TextEditingController();

  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  bool showPassword = false;

  // SpotApis api = SpotApis();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: buildBody(),
      // signup button
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 30),
        child: buildSignupBtn(),
      ),
    );
  }

  // build body
  // if progress enabled then show progress only
  // otherwise show body contents
  Widget buildBody() {
    return isProgressEnabled ? buildProgressBar() : buildBodyContent();
  }

  // build progress bar in center
  Widget buildProgressBar() {
    return Center(
      child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Color(0xFFDE253A)),
      ),
    );
  }

  Widget buildBodyContent() {
    return Stack(
      children: [
        /*Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: buildSignupBtn(),
          ),
        ),*/

        Center(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // logo
                  buildLogo(),
                  //margin
                  SizedBox(
                    height: 24,
                  ),
                  // Description
                  buildDescription(),
                  // margin
                  SizedBox(
                    height: 24,
                  ),
                  // Login title(Login with)
                  buildLoginTitle(),
                  // margin
                  SizedBox(
                    height: 16,
                  ),
                  // Social Icons
                  buildSocialIcons(),
                  // margin
                  SizedBox(
                    height: 16,
                  ),
                  // Or
                  buildOrText(),
                  // margin
                  SizedBox(
                    height: 16,
                  ),
                  // Login Form
                  buildLoginForm(),
                  SizedBox(
                    height: 16,
                  ),
                  // Login Form
                  buildForgotPasswordBtn(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Logo
  Widget buildLogo() {
    return Image.asset(
      "assets/images/vena_logo.png",
      width: 100,
      height: 100,
    );
  }

  // Description
  Widget buildDescription() {
    return Text(
      "Join now to be part of life saving community across the globe",
      style: TextStyle(fontSize: 12, fontFamily: 'Lato'),
      textAlign: TextAlign.center,
    );
  }

  // Login with(title)
  Widget buildLoginTitle() {
    return Text(
      "Login with",
      style: TextStyle(
          fontSize: 18,
          fontFamily: 'Lato',
          fontWeight: FontWeight.bold,
          color: greyTextColor),
      textAlign: TextAlign.center,
    );
  }

  // Build social icons
  Widget buildSocialIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Facebook
        InkWell(
          onTap: () {
            //signinWithFacebook();
          },
          child: SvgPicture.asset(
            'assets/images/facebook.svg',
            width: 36,
            height: 36,
          ),
        ),

        // margin
        SizedBox(
          width: 8,
        ),

        // Twitter
        InkWell(
          onTap: () {},
          child: SvgPicture.asset(
            'assets/images/twitter.svg',
            width: 36,
            height: 36,
          ),
        ),

        // margin
        SizedBox(
          width: 8,
        ),

        // Instagram
        InkWell(
          onTap: () {},
          child: SvgPicture.asset(
            'assets/images/instagram.svg',
            width: 30,
            height: 30,
          ),
        ),

        // margin
        SizedBox(
          width: 8,
        ),

        // Linkedin
        InkWell(
          onTap: () {
            //navigateToLinkedinPage();
          },
          child: SvgPicture.asset(
            'assets/images/linkedin.svg',
            width: 36,
            height: 36,
          ),
        ),
      ],
    );
  }

  // Or text
  Widget buildOrText() {
    return Text(
      "Or",
      style: TextStyle(
          fontSize: 18,
          fontFamily: 'Lato',
          fontWeight: FontWeight.bold,
          color: greyTextColor),
      textAlign: TextAlign.center,
    );
  }

  // build Login form
  Widget buildLoginForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Email
          TextFormField(
            controller: _emailEditingController,
            focusNode: _emailFocusNode,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            onFieldSubmitted: (v) {
              FocusScope.of(context).requestFocus(_passwordFocusNode);
            },
            validator: (value) {
              var reg = RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
              if (value.isEmpty) {
                return "Email cannot be empty";
              } else if (!reg.hasMatch(value)) {
                return "Input valid email address";
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.circular(4),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: redColor, width: 2.0),
                borderRadius: BorderRadius.circular(4),
              ),
              hintText: "Email",
            ),
          ),
          // end Input field (Email)

          // margin
          SizedBox(
            height: 8,
          ),

          // Password
          TextFormField(
            controller: _passwordEditingController,
            focusNode: _passwordFocusNode,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.text,
            obscureText: !this.showPassword,
            validator: (value) {
              if (value.isEmpty) {
                return "Password cannot be empty";
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.circular(4),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: redColor, width: 2.0),
                borderRadius: BorderRadius.circular(4),
              ),
              hintText: "Password",
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.remove_red_eye,
                  color: !this.showPassword ? Colors.grey : redColor,
                ),
                onPressed: () {
                  setState(() => this.showPassword = !this.showPassword);
                },
              ),
            ),
          ),
          // end Input field (Password)

          // margin
          SizedBox(
            height: 16,
          ),

          // Login button
          SizedBox(
            width: 300,
            height: 40.0,
            child: MaterialButton(
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  setState(() {
                    isProgressEnabled = true;
                  });
                  // login();
                  dynamic result = await _auth.signInWithEmailAndPassword(
                      _emailEditingController.text,
                      _passwordEditingController.text);
                  if (result == null) {
                    print('SignIn error');
                    setState(() {
                      // email = "";
                      // password = "";
                      isProgressEnabled = false;
                    });
                    Get.snackbar("ERROR", "Try Again.!");
                  } else {
                    print("Signed In sucessfully");
                    print("User ID: ${result.uid}");

                    Get.snackbar("SUCCESS", "Login Successful.!");
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/wrapper', (context) => false);
                    // setState(() {
                    //   _isLoading = false;
                    // });
                  }
                }
                // navigateToHomePage();
              },
              color: redColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text(
                "Log In",
                style: TextStyle(
                    fontSize: 16.0, color: Colors.white, fontFamily: 'Lato'),
              ),
            ),
          ),
          // end login button
        ],
      ),
    );
  }

  // build forgot password button
  Widget buildForgotPasswordBtn() {
    return FlatButton(
      onPressed: () {
        navigateToResetPasswordPage();
      },
      child: Text(
        "Forgot Password?",
        style: TextStyle(fontSize: 14, color: redColor),
      ),
    );
  }

  Widget buildSignupBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: TextStyle(color: greyTextColor),
        ),
        InkWell(
          onTap: () {
            print("SignUp Page Loading...");
            widget.toggleView();
          },
          child: Text(
            "Sign Up",
            style: TextStyle(
              color: redColor,
            ),
          ),
        ),
      ],
    );
  }

  // Login
  // void login() {
  //   User user = User(email: _emailEditingController.text.toString(),
  //       password: _passwordEditingController.text.toString());
  //   api.login(user).then((value) {
  //     setState(() {
  //       isProgressEnabled = false;
  //     });
  //     // logged in success
  //     print("logged in:"+value);
  //     showToast("Logged in scucess");
  //     // save token with bearer key work in shared prefrences
  //     PrefUtils.saveToken("Bearer $value");
  //     navigateToHomePage();
  //   }).catchError((error) {
  //     setState(() {
  //       isProgressEnabled = false;
  //     });
  //     showSnackbar(error.toString());
  //   });
  // }

  void navigateToHomePage() {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => HomePage()), //HomePage()
    // );
  }

  // sigin with facebook
  // void signinWithFacebook() {
  //   api.signInWithFacebook().then((value) {
  //     print(value.toString());
  //   }).catchError((error) {
  //     print(error.toString());
  //     showSnackbar(error.toString());
  //   });
  // }

  // show snackbar
  void showSnackbar(String message) {
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => _scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text(message),
            )));
  }

  // navigate to signup page
  // void navigateToSignupPage() {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => SignupPage()),
  //   );
  // }

  //
  // // navigate to reset password page
  void navigateToResetPasswordPage() {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => ResetPasswordPage()),
    // );
  }
  //
  // // navigate to linkedin page
  // void navigateToLinkedinPage() {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => LinkedinPage()),
  //   );
  // }
  //
  // // Navigate to HomePage
  // void navigateToHomePage() {
  //   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
  //       HomePage()), (Route<dynamic> route) => false);
  // }

  // show toast
  void showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
