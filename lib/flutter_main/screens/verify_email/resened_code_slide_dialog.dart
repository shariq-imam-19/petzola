import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petzola/flutter_main/common/widgets/slide_dialog.dart';
import 'package:petzola/flutter_main/screens/verify_email/send_code_view.dart';
import 'package:petzola/generated/l10n.dart';

// ignore: non_constant_identifier_names
ReSendCodeSlideDialog<T>(
    {@required BuildContext context,
      Color barrierColor,
      bool barrierDismissible = false,
      Duration transitionDuration = const Duration(milliseconds: 300),
      Color pillColor,
      String message,
      Color backgroundColor,
      Function onChangeProfileClick}) {
  assert(context != null);

  return showGeneralDialog(
    context: context,
    pageBuilder: (context, animation1, animation2) {},
    barrierColor: barrierColor ?? Colors.black.withOpacity(0.7),
    barrierDismissible: true,
    barrierLabel: "Dismiss",
    transitionDuration: transitionDuration,
    transitionBuilder: (context, animation1, animation2, widget) {
      final curvedValue = Curves.easeInOut.transform(animation1.value) - 1.0;
      return GestureDetector(
        child: Transform(
          transform: Matrix4.translationValues(0.0, curvedValue * -300, 0.0),
          child: Opacity(
            opacity: animation1.value,
            child: SingleChildScrollView(
              child: SlideDialog(
                  heightRatio: 3.3,
                  pillColor: pillColor ?? Colors.blueGrey[200],
                  backgroundColor:
                  backgroundColor ?? Theme.of(context).canvasColor,
                  child: getView(context, onChangeProfileClick)),
            ),
          ),
        ),
        onTap: () {
          Navigator.of(context).pop();
        },
      );
    },
  );
}

getView(BuildContext context, Function onChangeProfileNameClick) {
  return Container(
    child: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          S.of(context).resendCode,
          style: Theme.of(context).textTheme.headline2,
        ),
        SendCodeView(),
      ],
    ),
  );
}
