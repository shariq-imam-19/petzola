import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petzola/flutter_main/app/app_model.dart';
import 'package:petzola/flutter_main/app/route.dart';
import 'package:petzola/flutter_main/common/AppColors.dart';
import 'package:petzola/flutter_main/common/model/pet.dart';
import 'package:petzola/flutter_main/common/res/dimen_const.dart';
import 'package:petzola/flutter_main/common/stats_widgets.dart';
import 'package:petzola/flutter_main/common/widgets/pet_slide_dialog_view/pets_slide_dialog.dart';
import 'package:petzola/generated/l10n.dart';
import 'package:provider/provider.dart';

class AddPetIntroScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddPetIntroScreenState();
  }
}

class _AddPetIntroScreenState extends State<AddPetIntroScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _petTypeController = TextEditingController();
  Pet currentPet;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        // title: Text(S.current.signUp),
        leading: Container(),
        actions: [
          InkWell(
            child: Container(
              padding: EdgeInsets.all(12),
              child: Image.asset(
                "assets/images/buttonsClose.png",
                width: 36,
                height: 36,
              ),
            ),
            onTap: () {
              if (!Provider.of<AppModel>(context, listen: false)
                  .isUserLoggedIn()) {
                print("asdasdsd");
                Navigator.of(context).pushReplacementNamed(Routes.LOGIN_SCREEN);
                return;
              }
              Navigator.of(context).maybePop();
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
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
                        Text(S.current.timeToAddPet,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline1),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .08,
                        ),
                        ClipOval(
                          child: Container(
                            width: 170,
                            height: 170,
                            child: Image.asset(
                              "assets/images/dog.png",
                            ),
                            decoration:
                                new BoxDecoration(color: Color(0xfff8f7f7)),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                getMainView(),
                SizedBox(
                  height: 18,
                ),
                GestureDetector(
                  child: Container(
                    child: Image.asset("assets/images/nextButton_2.png"),
                    margin: EdgeInsets.symmetric(vertical: 18),
                  ),
                  onTap: () {
                    if (validate()) {
                      Navigator.of(context).pushNamed(
                          Routes.ADD_PET_DETAILS_SCREEN,
                          arguments: [currentPet, _nameController.text]);
                    }
                  },
                ),
              ]),
        ),
      ),
    );
  }

  getMainView() {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * Dimen.input_form_width,
          height: MediaQuery.of(context).size.height * Dimen.input_form_height,
          alignment: Alignment.center,
          decoration: new BoxDecoration(
              color: formBlue, borderRadius: BorderRadius.circular(10)),
          child: TextFormField(
              controller: _nameController,
              keyboardType: TextInputType.name,
              decoration: new InputDecoration(
                hintText: S.current.petName,
              )),
        ),
        SizedBox(
          height: 12,
        ),
        Container(
          width: MediaQuery.of(context).size.width * Dimen.input_form_width,
          height: MediaQuery.of(context).size.height * Dimen.input_form_height,
          alignment: Alignment.center,
          decoration: new BoxDecoration(
              color: formBlue, borderRadius: BorderRadius.circular(10)),
          child: TextFormField(
            controller: _petTypeController,
            readOnly: true,
            keyboardType: TextInputType.name,
            decoration: new InputDecoration(
                hintText: S.current.selectYourPet,
                suffixIcon: Container(
                  child: SvgPicture.asset(
                    "assets/icons/down.svg",
                    color: Colors.grey,
                  ),
                  alignment: Alignment.center,
                  width: 12,
                  height: 2,
                )),
            onTap: () {
              PetsSlideDialogView(
                  context: context,
                  barrierDismissible: true,
                  pillColor: Colors.transparent,
                  onPetSelected: (pet) {
                    currentPet = pet;
                    _petTypeController.text = currentPet.name;
                  });
            },
          ),
        ),
        SizedBox(
          height: 12,
        ),
      ],
    );
  }

  bool validate() {
    print("_nameController.text.isEmpty --->" +
        _nameController.text.isEmpty.toString());
    if (_nameController.text.isEmpty) {
      showError(S.current.petNameIsRequired);
      return false;
    } else if (currentPet == null) {
      showError(S.current.petTypeIsRequired);
      return false;
    }
    return true;
  }
}
