import 'package:flutter/material.dart';
import 'package:petzola/flutter_main/common/model/pet.dart';
import 'package:petzola/flutter_main/common/res/dimen_const.dart';

class PetSlideViewItem extends StatefulWidget {
  final Pet pet;

  PetSlideViewItem({this.pet});

  @override
  State<StatefulWidget> createState() {
    return PetSlideViewItemState();
  }
}

class PetSlideViewItemState extends State<PetSlideViewItem> {
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
                      widget?.pet?.name ?? "Pet Name",
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          .copyWith(fontSize: 14, color: Color(0xff2b3e4f)),
                    ),
                    // Check for deals For today
                    Text(widget?.pet?.breed?.name ?? "Pet Breed",
                        style: Theme.of(context)
                            .textTheme
                            .headline1
                            .copyWith(fontSize: 14, color: Color(0xff2b3e4f)),
                        textAlign: TextAlign.left),
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
