import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petzola/flutter_main/common/res/font_const.dart';

import '../AppColors.dart';

Widget CustomActionButton({
  @required BuildContext context,
  String btnText,
  Function onPressed,
  double width,
  double height,
  double fontSize,
  Color textColor,
  Color btnColor,
  bool enable = true,
}) {
  Color getButtonColorState() {
    if (enable) {
      return btnColor ?? Color(0xff00aeef);
    } else {
      return lightPrimary;
    }
  }

  return MaterialButton(
    onPressed: () {
      enable ? onPressed() : null;
    },
    textColor: textColor ?? Colors.white,
    color: getButtonColorState(),
    padding: EdgeInsets.all(0),
    shape: RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(10.0),
    ),
    child: Container(
      width: width ?? MediaQuery.of(context).size.width * .88,
      height: height ?? 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: Text(
        btnText,
        style: TextStyle(
          fontFamily: 'SFProDisplay',
          color: textColor ?? Colors.white,
          fontSize: fontSize ?? text_head_size_medium,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          letterSpacing: 0.38,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}
