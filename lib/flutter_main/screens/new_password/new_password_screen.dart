import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petzola/flutter_main/app/route.dart';
import 'package:petzola/flutter_main/common/AppColors.dart';
import 'package:petzola/flutter_main/common/res/dimen_const.dart';
import 'package:petzola/flutter_main/common/stats_widgets.dart';
import 'package:petzola/flutter_main/common/widgets/app_bar_back_btn_view.dart';
import 'package:petzola/flutter_main/common/widgets/custom_action_button.dart';
import 'package:petzola/generated/l10n.dart';

class NewPasswordScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewPasswordScreenState();
  }
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  String currentMail = "";
  String token;
  bool _passwordVisible = true;
  bool _confirmPasswordVisible = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    LinkedHashMap<String, dynamic> args = ModalRoute.of(context)
        .settings
        ?.arguments as LinkedHashMap<String, dynamic>;
    currentMail = args["email"];
    token = args["token"];

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          S.current.newPassword,
          style: Theme.of(context).textTheme.headline1,
        ),
        leading: AppBarBackBtnView(() {
          Navigator.of(context).maybePop();
        }),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.all(Dimen.inner_boundary_field_space),
          height: MediaQuery.of(context).size.height * .85,
          child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .04,
                        ),
                        Text(
                          S.current.newPasswordNoteText,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .12,
                        ),
                        getFormView(),
                      ],
                    ),
                  ],
                ),
                CustomActionButton(
                    context: context,
                    btnText: S.current.saveNewPassword,
                    onPressed: () {
                      if (validateFor()) {
                        Navigator.of(context)
                            .pushReplacementNamed(Routes.LOGIN_SCREEN);
                      }
                    }),
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
              controller: _passwordController,
              keyboardType: TextInputType.name,
              obscureText: _passwordVisible,
              decoration: new InputDecoration(
                  hintText: S.current.newPassword,
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
                  ))),
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
              controller: _confirmPasswordController,
              keyboardType: TextInputType.name,
              obscureText: _confirmPasswordVisible,
              decoration: InputDecoration(
                  hintText: S.current.confirmPassword,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _confirmPasswordVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Color(0xff2b3e4f),
                    ),
                    onPressed: () {
                      setState(() {
                        _confirmPasswordVisible = !_confirmPasswordVisible;
                      });
                    },
                  )),
            )),
      ],
    );
  }

  bool validateFor() {
    if (_passwordController.text.length <= 6) {
      showError(S.current.passwordErrorLength);
      return false;
    } else if (_passwordController.text != _confirmPasswordController.text) {
      showError(S.current.passwordWordNotMatched);
      return false;
    }
    return true;
  }
}
