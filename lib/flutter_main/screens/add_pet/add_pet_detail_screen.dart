import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:petzola/flutter_main/app/route.dart';
import 'package:petzola/flutter_main/common/AppColors.dart';
import 'package:petzola/flutter_main/common/model/breed.dart';
import 'package:petzola/flutter_main/common/model/pet.dart';
import 'package:petzola/flutter_main/common/res/dimen_const.dart';
import 'package:petzola/flutter_main/common/stats_widgets.dart';
import 'package:petzola/flutter_main/common/widgets/breed_slide_dialog_view/breed_slide_dialog.dart';
import 'package:petzola/generated/l10n.dart';

class AddPetDetailScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddPetDetailScreenState();
  }
}

class _AddPetDetailScreenState extends State<AddPetDetailScreen> {
  CurrentGender _currentGender = CurrentGender.MALE;
  Pet _currentPetType;
  Breed _currentBreed;
  String _currentPetName;
  TextEditingController _breedController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _weightController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var temp = ModalRoute.of(context).settings.arguments as List;

    _currentPetType = temp[0] as Pet;
    _currentPetName = temp[1] as String;

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
                        Text(S.current.lastStepText,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline1),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .04,
                        ),
                        new ClipOval(
                          child: Container(
                            child: Image.asset(
                              "assets/images/dog.png",
                              width: MediaQuery.of(context).size.width * .35,
                              height: MediaQuery.of(context).size.width * .35,
                            ),
                            decoration:
                                new BoxDecoration(color: Color(0xfff8f7f7)),
                          ),
                        ),
                        SizedBox(
                          height: Dimen.form_field_space_min,
                        ),
                        Text(_currentPetName,
                            style: Theme.of(context).textTheme.headline2),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .04,
                        ),
                      ],
                    ),
                  ],
                ),
                getFormView(),
                SizedBox(
                  height: 18,
                ),
                GestureDetector(
                  child: Container(
                    child: Image.asset("assets/images/nextButton_3.png"),
                    margin: EdgeInsets.symmetric(vertical: 18),
                  ),
                  onTap: () {
                    if (validateForm()) {
                      Navigator.of(context).pushNamed(
                          Routes.PET_PROFILE_UPLOAD_SCREEN,
                          arguments: [
                            _currentPetType,
                            _currentBreed,
                            _currentPetName,
                            _weightController.text,
                            _dateController.text,
                            _currentGender == CurrentGender.MALE
                                ? "male"
                                : "female"
                          ]);
                    }
                  },
                )
              ]),
        ),
      ),
    );
  }

  getFormView() {
    return Column(
      children: [
        getSelectGenderView(),
        SizedBox(
          height: Dimen.form_field_space_min,
        ),
        getBirthDateAndWeightView(),
        SizedBox(
          height: Dimen.form_field_space_min,
        ),
        Container(
          width: MediaQuery.of(context).size.width * Dimen.input_form_width,
          height: MediaQuery.of(context).size.height * Dimen.input_form_height,
          alignment: Alignment.center,
          decoration: new BoxDecoration(
              color: formBlue, borderRadius: BorderRadius.circular(10)),
          child: TextFormField(
            controller: _breedController,
            readOnly: true,
            keyboardType: TextInputType.name,
            decoration: new InputDecoration(
                hintText: S.current.selectBreed,
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
              BreedSlideDialogView(
                  context: context,
                  barrierDismissible: true,
                  pillColor: Colors.transparent,
                  currentAnimalType: _currentPetType.name,
                  onChangeBreedClick: (breed) {
                    _currentBreed = breed;
                    _breedController.text = _currentBreed.name;
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

  getSelectGenderView() {
    return Container(
      width: MediaQuery.of(context).size.width * Dimen.input_form_width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
              flex: 1,
              child: InkWell(
                child: Container(
                  width: MediaQuery.of(context).size.width * .4,
                  height: MediaQuery.of(context).size.height * .06,
                  alignment: Alignment.center,
                  decoration: new BoxDecoration(
                      color: _currentGender == CurrentGender.MALE
                          ? Color(0xff00aeef)
                          : Color(0xfff8f9fa),
                      borderRadius: BorderRadius.circular(5)),
                  child: new Text("Male",
                      style: Theme.of(context).textTheme.subtitle2.copyWith(
                          color: _currentGender == CurrentGender.MALE
                              ? Colors.white70
                              : Color(0xff2b3e4f))),
                ),
                onTap: () {
                  setState(() {
                    _currentGender = CurrentGender.MALE;
                  });
                },
              )),
          SizedBox(
            width: Dimen.form_field_space_min,
          ),
          Expanded(
              flex: 1,
              child: InkWell(
                child: Container(
                  width: MediaQuery.of(context).size.width * .4,
                  height: MediaQuery.of(context).size.height * .06,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: _currentGender == CurrentGender.FEMALE
                          ? Color(0xff00aeef)
                          : Color(0xfff8f9fa),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text("Female",
                      style: Theme.of(context).textTheme.subtitle2.copyWith(
                          color: _currentGender == CurrentGender.FEMALE
                              ? Colors.white70
                              : Color(0xff2b3e4f))),
                ),
                onTap: () {
                  setState(() {
                    _currentGender = CurrentGender.FEMALE;
                  });
                },
              )),
        ],
      ),
    );
  }

  getBirthDateAndWeightView() {
    return Container(
      width: MediaQuery.of(context).size.width * Dimen.input_form_width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: MediaQuery.of(context).size.width * .4,
              height: MediaQuery.of(context).size.height * .06,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Color(0xfff8f9fa),
                  borderRadius: BorderRadius.circular(5)),
              child: TextFormField(
                  controller: _dateController,
                  keyboardType: TextInputType.datetime,
                  decoration: new InputDecoration(
                      hintText: "Birth Date",
                      suffixIcon: Icon(Icons.date_range)),
                  onTap: () async {
                    DateTime date = DateTime(1900);
                    FocusScope.of(context).requestFocus(new FocusNode());

                    date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100));
                    _dateController.text =
                        DateFormat("dd-MM-yyyy").format(date);
                  }),
            ),
          ),
          SizedBox(
            width: Dimen.form_field_space_min,
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: MediaQuery.of(context).size.width * .4,
              height: MediaQuery.of(context).size.height * .06,
              alignment: Alignment.center,
              decoration: new BoxDecoration(
                  color: Color(0xfff8f9fa),
                  borderRadius: BorderRadius.circular(5)),
              child: TextFormField(
                controller: _weightController,
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(
                    hintText: S.current.weight,
                    isDense: true,
                    suffixIcon: Icon(Icons.line_weight)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  validateForm() {
    if (_dateController.text.isEmpty) {
      showError(S.current.pleaseSelectBirthDate);
      return false;
    } else if (_weightController.text.isEmpty) {
      showError(S.current.pleaseSelectWeight);
      return false;
    } else if (_breedController.text.isEmpty) {
      showError(S.current.pleaseSelectBreed);
      return false;
    }
    return true;
  }
}

enum CurrentGender { MALE, FEMALE }
