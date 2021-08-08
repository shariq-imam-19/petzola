import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petzola/flutter_main/app/app_model.dart';
import 'package:petzola/flutter_main/app/route.dart';
import 'package:petzola/flutter_main/common/AppColors.dart';
import 'package:petzola/flutter_main/common/res/dimen_const.dart';
import 'package:petzola/flutter_main/common/res/font_const.dart';
import 'package:petzola/flutter_main/common/widgets/custom_action_button.dart';
import 'package:petzola/generated/l10n.dart';
import 'package:provider/provider.dart';

class SelectCountryScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SelectCountryScreenState();
  }
}

class _SelectCountryScreenState extends State<SelectCountryScreen> {
  var _currentSelectedCounty = "egypt";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(Dimen.inner_boundary_field_space),
        height: MediaQuery.of(context).size.height * .88,
        child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Column(
                    children: [
                      Text(S.current.selectCountry,
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            color: Color(0xff2b3e4f),
                            fontSize: text_head_size_head_1,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .1,
                      ),
                      getOptionOne(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .03,
                      ),
                      getOptionTwo(),
                    ],
                  ),
                ],
              ),
              Container(
                child: CustomActionButton(
                    context: context,
                    btnText: S.current.select,
                    btnColor: app_blue,
                    onPressed: () {
                      Provider.of<AppModel>(context)
                          .setAppCountry(_currentSelectedCounty);
                      Navigator.of(context).pushNamed(Routes.SIGN_UP_SCREEN);
                    }),
                margin: EdgeInsets.symmetric(vertical: 18),
              )
            ]),
      ),
    );
  }

  Widget getOptionOne() {
    return InkWell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            SvgPicture.asset(
              "assets/images/egypt.svg",
              width: 42,
              height: 42,
            ),
            SizedBox(
              width: Dimen.form_field_sepereator_space,
            ),
            Text(S.current.egypt,
                style: TextStyle(
                  fontFamily: 'SFProText',
                  color: Color(0xff2b3e4f),
                  fontSize: text_head_size_normal,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ))
          ]),
          _currentSelectedCounty == "egypt"
              ? SvgPicture.asset(
                  "assets/images/check.svg",
                )
              : Container()
        ],
      ),
      onTap: () {
        setState(() {
          _currentSelectedCounty = "egypt";
        });
      },
    );
  }

  Widget getOptionTwo() {
    return InkWell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                "assets/images/unitedArabEmirates.svg",
                width: 42,
                height: 42,
              ),
              SizedBox(
                width: Dimen.form_field_sepereator_space,
              ),
              Text(S.current.uae,
                  style: TextStyle(
                    fontFamily: 'SFProText',
                    color: Color(0xff2b3e4f),
                    fontSize: text_head_size_normal,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ))
            ],
          ),
          _currentSelectedCounty == "UAE"
              ? SvgPicture.asset(
                  "assets/images/check.svg",
                )
              : Container()
        ],
      ),
      onTap: () {
        setState(() {
          _currentSelectedCounty = "UAE";
        });
      },
    );
  }
}
