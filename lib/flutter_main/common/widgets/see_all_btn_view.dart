import 'package:flutter/material.dart';

class SeeAllBtnView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SeeAllBtnViewState();
  }
}

class SeeAllBtnViewState extends State<SeeAllBtnView> {
  @override
  Widget build(BuildContext context) {
    return getView();
  }

  getView() {
    return Container(
      width: MediaQuery.of(context).size.width * .2,
      height: MediaQuery.of(context).size.width * .09,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          border: Border.all(color: const Color(0xffe8e8e8), width: 1),
          color: const Color(0xffffffff)),
      child: Text(
        "See All",
        style: Theme.of(context)
            .textTheme
            .headline4
            .copyWith(color: Color(0xff00aeef)),
      ),
    );
  }
}
