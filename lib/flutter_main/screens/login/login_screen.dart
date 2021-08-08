import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petzola/flutter_main/app/route.dart';
import 'package:petzola/flutter_main/common/AppColors.dart';
import 'package:petzola/flutter_main/common/res/dimen_const.dart';
import 'package:petzola/flutter_main/common/stats_widgets.dart';
import 'package:petzola/flutter_main/common/tools.dart';
import 'package:petzola/flutter_main/common/widgets/app_bar_back_btn_view.dart';
import 'package:petzola/flutter_main/common/widgets/custom_action_button.dart';
import 'package:petzola/generated/l10n.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = true;
  bool checkedValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(S.current.login),
        leading: AppBarBackBtnView(
          () {
            Navigator.of(context).maybePop();
          },
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(Dimen.inner_boundary_field_space),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Column(
                        children: [
                          Container(
                            child: Image.asset(
                              "assets/images/logo.png",
                              width: MediaQuery.of(context).size.width * .28,
                              height: MediaQuery.of(context).size.width * .28,
                            ),
                          ),
                          Text(
                            'Let’s sign you in.',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .04,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                child: ClipRRect(
                                  child: Image.asset(
                                    "assets/images/google.png",
                                    width:
                                        MediaQuery.of(context).size.width * .15,
                                    height:
                                        MediaQuery.of(context).size.width * .15,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                onTap: () {
                                  Navigator.of(context).pushReplacementNamed(
                                      Routes.ADD_PET_INTRO_SCREEN);
                                },
                              ),
                              ClipRRect(
                                child: Image.asset(
                                  "assets/images/spp.png",
                                  width:
                                      MediaQuery.of(context).size.width * .15,
                                  height:
                                      MediaQuery.of(context).size.width * .15,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              GestureDetector(
                                child: ClipRRect(
                                  child: Image.asset(
                                    "assets/images/facebook.png",
                                    width:
                                        MediaQuery.of(context).size.width * .15,
                                    height:
                                        MediaQuery.of(context).size.width * .15,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                onTap: () {
                                  Navigator.of(context)
                                      .pushReplacementNamed(Routes.HOME);
                                },
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .022,
                          ),
                        ],
                      ),
                    ],
                  ),
                  getFormView(),
                  Container(
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      child: CustomActionButton(
                          context: context,
                          btnText: S.current.login,
                          onPressed: () {
                            if (validateInputs()) {
                              Navigator.of(context)
                                  .pushReplacementNamed(Routes.HOME);
                            }
                          })),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: Text(S.current.createAccount,
                            style: TextStyle(
                                fontFamily: 'SFProDisplay-Medium',
                                color: Color(0xff00aeef),
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                letterSpacing: 0.38,
                                decoration: TextDecoration.underline)),
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(Routes.SIGN_UP_SCREEN);
                        },
                      )
                    ],
                  ),
                ]),
          ),
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
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: new InputDecoration(
                hintText: S.current.email,
              )),
        ),
        SizedBox(
          height: 12,
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
        SizedBox(
          height: Dimen.form_field_sepereator_space,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: Text(
                S.current.ForgotPassword,
                style: Theme.of(context).textTheme.headline3.copyWith(
                    color: Color(0xff00aeef),
                    decoration: TextDecoration.underline),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(Routes.FORGOT_PASSWORD_SCREEN);
              },
            )
          ],
        ),
      ],
    );
  }

  bool validateInputs() {
    if (!isEmail(_emailController.text)) {
      showError(S.current.invalidEmail);
      return false;
    } else if (_passwordController.text.length < 6) {
      showError(S.current.invalidPassword);
      return false;
    }
    return true;
  }
}
