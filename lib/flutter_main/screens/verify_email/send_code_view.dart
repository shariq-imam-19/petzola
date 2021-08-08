import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petzola/flutter_main/app/route.dart';
import 'package:petzola/flutter_main/common/AppColors.dart';
import 'package:petzola/flutter_main/common/res/dimen_const.dart';
import 'package:petzola/flutter_main/common/stats_widgets.dart';
import 'package:petzola/flutter_main/common/tools.dart';
import 'package:petzola/flutter_main/common/widgets/custom_action_button.dart';
import 'package:petzola/generated/l10n.dart';

class SendCodeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SendCodeViewState();
  }
}

class _SendCodeViewState extends State<SendCodeView> {
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .6,
      margin: EdgeInsets.all(Dimen.outer_boundary_field_space),
      alignment: Alignment.center,
      child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipOval(
              child: Container(
                width: 180,
                height: 180,
                child: Image.asset(
                  "assets/images/resend_img.png",
                ),
                decoration: new BoxDecoration(color: Color(0xfff8f7f7)),
              ),
            ),
            Text(
              "Resend the code to the number?",
              style: Theme.of(context).textTheme.headline3,
            ),
            Container(
              width: MediaQuery.of(context).size.width * Dimen.input_form_width,
              height:
                  MediaQuery.of(context).size.height * Dimen.input_form_height,
              alignment: Alignment.center,
              decoration: new BoxDecoration(
                  color: formBlue, borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: new InputDecoration(
                      hintText: S.current.email,
                      suffixIcon: GestureDetector(
                        child:
                            Image.asset("assets/images/searchGlyphLight.png"),
                        onTap: () {
                          setState(() {
                            _emailController.clear();
                          });
                        },
                      ))),
            ),
            CustomActionButton(
                context: context,
                btnText: S.current.confirm,
                onPressed: () {
                  if (isEmail(_emailController.text)) {
                    Navigator.of(context)
                        .pushReplacementNamed(Routes.VERIFY_PIN_CODE_SCREEN);
                  }
                }),
          ]),
    );
  }
}
