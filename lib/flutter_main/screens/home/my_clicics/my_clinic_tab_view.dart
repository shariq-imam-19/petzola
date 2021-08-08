import 'package:flutter/material.dart';
import 'package:petzola/flutter_main/common/res/font_const.dart';
import 'package:petzola/generated/l10n.dart';

class MyClinicTabView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyClinicTabViewState();
  }
}

class MyClinicTabViewState extends State<MyClinicTabView> {
  CurrentSelectedClinicTab _currentSelectedClinicTab =
      CurrentSelectedClinicTab.CLINIC;

  @override
  Widget build(BuildContext context) {
    return getTabView();
  }

  Widget getTabView() {
    return Container(
      child: Row(
        children: [
          InkWell(
            child: Container(
              width: MediaQuery.of(context).size.width * .32,
              height: MediaQuery.of(context).size.height * .05,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: _currentSelectedClinicTab ==
                          CurrentSelectedClinicTab.CLINIC
                      ? Color(0xff00aeef)
                      : Color(0xfff8f7f7),
                  borderRadius: BorderRadius.circular(12)),
              child: Text(S.current.clinics,
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(fontSize: text_size_1)),
            ),
            onTap: () {
              setState(() {
                _currentSelectedClinicTab = CurrentSelectedClinicTab.CLINIC;
              });
            },
          ),
          InkWell(
            child: Container(
              width: MediaQuery.of(context).size.width * .32,
              height: MediaQuery.of(context).size.height * .05,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: _currentSelectedClinicTab ==
                          CurrentSelectedClinicTab.VETERINARIANS
                      ? Color(0xff00aeef)
                      : Color(0xfff8f7f7),
                  borderRadius: BorderRadius.circular(12)),
              child: Text(
                S.current.veterinarians,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(fontSize: text_size_1),
              ),
            ),
            onTap: () {
              setState(() {
                _currentSelectedClinicTab =
                    CurrentSelectedClinicTab.VETERINARIANS;
              });
            },
          )
        ],
      ),
    );
  }
}

enum CurrentSelectedClinicTab { CLINIC, VETERINARIANS }
