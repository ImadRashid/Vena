import 'package:flutter/cupertino.dart';
// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../services/auth.dart';

import '../../utils/colors.dart';

import 'login_page.dart';

class SignupPage extends StatefulWidget {
  final Function toggleView;
  SignupPage(this.toggleView);
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final AuthService _auth = AuthService();
  bool isProgressEnabled = false;

  final _formKey = GlobalKey<FormState>();

  final _emailEditingController = TextEditingController();
  final _passwordEditingController = TextEditingController();

  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  String password = "";

  bool showPassword = false;

  //SpotApis api = SpotApis();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      body: buildBody(),
      // login button
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 25),
        child: buildLoginBtn(),
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
        valueColor: new AlwaysStoppedAnimation<Color>(redColor),
      ),
    );
  }

  Widget buildBodyContent() {
    return Stack(
      children: [
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
                  buildSignupTitle(),
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
                  buildSignupForm(),
                  // margin
                  SizedBox(
                    height: 8,
                  ),
                  // agreement description
                  buildAgreementDescription(),
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
  Widget buildSignupTitle() {
    return Text(
      "Sign up with",
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
          onTap: () {},
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

  // build Signup form
  Widget buildSignupForm() {
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
              String pattern =
                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
              RegExp regExp = new RegExp(pattern);
              if (value.isEmpty) {
                return "Password cannot be empty";
              } else if (!regExp.hasMatch(value)) {
                return "Invalid password";
              } else {
                return null;
              }
            },
            onChanged: (value) {
              setState(() {
                password = value;
              });
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
            height: 8,
          ),

          // password strenght chekcer
          buildPasswordStrengthChecker(),

          // margin
          SizedBox(
            height: 16,
          ),

          // build password tooltips
          buildPasswordTooltips(),

          // margin
          SizedBox(
            height: 16,
          ),

          // Signup button
          SizedBox(
            width: 300,
            height: 40.0,
            child: MaterialButton(
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  setState(() {
                    isProgressEnabled = true;
                  });
                  dynamic result = await _auth.registerWithEmailAndPassword(
                    _emailEditingController.text,
                    _passwordEditingController.text,
                    // _usernameController.text
                  );

                  if (result == null) {
                    setState(() {
                      isProgressEnabled = false;
                    });
                    Get.snackbar("ERROR", "Could not Create User");
                  } else {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/wrapper', (context) => false);

                    Get.snackbar("Success", "User Created and auto Logged In");

                    print("User Created");
                    print("Signed In sucessfully");
                    print("User ID: ${result.uid}");
                  }
                  //signup();
                }
              },
              color: redColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text(
                "Signup",
                style: TextStyle(
                    fontSize: 14.0, color: Colors.white, fontFamily: 'Lato'),
              ),
            ),
          ),
          // end Signup button
        ],
      ),
    );
  }

  // Password tooltips
  Widget buildPasswordTooltips() {
    return Column(
      children: [
        Row(
          children: [
            MyBullet(),
            SizedBox(
              width: 8,
            ),
            Text(
              "Uppercase and lowercase letters",
              style: TextStyle(color: Colors.black87, fontSize: 12),
            ),
          ],
        ),

        // margin
        SizedBox(
          height: 4,
        ),

        Row(
          children: [
            MyBullet(),
            SizedBox(
              width: 8,
            ),
            Text(
              "More than 8 characters",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 12,
              ),
            ),
          ],
        ),

        // margin
        SizedBox(
          height: 4,
        ),

        Row(
          children: [
            MyBullet(),
            SizedBox(
              width: 8,
            ),
            Text(
              "Contains a character or symbol",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // build Login btn
  Widget buildLoginBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have account? ",
          style: TextStyle(color: greyTextColor),
        ),
        InkWell(
          onTap: () {
            widget.toggleView();
          },
          child: Text(
            "Login",
            style: TextStyle(
              color: redColor,
            ),
          ),
        ),
      ],
    );
  }

  // Agreement description
  Widget buildAgreementDescription() {
    return Text(
      "By joining I Agree to Vena's TOS & privacy policy",
      style: TextStyle(color: greyTextColor),
    );
  }

  // build password progress checker
  Widget buildPasswordStrengthChecker() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            width: 100,
            height: 6,
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(passColor),
              value: getPasswordConditionCount(password) >= 1 ? 100 : 0,
            ),
          ),
        ),

        // margin
        SizedBox(
          width: 8,
        ),

        Expanded(
          child: Container(
            width: 100,
            height: 6,
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(passColor),
              value: getPasswordConditionCount(password) >= 2 ? 100 : 0,
            ),
          ),
        ),

        // margin
        SizedBox(
          width: 8,
        ),

        Expanded(
          child: Container(
            width: 100,
            height: 6,
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(passColor),
              value: getPasswordConditionCount(password) == 3 ? 100 : 0,
            ),
          ),
        )
      ],
    );
  }

  // check password condition counting
  int getPasswordConditionCount(String p) {
    int count = 0;
    if (p.contains(RegExp(r'[0-9]'))) {
      count++;
    }
    if (p.contains(RegExp(r'(?=.*[!@#$%^&*])(?=.*?[A-Z])'))) {
      count++;
    }
    if (p.length >= 8) {
      count++;
    }

    print(count.toString());

    return count;
  }

  // signup user
  // void signup() {
  //   AuthUser.User user = AuthUser.User(email:_emailEditingController.text.toString(),
  //       password:_passwordEditingController.text.toString());
  //   api.signup(user).then((value) {
  //     setState(() {
  //       isProgressEnabled = false;
  //     });
  //     showToast("Account created successfully. Login to your account");
  //   }).catchError((error) {
  //     setState(() {
  //       isProgressEnabled = false;
  //     });
  //     print(error.toString());
  //     showSnackbar(error.toString());
  //   });
  // }

  // sigin with facebook
  // void signinWithFacebook() {
  //   api.signInWithFacebook().then((value) {
  //     _emailEditingController.text = value.user.email;
  //     print(value.toString());
  //   }).catchError((error) {
  //     print(error.toString());
  //     showSnackbar(error.toString());
  //   });
  // }

  void showSnackbar(String message) {
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => _scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text(message),
            )));
  }

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

  // navigate to login page
  // void navigateToLoginPage() {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => LoginPage()),
  //   );
  // }
}

class MyBullet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 8.0,
      width: 8.0,
      decoration: new BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}
