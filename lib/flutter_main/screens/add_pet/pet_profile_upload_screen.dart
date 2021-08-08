import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petzola/flutter_main/app/route.dart';
import 'package:petzola/flutter_main/common/model/breed.dart';
import 'package:petzola/flutter_main/common/model/pet.dart';
import 'package:petzola/flutter_main/common/res/dimen_const.dart';
import 'package:petzola/flutter_main/common/stats_widgets.dart';
import 'package:petzola/generated/l10n.dart';
import 'package:provider/provider.dart';

class PetProfileUploadScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PetProfileUploadScreenState();
  }
}

class _PetProfileUploadScreenState extends State<PetProfileUploadScreen> {
  final picker = ImagePicker();
  File _petImagePath;

  Pet _currentPetType;
  Breed _currentBreed;
  String _currentPetName;
  String _currentPetGender;
  String currentPetDate;
  String currentPetWeight;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context).settings.arguments as List;
    _currentPetType = arguments[0];
    _currentBreed = arguments[1];
    _currentPetName = arguments[2];
    currentPetWeight = arguments[3];
    currentPetDate = arguments[4];
    _currentPetGender = arguments[5];

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
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(Dimen.inner_boundary_field_space),
        height: MediaQuery.of(context).size.height * .85,
        child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Column(
                    children: [
                      Text(S.current.profileReady,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline1),
                      SizedBox(
                        height: 12,
                      ),
                      Text(S.current.AddProfilePic,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle1),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .08,
                      ),
                      Stack(
                        children: [
                          ClipOval(
                            child: Container(
                              width: MediaQuery.of(context).size.width * .50,
                              height: MediaQuery.of(context).size.width * .50,
                              child: (_petImagePath?.path != null)
                                  ? Image.file(
                                      _petImagePath,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .35,
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.fill,
                                    )
                                  : Image.asset(
                                      "assets/images/dog.png",
                                    ),
                              decoration:
                                  new BoxDecoration(color: Color(0xfff8f7f7)),
                            ),
                          ),
                          Positioned(
                              bottom: 22,
                              right: 14,
                              child: GestureDetector(
                                child: Container(
                                    width: 36,
                                    height: 36,
                                    child: Image.asset(
                                      "assets/images/camera.png",
                                    ),
                                    decoration: new BoxDecoration(
                                        borderRadius: BorderRadius.circular(24),
                                        border: Border.all(
                                            color: Colors.white, width: 3),
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xffeaf0f9),
                                            Color(0xfff4f9fe)
                                          ],
                                          stops: [0, 1],
                                          begin: Alignment(-0.00, -1.00),
                                          end: Alignment(0.00, 1.00),
                                          // angle: 180,
                                          // scale: undefined,
                                        ))),
                                onTap: () {
                                  getImage();
                                },
                              ))
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: Dimen.form_field_sepereator_space,
                  ),
                  Column(
                    children: [
                      Text(
                        _currentPetName,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      SizedBox(
                        height: Dimen.form_field_space_min,
                      ),
                      Text(
                        _currentBreed.name,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 18,
              ),
              GestureDetector(
                child: Container(
                  child: Image.asset("assets/images/nextButton_3.png"),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(Routes.HOME);
                },
              ),
            ]),
      ),
    );
  }

  Future getImage({onSucess, onError}) async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera, maxHeight: 200, maxWidth: 200);

    setState(() {
      _petImagePath = File(pickedFile.path);
    });
  }
}
