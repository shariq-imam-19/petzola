import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petzola/flutter_main/app/route.dart';
import 'package:petzola/flutter_main/common/res/dimen_const.dart';
import 'package:petzola/flutter_main/common/stats_widgets.dart';
import 'package:petzola/flutter_main/common/widgets/app_bar_back_btn_view.dart';
import 'package:petzola/flutter_main/common/widgets/custom_action_button.dart';
import 'package:petzola/generated/l10n.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyPinCodeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _VerifyPinCodeScreenState();
  }
}

class _VerifyPinCodeScreenState extends State<VerifyPinCodeScreen> {
  TextEditingController _pinCodeController = TextEditingController();
  String _currentMail;
  String _type;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    LinkedHashMap<String, String> args = ModalRoute.of(context)
        .settings
        ?.arguments as LinkedHashMap<String, String>;
    _currentMail = args["email"];
    _type = args["type"];

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            S.current.verifyEmail,
            style: Theme.of(context).textTheme.headline1,
          ),
          leading: AppBarBackBtnView(() {
            Navigator.of(context).maybePop();
          }),
        ),
        body: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.all(Dimen.inner_boundary_field_space),
          child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .04,
                        ),
                        Text(
                          S.current.codeSentTo,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        Text(
                          "(" + "Example@mail.com" + ")",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .12,
                        ),
                        getMainView(context),
                        getCountDownTimer()
                      ],
                    ),
                  ],
                ),
                CustomActionButton(
                    context: context,
                    btnText: S.current.confirm,
                    onPressed: () {
                      if (_pinCodeController.text.length == 4) {
                        if (_type == "FORGET_PASSWORD") {
                          Navigator.of(context).pushReplacementNamed(
                              Routes.NEW_PASSWORD_SCREEN,
                              arguments: {
                                "email": _currentMail,
                                "token": "teken"
                              });
                        } else {
                          Navigator.of(context)
                              .pushReplacementNamed(Routes.LOGIN_SCREEN);
                        }
                      }
                    }),
              ]),
        ));
  }

  Widget getMainView(BuildContext context) {
    return PinCodeTextField(
      controller: _pinCodeController,
      appContext: context,
      pastedTextStyle: TextStyle(
        color: Color(0xff00aeef),
        fontWeight: FontWeight.bold,
      ),
      textStyle: TextStyle(color: Color(0xff00aeef)),
      length: 4,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(10),
          fieldWidth: 68,
          fieldHeight: 95,
          selectedColor: Color(0xff00aeef),
          selectedFillColor: Colors.transparent,
          activeColor: Colors.transparent,
          activeFillColor: Color(0xff00aeef).withOpacity(.3),
          inactiveColor: Color(0xffe8e8e8),
          inactiveFillColor: Colors.transparent),
      cursorColor: Color(0xff00aeef),
      animationDuration: Duration(milliseconds: 300),
      enableActiveFill: true,
      keyboardType: TextInputType.number,
      onCompleted: (v) {},
      // onTap: () {
      //   print("Pressed");
      // },
      onChanged: (value) {
        print(value);
        setState(() {
          // currentText = value;
        });
      },
      beforeTextPaste: (text) {
        print("Allowing to paste $text");
        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
        //but you can show anything you want here, like your pop up saying wrong paste format or etc
        return true;
      },
    );
  }

  bool resendVerifyCodeState = false;
  bool resendVerifyCodeViewState = false;

  int countDownTime = 5;

  TweenAnimationBuilder getCountDownTimer() {
    print("Resend Code with " + countDownTime.toString());
    return TweenAnimationBuilder<Duration>(
        duration: Duration(seconds: countDownTime),
        tween:
            Tween(begin: Duration(seconds: countDownTime), end: Duration.zero),
        onEnd: () {
          setState(() {
            print("on End Called");
            countDownTime = 5;
            resendVerifyCodeState = true;
          });
        },
        builder: (BuildContext context, Duration value, Widget child) {
          final minutes = value.inMinutes;
          final seconds = value.inSeconds % 60;

          return Column(
            children: [
              SizedBox(
                height: Dimen.form_field_sepereator_space,
              ),
              !resendVerifyCodeState
                  ? Text("$minutes:$seconds ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w400,
                        fontFamily: "DINNextLTArabic",
                        fontStyle: FontStyle.normal,
                        fontSize: 17.0,
                      ))
                  : Container(),
              SizedBox(
                height: Dimen.form_field_sepereator_space,
              ),
              GestureDetector(
                child: Text(
                  "Resend Code",
                  style: Theme.of(context).textTheme.headline3.copyWith(
                      color: Color(0xff00aeef),
                      decoration: TextDecoration.underline),
                ),
                onTap: () {
                  if (resendVerifyCodeState) {
                    if (_type == "FORGET_PASSWORD") {
                      Navigator.of(context).pushReplacementNamed(
                          Routes.VERIFY_PIN_CODE_SCREEN,
                          arguments: {
                            "email": _currentMail,
                            "type": "FORGET_PASSWORD"
                          });
                    } else {
                      Navigator.of(context).pushReplacementNamed(
                          Routes.VERIFY_PIN_CODE_SCREEN,
                          arguments: {
                            "email": _currentMail,
                            "type": "VERIFY_USER"
                          });
                    }
                  }
                },
              ),
            ],
          );
        });
  }
}
