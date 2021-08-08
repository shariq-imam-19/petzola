import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petzola/flutter_main/app/route.dart';
import 'package:petzola/flutter_main/common/AppColors.dart';
import 'package:petzola/flutter_main/common/res/dimen_const.dart';
import 'package:petzola/flutter_main/common/res/font_const.dart';
import 'package:petzola/flutter_main/common/stats_widgets.dart';
import 'package:petzola/flutter_main/common/tools.dart';
import 'package:petzola/generated/l10n.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignUpScreenState();
  }
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _passwordVisible = true;
  bool checkedValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        // title: Text(
        //   S.current.signUp,
        // ),
        actions: [
          InkWell(
            child: Container(
              padding: EdgeInsets.all(12),
              child: Image.asset(
                "assets/images/buttonsClose.png",
                width: 36,
                height: 36,
              ),
            ),
            onTap: () {
              Navigator.of(context).maybePop();
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.all(Dimen.inner_boundary_field_space),
          child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(S.current.welcomeToPetzola,
                        style: Theme.of(context).textTheme.headline1),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .03,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .35,
                      height: MediaQuery.of(context).size.width * .35,
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/images/logo.png",
                      ),
                      margin: EdgeInsets.symmetric(vertical: 18),
                    )
                  ],
                ),
                getFormView(),
                SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      child: Checkbox(
                        value: checkedValue,
                        onChanged: (newValue) {
                          setState(() {
                            checkedValue = newValue;
                          });
                        },
                      ),
                    ),
                    Text(" " + S.current.iAgree + " ",
                        style: TextStyle(
                          fontFamily: 'SFProText',
                          color: Color(0xff2c3e50),
                          fontSize: text_size_1,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                    Text(S.current.termsAndCondition,
                        style: TextStyle(
                            fontFamily: 'SFProText',
                            color: Color(0xff00aeef),
                            fontSize: text_size_1,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            decoration: TextDecoration.underline))
                  ],
                ),
                GestureDetector(
                  child: Container(
                    child: Image.asset("assets/images/nextButton_1.png"),
                    margin: EdgeInsets.symmetric(vertical: 18),
                  ),
                  onTap: () {
                    if (validateForm()) {
                      Navigator.of(context).pushNamed(
                          Routes.VERIFY_PIN_CODE_SCREEN,
                          arguments: {
                            "email": _emailController.text,
                            "type": "VERIFY_USER"
                          });
                    }
                  },
                ),
              ]),
        ),
      ),
    );
  }

  getFormView() {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * Dimen.input_form_width,
          height: MediaQuery.of(context).size.height * Dimen.input_form_height,
          alignment: Alignment.center,
          decoration: new BoxDecoration(
              color: formBlue, borderRadius: BorderRadius.circular(10)),
          child: TextFormField(
              controller: _nameController,
              keyboardType: TextInputType.name,
              decoration: new InputDecoration(
                hintText: S.current.yourName,
              )),
        ),
        SizedBox(
          height: Dimen.form_field_space_min,
        ),
        Container(
          width: MediaQuery.of(context).size.width * Dimen.input_form_width,
          height: MediaQuery.of(context).size.height * Dimen.input_form_height,
          alignment: Alignment.center,
          decoration: new BoxDecoration(
              color: formBlue, borderRadius: BorderRadius.circular(10)),
          child: TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: new InputDecoration(
                hintText: S.current.email,
              )),
        ),
        SizedBox(
          height: Dimen.form_field_space_min,
        ),
        Container(
            width: MediaQuery.of(context).size.width * Dimen.input_form_width,
            height:
                MediaQuery.of(context).size.height * Dimen.input_form_height,
            alignment: Alignment.center,
            decoration: new BoxDecoration(
                color: formBlue, borderRadius: BorderRadius.circular(10)),
            child: TextFormField(
              controller: _passwordController,
              keyboardType: TextInputType.name,
              obscureText: _passwordVisible,
              decoration: InputDecoration(
                  hintText: S.current.password,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Color(0xff2b3e4f),
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  )),
            )),
      ],
    );
  }

  bool validateForm() {
    if (_nameController.text.isEmpty) {
      showError(S.current.invalidUserName);
      return false;
    } else if (!isEmail(_emailController.text)) {
      print("password error");
      showError(S.current.invalidEmail);
      return false;
    } else if (_passwordController.text.length <= 6) {
      showError(S.current.passwordErrorLength);
      return false;
    }
    return true;
  }
}
