import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/colors.dart';
// import '../../authentication/signup_page.dart';
// import 'package:spotadate/utils/colors.dart';

import './authentication/authenticate_screen_wrapper.dart';
// import './authentication/login_page.dart';
// import 'package:spot/pages/login_page.dart';
// import 'package:spot/pages/signup_page.dart';
// import 'package:spot/utils/colors.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  BuildContext context;
  int currentImagePosition;

  bool check = true;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      body: buildBody(),
    );
  }

  // Build boy contents
  Widget buildBody() {
    return Stack(
      children: [
        // build slider on backstack
        buildSlider(),
        // front stack
        BlurryContainer(
          borderRadius: BorderRadius.circular(0),
          bgColor: Colors.black12,
          child: Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // tooltip
                  buildTooltip(),

                  // margin
                  SizedBox(
                    height: 100,
                  ),

                  // get started button
                  buildGetStartedBtn(),

                  // margin
                  SizedBox(
                    height: 8,
                  ),

                  // login button
                  buildLoginBtn(),

                  SizedBox(
                    height: 20,
                  ),

                  // skip and next button
                  check ? buildImageChangeBtns() : onlyBuildSkipBtn(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // build image slider
  Widget buildSlider() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Carousel(
        images: [
          FittedBox(
            child: Image.asset('assets/images/giveBloodSaveLife.jpg'),
            fit: BoxFit.fitWidth,
          ),
          FittedBox(
            child: Image.asset('assets/images/giveBloodSaveLife.jpg'),
            fit: BoxFit.fitWidth,
          ),
          FittedBox(
            child: Image.asset('assets/images/giveBloodSaveLife.jpg'),
            fit: BoxFit.fitWidth,
          ),
          FittedBox(
            child: Image.asset('assets/images/giveBloodSaveLife.jpg'),
            fit: BoxFit.fitWidth,
          ),
        ],
        dotBgColor: Colors.transparent,
        dotColor: Colors.white,
        dotIncreasedColor: redColor,
        // dotVerticalPadding: 4,
        autoplayDuration: Duration(seconds: 4),
        onImageChange: (a, b) {
          setState(() {
            currentImagePosition = b;
            if (currentImagePosition == 3) {
              check = false;
            } else {
              check = true;
            }
          });
        },
      ),
    );
  }

  Widget onlyBuildSkipBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FlatButton(
          onPressed: () {},
          child: Text(
            "Skip",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }

  // build Image change buttons
  Widget buildImageChangeBtns() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Skip Button
        FlatButton(
          onPressed: () {},
          child: Text(
            "Skip",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),

        // Next Button
        FlatButton(
          onPressed: () {},
          child: Text(
            "Next",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ],
    );
  }

  // tool tip according to image position
  Widget buildTooltip() {
    if (currentImagePosition == 0) {
      // setState(() {
      //   check = true;
      // });
      return Center(
        child: RichText(
          text: TextSpan(children: <TextSpan>[
            TextSpan(
              text: "Lets get started",
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            TextSpan(
              text:
                  "\n\nLorem ipsum dolor sit amet, consetetur\nsadipscing elitr sed diam nonumy eirmod\ntempor invidunt"
                  "ut labore et dolore",
              style: TextStyle(
                  fontSize: 16, fontFamily: 'Lato', color: Colors.white),
            ),
          ]),
          textAlign: TextAlign.center,
        ),
      );
    } else if (currentImagePosition == 1) {
      // setState(() {
      //   check = true;
      // });
      return Center(
        child: RichText(
          text: TextSpan(children: <TextSpan>[
            TextSpan(
              text: "Spot",
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            TextSpan(
              text:
                  "\n\nLorem ipsum dolor sit amet, consetetur\nsadipscing elitr sed diam nonumy eirmod\ntempor invidunt"
                  "ut labore et dolore",
              style: TextStyle(
                  fontSize: 16, fontFamily: 'Lato', color: Colors.white),
            ),
          ]),
          textAlign: TextAlign.center,
        ),
      );
    } else if (currentImagePosition == 2) {
      // setState(() {
      //   check = true;
      // });
      return Center(
        child: RichText(
          text: TextSpan(children: <TextSpan>[
            TextSpan(
              text: "Spot Zone",
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            TextSpan(
              text:
                  "\n\nLorem ipsum dolor sit amet, consetetur\nsadipscing elitr sed diam nonumy eirmod\ntempor invidunt"
                  "ut labore et dolore",
              style: TextStyle(
                  fontSize: 16, fontFamily: 'Lato', color: Colors.white),
            ),
          ]),
          textAlign: TextAlign.center,
        ),
      );
    } else if (currentImagePosition == 3) {
      // setState(() {
      //   check = false;
      // });

      return Center(
        child: RichText(
          text: TextSpan(children: <TextSpan>[
            TextSpan(
              text: "Messaging",
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            TextSpan(
              text:
                  "\n\nLorem ipsum dolor sit amet, consetetur\nsadipscing elitr sed diam nonumy eirmod\ntempor invidunt"
                  "ut labore et dolore",
              style: TextStyle(
                  fontSize: 16, fontFamily: 'Lato', color: Colors.white),
            ),
          ]),
          textAlign: TextAlign.center,
        ),
      );
    } else {
      return Text("");
    }
  }

  // Get Started button
  // navigate to Signup Page
  Widget buildGetStartedBtn() {
    return SizedBox(
      width: 300,
      height: 46.0,
      child: MaterialButton(
        onPressed: () {
          // navigate to signup page
          // navigateToSignupPage();
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AuthenticateScreenWrapper(false)),
          );
        },
        color: redColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          "Get Started",
          style: TextStyle(
              fontSize: 16.0, color: Colors.white, fontFamily: 'Lato'),
        ),
      ),
    );
  }

  // Build Login button
  // Navigate to LoginPage
  Widget buildLoginBtn() {
    return SizedBox(
      width: 300,
      height: 46.0,
      child: MaterialButton(
        onPressed: () {
          // navigate to login page
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AuthenticateScreenWrapper(true)),
          );
        },
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: Colors.white, width: 1),
        ),
        child: Text(
          "Log In",
          style: TextStyle(
              fontSize: 16.0, color: Colors.white, fontFamily: 'Lato'),
        ),
      ),
    );
  }

  // navigate to signup page
  // void navigateToSignupPage() {}

  // // navigate to login page
  // void navigateToLoginPage() {
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(builder: (context) => LoginPage()),
  //   );
  // }
}
