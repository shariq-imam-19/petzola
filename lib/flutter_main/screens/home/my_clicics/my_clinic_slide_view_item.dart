import 'package:flutter/material.dart';
import 'package:petzola/flutter_main/common/res/dimen_const.dart';
import 'package:petzola/flutter_main/common/res/font_const.dart';

class MyClinicSlideViewItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyClinicSlideViewItemState();
  }
}

class MyClinicSlideViewItemState extends State<MyClinicSlideViewItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .7,
      height: MediaQuery.of(context).size.height * .18,
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: Dimen.list_separator_space_min),
      padding: EdgeInsets.all(Dimen.list_inner_item_separator_space),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                color: const Color(0x29a09494),
                offset: Offset(0, 10),
                blurRadius: 44,
                spreadRadius: 0)
          ],
          color: const Color(0xffffffff)),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Image.asset(
              "assets/images/dog.png",
              fit: BoxFit.contain,
              width: MediaQuery.of(context).size.width * .22,
              height: MediaQuery.of(context).size.width * .22,
            ),
            decoration: new BoxDecoration(color: Color(0xfff8f7f7)),
          ),
          Container(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                getRowItem(
                    title: "FeedBack",
                    icon: Icons.star,
                    state: true,
                    action: () {}),
                getRowItem(
                    title: "Call",
                    icon: Icons.call,
                    state: false,
                    action: () {}),
                getRowItem(
                    title: "Chat",
                    icon: Icons.chat_outlined,
                    state: false,
                    action: () {}),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getRowItem({title, icon, state, action}) {
    return Column(
      children: [
        Icon(
          icon,
          color: state ? Colors.amber : Colors.black38,
        ),
// Petzola
        Text(title,
            style: Theme.of(context)
                .textTheme
                .headline1
                .copyWith(color: Colors.black, fontSize: text_size_1))
      ],
    );
  }
}
