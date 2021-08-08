import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petzola/flutter_main/common/model/pet.dart';
import 'package:petzola/flutter_main/common/res/dimen_const.dart';
import 'package:petzola/generated/l10n.dart';
import 'package:provider/provider.dart';

import '../../AppColors.dart';
import '../custom_action_button.dart';

class PetsSearchView extends StatefulWidget {
  final Function onPetSelected;

  PetsSearchView({this.onPetSelected});

  @override
  State<StatefulWidget> createState() {
    return _PetsSearchViewState();
  }
}

class _PetsSearchViewState extends State<PetsSearchView> {
  Pet pet = Pet("1", "cat", "");
  List<Pet> petList = [];
  String query = '';
  TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .6,
      margin: EdgeInsets.all(Dimen.outer_boundary_field_space),
      alignment: Alignment.center,
      child: Column(mainAxisSize: MainAxisSize.max, children: [
        Container(
            width: MediaQuery.of(context).size.width * .90,
            height:
                MediaQuery.of(context).size.height * Dimen.input_form_height,
            alignment: Alignment.center,
            child: TextFormField(
              controller: searchController,
              keyboardType: TextInputType.text,
              decoration: new InputDecoration(
                  hintText: S.current.search, prefixIcon: Icon(Icons.search)),
              onChanged: (v) {
                setState(() {
                  query = v;
                });
              },
            ),
            decoration: new BoxDecoration(
                color: formBlue, borderRadius: BorderRadius.circular(10))),
        SizedBox(
          height: Dimen.form_field_sepereator_space,
        ),
        LimitedBox(
            maxHeight: MediaQuery.of(context).size.height * .37,
            child: ListView.builder(
              itemCount: petList.length,
              itemBuilder: (con, ind) {
                return petList[ind]
                        .name
                        .toString()
                        .toLowerCase()
                        .contains(query.toLowerCase())
                    ? getListItemView(ind)
                    : null;
              },
              padding: EdgeInsets.only(top: 0),
            )),
        SizedBox(
          height: 12,
        ),
        CustomActionButton(
            context: context,
            btnText: S.current.select,
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ]),
    );
  }

  getListItemView(index) {
    return ListTile(
        leading: ClipOval(
          child: Image.asset(
            "assets/images/dog.png",
            width: 50,
            height: 50,
            fit: BoxFit.contain,
          ),
        ),
        title: Text(petList[index].name),
        onTap: () {
          widget.onPetSelected(petList[index]);
          setState(() {
            searchController.text = petList[index].name;
            // query = petList[index].petName;
          });
        });
  }
}
