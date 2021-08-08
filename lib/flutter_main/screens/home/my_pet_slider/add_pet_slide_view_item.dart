import 'package:flutter/material.dart';
import 'package:petzola/flutter_main/common/res/dimen_const.dart';
import 'package:petzola/flutter_main/common/res/font_const.dart';
import 'package:petzola/generated/l10n.dart';

class AddPetSlideViewItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddPetSlideViewItemState();
  }
}

class AddPetSlideViewItemState extends State<AddPetSlideViewItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * .8,
        height: MediaQuery.of(context).size.height * .18,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(
            horizontal: Dimen.listItem_outer_boundary_field_space),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: const Color(0xfff0f5fc)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: Container(
                child: Image.asset(
                  "assets/images/dog.png",
                  fit: BoxFit.contain,
                  height: MediaQuery.of(context).size.width * .22,
                ),
                decoration: new BoxDecoration(color: Color(0xfff8f7f7)),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 30% offers
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Time to Add your Best",
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          .copyWith(fontSize: 14, color: Color(0xff2b3e4f)),
                    ),
                    // Check for deals For today
                    Text("Friend (your Pet)!",
                        style: Theme.of(context)
                            .textTheme
                            .headline1
                            .copyWith(fontSize: 14, color: Color(0xff2b3e4f)),
                        textAlign: TextAlign.left),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .32,
                      height: MediaQuery.of(context).size.height * .05,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Color(0xff00aeef),
                          borderRadius: BorderRadius.circular(12)),
                      child: Text(S.current.addOne,
                          style: Theme.of(context).textTheme.headline4.copyWith(
                              fontSize: text_size_1, color: Colors.white)),
                    )
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
              ],
            ),
          ],
        ));
  }
}
