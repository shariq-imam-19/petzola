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

class ForgotPasswordScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ForgotPasswordScreenState();
  }
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          S.current.forgotPassword,
        ),
        leading: AppBarBackBtnView(() {
          Navigator.of(context).maybePop();
        }),
      ),
      body: Container(
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .04,
                      ),
                      Text(
                        S.current.newPasswordNoteText_2,
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
                  btnText: S.current.send,
                  onPressed: () {
                    if (isEmail(_emailController.text)) {
                      Navigator.of(context).pushReplacementNamed(
                          Routes.VERIFY_PIN_CODE_SCREEN,
                          arguments: {
                            "email": _emailController.text,
                            "type": "FORGET_PASSWORD"
                          });
                    } else {
                      showError(S.current.invalidEmail);
                    }
                  }),
            ]),
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
                  suffixIcon: GestureDetector(
                    child: Image.asset("assets/images/searchGlyphLight.png"),
                    onTap: () {
                      setState(() {
                        _emailController.clear();
                      });
                    },
                  ))),
        ),
      ],
    );
  }
}
