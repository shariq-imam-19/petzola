import 'package:flutter/material.dart';
import 'package:petzola/flutter_main/common/res/dimen_const.dart';

class ServiceSlideViewItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ServiceSlideViewItemState();
  }
}

class ServiceSlideViewItemState extends State<ServiceSlideViewItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .25,
      margin: EdgeInsets.symmetric(
          horizontal: Dimen.listItem_outer_boundary_field_space),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(24),
            child: Image.asset("assets/images/dog.png"),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0xff00aeef)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: Dimen.outer_boundary_field_space),
            child: Text("Senba",
                style: const TextStyle(
                    color: const Color(0xff2b3e4f),
                    fontWeight: FontWeight.w400,
                    fontFamily: "SFProDisplay",
                    fontStyle: FontStyle.normal,
                    fontSize: 20.0),
                textAlign: TextAlign.left),
          )
        ],
      ),
    );
  }
}
