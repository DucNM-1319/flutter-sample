import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInSNS extends StatefulWidget {
  const SignInSNS({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SignInSNSState();
}

class SignInSNSState extends State<SignInSNS> {

  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    primary: const Color(0xFFF4326F),
    backgroundColor: Colors.white,
    fixedSize: const Size(double.maxFinite, 64),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(28)),
    ),
  );

  final TextStyle btnTextStyle = const TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFFFA7B43), Color(0xFFF4326F)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Wrap(
          // mainAxisAlignment: MainAxisAlignment.center,
          alignment: WrapAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 112, bottom: 16),
              child: Image.asset("assets/images/logo.png"),
            ),
            const SizedBox(
              width: 250,
              child: Text(
                'Find and Meet people around you to find LOVE',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            FractionallySizedBox(
                widthFactor: 0.8,
                child: Column(
                  children: [
                    SizedBox.fromSize(
                      size: const Size.fromHeight(96),
                    ),
                    TextButton.icon(
                      // style: TextButton.styleFrom(primary: Colors.green, backgroundColor: Colors.white),
                      style: flatButtonStyle,
                      onPressed: () {},
                      icon: const FaIcon(FontAwesomeIcons.facebookF),
                      label: Text(
                          'Sign in with Facebook',
                          style: btnTextStyle
                      ),
                    ),
                    SizedBox.fromSize(
                      size: const Size.fromHeight(16),
                    ),
                    TextButton.icon(
                      style: flatButtonStyle,
                      onPressed: () {},
                      icon: const FaIcon(FontAwesomeIcons.twitter),
                      label: Text('Sign in with Twitter',
                          style: btnTextStyle),
                    ),
                    SizedBox.fromSize(
                      size: const Size.fromHeight(16),
                    ),
                    TextButton(
                      style: flatButtonStyle,
                      onPressed: () {},
                      child: Text('Sign Up',
                        style: btnTextStyle),
                    ),
                    SizedBox.fromSize(
                      size: const Size.fromHeight(16),
                    ),
                  ],
                )),
            Text(
              'Already registered? Sign in'.toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  decoration: TextDecoration.underline),
            )
          ],
        ),
      ),
    );
  }
}
