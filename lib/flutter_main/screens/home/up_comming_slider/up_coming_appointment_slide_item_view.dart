import 'package:flutter/material.dart';
import 'package:petzola/flutter_main/common/res/dimen_const.dart';
import 'package:petzola/flutter_main/common/res/font_const.dart';
import 'package:petzola/generated/l10n.dart';

class UpComingAppointmentSlideItemView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UpComingAppointmentSlideItemViewState();
  }
}

class UpComingAppointmentSlideItemViewState
    extends State<UpComingAppointmentSlideItemView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Card(
          elevation: 0.0,
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: Dimen.inner_boundary_field_space),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Color(0xffffffff)),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .16,
                      height: MediaQuery.of(context).size.width * .16,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipOval(
                            child: Container(
                              child: Image.asset("assets/images/doctor.png",
                                  fit: BoxFit.contain,
                                  width:
                                      MediaQuery.of(context).size.width * .15,
                                  height:
                                      MediaQuery.of(context).size.width * .15),
                              decoration:
                                  new BoxDecoration(color: Color(0xfff8f7f7)),
                            ),
                          ),
                          Positioned(
                              right: 12,
                              bottom: 2,
                              child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    width: 12,
                                    height: 12,
                                    decoration: BoxDecoration(
                                        color: Color(0xff75cf75),
                                        borderRadius:
                                            BorderRadius.circular(32)),
                                  )))
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 14,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Benjamin Hudson",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2
                                      .copyWith(color: Color(0xff2b3e4f)),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Row(
                                  children: [
                                    Text("4.8",
                                        style: const TextStyle(
                                            color: const Color(0xff2b3e4f),
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "SFProText",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 12.0),
                                        textAlign: TextAlign.left),
                                    Icon(
                                      Icons.star,
                                      color: Color(0xfff47920),
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 28),
                                      child: Icon(
                                        Icons.home_filled,
                                        color: Color(0xff00aeef),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            // Check for deals For today
                            Text("united state medical college",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    .copyWith(color: Color(0xff2b3e4f)),
                                textAlign: TextAlign.left),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .75,
                      height: MediaQuery.of(context).size.height * .06,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Color(0xffecf1fa)),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .04,
                          ),
                          Text("Sun, jan 19, at 08:00am",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(
                                      fontSize: text_head_size_head_small,
                                      color: Colors.black)),
                          Container(
                            width: MediaQuery.of(context).size.width * .24,
                            height: MediaQuery.of(context).size.height * .04,
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                                color: Color(0xff00aeef),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(S.current.confirmed,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    .copyWith(
                                        fontSize: text_size_1,
                                        color: Colors.white)),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            border:
                                Border.all(color: Color(0xffffffff), width: 5),
                            color: Colors.red),
                        child: Image.asset(
                          "assets/images/dog.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
// width: MediaQuery.of(context).size.width * .13,
// height: MediaQuery.of(context).size.width * .12,
