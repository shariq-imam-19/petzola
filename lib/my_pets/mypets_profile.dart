import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petzola/common/global_variables.dart';
import 'package:petzola/localization/language_constants.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:petzola/common/common_z.dart';
import 'package:petzola/common/commons.dart';
import 'package:petzola/common/style.dart';
import 'dart:math' as math;
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:file_picker/file_picker.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart' as p;

class PetsProfile extends StatefulWidget {
  var petDetails;

  PetsProfile({this.petDetails});
  @override
  _PetsProfileState createState() => _PetsProfileState();
}

class _PetsProfileState extends State<PetsProfile>
    with TickerProviderStateMixin {
  TabController profileViewController;
  TabController tabViewController;
  TextEditingController dateOfBirth = new TextEditingController();

  TextEditingController _nameController = new TextEditingController();
  TextEditingController _numController = new TextEditingController();
  DateTime selectedDate = DateTime.now();
  var tempdate;
  String showBreedType;
  var rating = 3.0;

  List<Map<String, dynamic>> breedType = [
    {
      "name": "Terry Alvarado",
    },
    {
      "name": "Carmen Marshall",
    },
    {
      "name": "Steve Wells",
    },
    {
      "name": "Dennis Lynch",
    },
    {
      "name": "Richard Reyes",
    },
    {
      "name": "Sara Mccoy",
    },
    {
      "name": "Terry Alvarado",
    },
    {
      "name": "Carmen Marshall",
    },
    {
      "name": "Steve Wells",
    },
    {
      "name": "Dennis Lynch",
    },
    {
      "name": "Richard Reyes",
    },
    {
      "name": "Sara Mccoy",
    },
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        tempdate = selectedDate.toString().split(" ")[0];
        dateOfBirth.text = tempdate;
      });
  }

  int indicatorIndex = 0;
  int genderIndex = 0;
  String showpetType;
  String selectCountry;

  Map<String, dynamic> tabInfo = {
    "tabs": [
      {"name": "Main Information", "icon": "lib/assets/icons/myPets_info0.png"},
      {
        "name": "Registration Date",
        "icon": "lib/assets/icons/myPets_info1.png"
      },
      {"name": "Insurance Data", "icon": "lib/assets/icons/myPets_info2.png"},
      {"name": "Behavior", "icon": "lib/assets/icons/myPets_info3.png"},
      {"name": "Contacts", "icon": "lib/assets/icons/myPets_info4.png"},
      {"name": "Documents", "icon": "lib/assets/icons/myPets_info5.png"}
    ]
  };

  List passportImages = [];
  List medicalImages = [];
  List<FilePickerResult> pickedFile = [];
  List<dynamic> passportCommonList = [];
  List<dynamic> medicalCommonList = [];

  List<String> gender = ['Male', 'Female'];

  int _selectedIndex = 0;
  int genderSelected = 0;
  List<bool> showDelete = [];

  ScrollController _scrollController;

  _onSelected(int i) {
    setState(() {
      genderSelected = i;
    });
  }

  onTabPressed(int i) {
    setState(() {
      _selectedIndex = i;
      tabViewController.animateTo(i);
    });
  }

  File _image, _image1;

  _imgFromGallery() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);
    setState(() {
      _image = image;
    });
  }

  _imgFromGallery1() async {
    File image1 = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);
    setState(() {
      _image1 = image1;
    });
  }

  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);
    if (image != null) {
      setState(() {
        _image = image;
      });
    }
  }

  _imgFromGalleryPass(List img) async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);
    if(image != null){
    }
  }

  _fileFromDevice(List file) async {
    FilePickerResult picked = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['pdf','docx']);
    if(picked != null){

    }
  }

  Widget _displayImages(List imgs, double height) {
    return Row(
      children: [
        Flexible(
          child: Container(
            height: height * 0.14,
            //width: MediaQuery.of(context).size.width * 0.64,
            decoration: BoxDecoration(
              color: Color(0xffF5F8FA),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListView.builder(
              itemCount: imgs.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              key: UniqueKey(),
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: GestureDetector(
                    onTap: (){
                      Image _img = Image.file(File(imgs[i].path));
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          opaque: false,
                          barrierColor: true ? Colors.black : Colors.white,
                          pageBuilder: (BuildContext context, _, __) {
                            return FullScreenPage(
                              child: _img,
                              dark: true,
                              onDelete: (){
                                setState(() {
                                  imgs.removeAt(i);
                                });
                                Navigator.pop(context);
                              },
                            );
                          },
                        ),
                      );
                    },
                    child: Container(
                        width: 60,
                        height: height * 0.13,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image.file(
                            File(imgs[i].path),
                            fit: BoxFit.contain,
                            width: 60,
                            height: 50,
                          ),
                        )),
                  ),
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GestureDetector(
            onTap: (){
              //_imgFromGalleryPass(imgs);
              AwesomeDialog(
                context: context,
                animType: AnimType.SCALE,
                dialogType: DialogType.NO_HEADER,
                body: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          VariableText(
                            text: getTranslated(context, 'Choose Type:'),
                            fontsize: 17,
                            fontcolor: textColor,
                            fontFamily: 'sftr',
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: CustomButton(
                            buttonHeight: height * 0.04,
                            buttonWidth: height * 0.50,
                            buttonBorderRadius: 12,
                            buttonFontSize: height * 0.021,
                            buttonColor: themeColor1,
                            buttonTextColor: themeColor2,
                            buttonText: getTranslated(context, "Picture"),
                            buttonFontFamily: 'sfdm',
                            buttonOnTap: () {
                              Navigator.pop(context);
                              _imgFromGalleryPass(passportImages);
                            }),
                      ),
                      CustomButton(
                          buttonHeight: height * 0.04,
                          buttonWidth: height * 0.50,
                          buttonBorderRadius: 12,
                          buttonFontSize: height * 0.021,
                          buttonColor: themeColor1,
                          buttonTextColor: themeColor2,
                          buttonText: getTranslated(context, "Document"),
                          buttonFontFamily: 'sfdm',
                          buttonOnTap: () {
                            Navigator.pop(context);
                            _fileFromDevice(pickedFile);
                          }),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: CustomButton(
                            buttonHeight: height * 0.04,
                            buttonWidth: height * 0.50,
                            buttonBorderRadius: 12,
                            buttonFontSize: height * 0.021,
                            buttonColor: Colors.red,
                            buttonTextColor: themeColor2,
                            buttonText: getTranslated(context, "Cancel"),
                            buttonFontFamily: 'sfdm',
                            buttonOnTap: () {
                              Navigator.pop(context);
                            }),
                      ),
                    ],
                  ),
                ),
                //btnCancelOnPress: (){}
              )..show();
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: themeColor1,
                borderRadius: BorderRadius.circular(50)
              ),
              child: Center(child: Icon(Icons.add, color: Colors.white,)),
            ),
          ),
        )
      ],
    );
  }

  Widget _displayFiles(List<FilePickerResult> files, double height){
    return Row(
      children: [
        Flexible(
          child: Container(
            height: height * 0.14,
            //width: MediaQuery.of(context).size.width * 0.64,
            decoration: BoxDecoration(
              color: Color(0xffF5F8FA),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListView.builder(
              itemCount: files.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              key: UniqueKey(),
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: GestureDetector(
                    onTap: (){
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                            width: 80,
                            height: height * 0.10,
                            decoration: BoxDecoration(
                              color: themeColor1,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: VariableText(
                                text: 'File',
                                fontcolor: Colors.white,
                                fontsize: 17,
                                fontFamily: 'sftsb',
                              ),
                            ),
                        ),
                        Container(
                          width: 80,
                          child: VariableText(
                            text: files[i].names[i].toString(),
                            fontcolor: textColor,
                            max_lines: 2,
                            //overflow: TextOverflow.ellipsis,
                            fontsize: 12,
                            fontFamily: 'sftsb',
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GestureDetector(
            onTap: (){
              //_imgFromGalleryPass(imgs);
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: themeColor1,
                  borderRadius: BorderRadius.circular(50)
              ),
              child: Center(child: Icon(Icons.add, color: Colors.white,)),
            ),
          ),
        )
      ],
    );
  }

  bool checkFileType(var path){
    String a = p.extension(path.toString(), 1);
    print("extension before: " + a);
    if(a.length > 6){
      a = a.substring(0, a.indexOf(','));
    }
    print("extension: " + a);
    if(a.contains('jpeg') || a.contains('png') || a.contains('jpg'))
      return true;
    else
      return false;
  }



  Widget _displayAll(List<dynamic> cList, double height){
    return Row(
      children: [
        Flexible(
          child: Container(
            height: height * 0.14,
            //width: MediaQuery.of(context).size.width * 0.64,
            decoration: BoxDecoration(
              color: Color(0xffF5F8FA),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListView.builder(
              itemCount: cList.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              key: UniqueKey(),
              itemBuilder: (context, i) {
                return checkFileType(cList[i]) ?
                 Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: GestureDetector(
                    onTap: (){
                      Image _img = Image.file(File(cList[i].path));
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          opaque: false,
                          barrierColor: true ? Colors.black : Colors.white,
                          pageBuilder: (BuildContext context, _, __) {
                            return FullScreenPage(
                              child: _img,
                              dark: true,
                              onDelete: (){
                                setState(() {
                                  cList.removeAt(i);
                                });
                                Navigator.pop(context);
                              },
                            );
                          },
                        ),
                      );
                    },
                    child: Container(
                        width: 60,
                        height: height * 0.13,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image.file(
                            File(cList[i].path),
                            fit: BoxFit.contain,
                            width: 60,
                            height: 50,
                          ),
                        )),
                  ),
                ):
                 Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: GestureDetector(
                    onLongPress: (){
                      if(showDelete[i] == false) {
                        setState(() {
                          showDelete[i] = true;
                        });
                      }else{
                        setState(() {
                          showDelete[i] = false;
                        });
                      }
                    },
                    onTap: (){
                      if(showDelete[i] == true){
                        setState(() {
                          cList.removeAt(i);
                          showDelete.removeAt(i);
                        });
                      }
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          width: 80,
                          height: height * 0.10,
                          decoration: BoxDecoration(
                            color: showDelete[i] ? Colors.red : themeColor1,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(child:
                            showDelete[i] ? Icon(Icons.delete, color: Colors.white,) :
                            VariableText(
                              text: 'File',
                              fontcolor: Colors.white,
                              fontsize: 17,
                              fontFamily: 'sftsb',
                            ),
                          ),
                        ),
                        Container(
                          width: 80,
                          child: VariableText(
                            text: cList[i].names[0].toString(),
                            fontcolor: textColor,
                            max_lines: 2,
                            //overflow: TextOverflow.ellipsis,
                            fontsize: 12,
                            fontFamily: 'sftsb',
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GestureDetector(
            onTap: (){
              //_imgFromGalleryPass(imgs);
              AwesomeDialog(
                context: context,
                animType: AnimType.SCALE,
                dialogType: DialogType.NO_HEADER,
                body: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          VariableText(
                            text: getTranslated(context, 'Choose Type:'),
                            fontsize: 17,
                            fontcolor: textColor,
                            fontFamily: 'sftr',
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: CustomButton(
                            buttonHeight: height * 0.04,
                            buttonWidth: height * 0.50,
                            buttonBorderRadius: 12,
                            buttonFontSize: height * 0.021,
                            buttonColor: themeColor1,
                            buttonTextColor: themeColor2,
                            buttonText: getTranslated(context, "Picture"),
                            buttonFontFamily: 'sfdm',
                            buttonOnTap: () {
                              Navigator.pop(context);
                              _imgFromGalleryPass(cList);
                            }),
                      ),
                      CustomButton(
                          buttonHeight: height * 0.04,
                          buttonWidth: height * 0.50,
                          buttonBorderRadius: 12,
                          buttonFontSize: height * 0.021,
                          buttonColor: themeColor1,
                          buttonTextColor: themeColor2,
                          buttonText: getTranslated(context, "Document"),
                          buttonFontFamily: 'sfdm',
                          buttonOnTap: () {
                            Navigator.pop(context);
                            _fileFromDevice(cList);
                          }),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: CustomButton(
                            buttonHeight: height * 0.04,
                            buttonWidth: height * 0.50,
                            buttonBorderRadius: 12,
                            buttonFontSize: height * 0.021,
                            buttonColor: Colors.red,
                            buttonTextColor: themeColor2,
                            buttonText: getTranslated(context, "Cancel"),
                            buttonFontFamily: 'sfdm',
                            buttonOnTap: () {
                              Navigator.pop(context);
                            }),
                      ),
                    ],
                  ),
                ),
                //btnCancelOnPress: (){}
              )..show();
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: themeColor1,
                  borderRadius: BorderRadius.circular(50)
              ),
              child: Center(child: Icon(Icons.add, color: Colors.white,)),
            ),
          ),
        )
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileViewController = TabController(length: 3, vsync: this);
    profileViewController.addListener(() {
      setState(() {
        indicatorIndex = profileViewController.index;
      });
    });

    tabViewController =
        TabController(length: tabInfo['tabs'].length, vsync: this);
    _scrollController = ScrollController();
    _nameController.text = widget.petDetails['name'];
    _numController.text = '+938 01030891060';
    passportImages.clear();
    medicalImages.clear();
    //passportCommonList.clear();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    switch (MediaQuery.of(context).orientation) {
      case Orientation.landscape:
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: renderAppbar(),
          body: NestedScrollView(
              controller: _scrollController,
              headerSliverBuilder: (context, value) {
                return [
                  SliverToBoxAdapter(
                      child: renderProfilePicturesL(size.height, size.width)),
                  SliverToBoxAdapter(
                      child: SizedBox(height: size.height * 0.10)),
                  SliverToBoxAdapter(child: rendertabs(size.width, size.width)),
                  SliverToBoxAdapter(
                      child: SizedBox(height: size.height * 0.02)),
                ];
              },
              body: renderPageView(size.width, size.width)
              /*child: Column(
              children: [
                renderProfilePicturesL(size.height, size.width),
                SizedBox(height: size.height * 0.10),
                rendertabs(size.width, size.width),
                SizedBox(height: size.height * 0.02),
                renderPageView(size.width, size.width),
              ],
            ),*/
              ),
        );

      case Orientation.portrait:
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: renderAppbar(),
          body: NestedScrollView(
              controller: _scrollController,
              headerSliverBuilder: (context, value) {
                return [
                  SliverToBoxAdapter(
                    child: renderProfilePictures(size.height, size.width),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(height: size.height * 0.03),
                  ),
                  SliverToBoxAdapter(
                    child: rendertabs(size.height, size.width),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(height: size.height * 0.02),
                  ),
                ];
              },
              body: renderPageView(size.height, size.width)),
        );
    }
  }

  Widget renderAppbar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      titleSpacing: 0,
      centerTitle: true,
      leadingWidth: 70,
      title: VariableText(
        text: widget.petDetails['name'],
        fontcolor: Color(0xFF2C3E50),
        fontsize: 17,
        fontFamily: 'sftsb',
      ),
      leading: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xFFEAF0F9),
                borderRadius: BorderRadius.circular(60)),
            child: currLang == 'ar'
                ? Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(math.pi),
                    child: IconButton(
                      icon: Image.asset(
                        'lib/assets/icons/appbar_back.png',
                        scale: 3.2,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  )
                : IconButton(
                    icon: Image.asset(
                      'lib/assets/icons/appbar_back.png',
                      scale: 3.2,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
          ),
        ),
      ),
      actions: [
        InkWell(
          onTap: () {},
          child: SizedBox(
            width: 26,
            child: Image.asset("lib/assets/icons/notification2x.png"),
          ),
        ),
        SizedBox(width: 12),
        InkWell(
          onTap: () {},
          child: SizedBox(
            width: 26,
            child: Image.asset("lib/assets/icons/chat2x.png"),
          ),
        ),
        SizedBox(
          width: 16,
        ),
      ],
    );
  }

  Widget renderProfilePictures(var cHeight, var cWidth) {
    return Container(
      height: cHeight * 0.32,
      width: cWidth,
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: Color(0xFFF0F5FC), borderRadius: BorderRadius.circular(12)),
      child: Stack(
        children: [
          TabBarView(controller: profileViewController, children: <Widget>[
            InkWell(
              onTap: () async {
                Image _img = Image.asset(widget.petDetails['image']);
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    opaque: false,
                    barrierColor: true ? Colors.black : Colors.white,
                    pageBuilder: (BuildContext context, _, __) {
                      return FullScreenPage(
                        child: _img,
                        dark: true,
                      );
                    },
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: AssetImage(widget.petDetails['image']),
                        fit: BoxFit.fitHeight)),
              ),
            ),
            InkWell(
              onTap: () async {
                Image _img = Image.asset(widget.petDetails['image']);
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    opaque: false,
                    barrierColor: true ? Colors.black : Colors.white,
                    pageBuilder: (BuildContext context, _, __) {
                      return FullScreenPage(
                        child: _img,
                        dark: true,
                      );
                    },
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: AssetImage(widget.petDetails['image']),
                        fit: BoxFit.fitHeight)),
              ),
            ),
            InkWell(
              onTap: () async {
                Image _img = Image.asset(widget.petDetails['image']);
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    opaque: false,
                    barrierColor: true ? Colors.black : Colors.white,
                    pageBuilder: (BuildContext context, _, __) {
                      return FullScreenPage(
                        child: _img,
                        dark: true,
                      );
                    },
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: AssetImage(widget.petDetails['image']),
                        fit: BoxFit.fitHeight)),
                //child: Image.asset(widget.petDetails['image'], fit: BoxFit.cover)
              ),
            ),
          ]),
          Align(
            alignment: Alignment.topLeft,
            child: InkWell(
              onTap: () {
                AwesomeDialog(
                  context: context,
                  animType: AnimType.SCALE,
                  dialogType: DialogType.NO_HEADER,
                  body: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            VariableText(
                              text: getTranslated(context, 'Choose Source:'),
                              fontsize: 17,
                              fontcolor: textColor,
                              fontFamily: 'sftr',
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: CustomButton(
                              buttonHeight: cHeight * 0.04,
                              buttonWidth: cWidth * 0.50,
                              buttonBorderRadius: 12,
                              buttonFontSize: cHeight * 0.021,
                              buttonColor: themeColor1,
                              buttonTextColor: themeColor2,
                              buttonText: getTranslated(context, "Camera"),
                              buttonFontFamily: 'sfdm',
                              buttonOnTap: () {
                                Navigator.pop(context);
                                _imgFromCamera();
                              }),
                        ),
                        CustomButton(
                            buttonHeight: cHeight * 0.04,
                            buttonWidth: cWidth * 0.50,
                            buttonBorderRadius: 12,
                            buttonFontSize: cHeight * 0.021,
                            buttonColor: themeColor1,
                            buttonTextColor: themeColor2,
                            buttonText: getTranslated(context, "Gallery"),
                            buttonFontFamily: 'sfdm',
                            buttonOnTap: () {
                              Navigator.pop(context);
                              _imgFromGallery();
                            }),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: CustomButton(
                              buttonHeight: cHeight * 0.04,
                              buttonWidth: cWidth * 0.50,
                              buttonBorderRadius: 12,
                              buttonFontSize: cHeight * 0.021,
                              buttonColor: Colors.red,
                              buttonTextColor: themeColor2,
                              buttonText: getTranslated(context, "Cancel"),
                              buttonFontFamily: 'sfdm',
                              buttonOnTap: () {
                                Navigator.pop(context);
                              }),
                        ),
                      ],
                    ),
                  ),
                  //btnCancelOnPress: (){}
                )..show();
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Image.asset(
                  'lib/assets/icons/myPets_addImage.png',
                  scale: 3.4,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3),
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                          color: indicatorIndex == index
                              ? Color(0xFF2C3E50)
                              : Color(0x602C3E50),
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  );
                }),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget renderProfilePicturesL(var cHeight, var cWidth) {
    return Container(
      height: cWidth * 0.32,
      width: cWidth,
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: Color(0xFFF0F5FC), borderRadius: BorderRadius.circular(12)),
      child: Stack(
        children: [
          TabBarView(controller: profileViewController, children: <Widget>[
            InkWell(
              onTap: () async {
                Image _img = Image.asset(widget.petDetails['image']);
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    opaque: false,
                    barrierColor: true ? Colors.black : Colors.white,
                    pageBuilder: (BuildContext context, _, __) {
                      return FullScreenPage(
                        child: _img,
                        dark: true,
                      );
                    },
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: AssetImage(widget.petDetails['image']),
                        fit: BoxFit.fitHeight)),
                //child: Image.asset(widget.petDetails['image'], fit: BoxFit.cover)
              ),
            ),
            InkWell(
              onTap: () async {
                Image _img = Image.asset(widget.petDetails['image']);
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    opaque: false,
                    barrierColor: true ? Colors.black : Colors.white,
                    pageBuilder: (BuildContext context, _, __) {
                      return FullScreenPage(
                        child: _img,
                        dark: true,
                      );
                    },
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: AssetImage(widget.petDetails['image']),
                        fit: BoxFit.fitHeight)),
                //child: Image.asset(widget.petDetails['image'], fit: BoxFit.cover)
              ),
            ),
            InkWell(
              onTap: () async {
                Image _img = Image.asset(widget.petDetails['image']);
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    opaque: false,
                    barrierColor: true ? Colors.black : Colors.white,
                    pageBuilder: (BuildContext context, _, __) {
                      return FullScreenPage(
                        child: _img,
                        dark: true,
                      );
                    },
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: AssetImage(widget.petDetails['image']),
                        fit: BoxFit.fitHeight)),
                //child: Image.asset(widget.petDetails['image'], fit: BoxFit.cover)
              ),
            ),
          ]),
          Align(
            alignment: Alignment.topLeft,
            child: InkWell(
              onTap: () {
                AwesomeDialog(
                  context: context,
                  animType: AnimType.SCALE,
                  dialogType: DialogType.NO_HEADER,
                  body: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            VariableText(
                              text: getTranslated(context, 'Choose Source:'),
                              fontsize: 17,
                              fontcolor: textColor,
                              fontFamily: 'sftr',
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: CustomButton(
                              buttonHeight: cHeight * 0.10,
                              buttonWidth: cWidth * 0.50,
                              buttonBorderRadius: 12,
                              buttonFontSize: cHeight * 0.045,
                              buttonColor: themeColor1,
                              buttonTextColor: themeColor2,
                              buttonText: getTranslated(context, "Camera"),
                              buttonFontFamily: 'sfdm',
                              buttonOnTap: () {
                                Navigator.pop(context);
                                _imgFromCamera();
                              }),
                        ),
                        CustomButton(
                            buttonHeight: cHeight * 0.10,
                            buttonWidth: cWidth * 0.50,
                            buttonBorderRadius: 12,
                            buttonFontSize: cHeight * 0.045,
                            buttonColor: themeColor1,
                            buttonTextColor: themeColor2,
                            buttonText: getTranslated(context, "Gallery"),
                            buttonFontFamily: 'sfdm',
                            buttonOnTap: () {
                              Navigator.pop(context);
                              _imgFromGallery();
                            }),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: CustomButton(
                              buttonHeight: cHeight * 0.10,
                              buttonWidth: cWidth * 0.50,
                              buttonBorderRadius: 12,
                              buttonFontSize: cHeight * 0.045,
                              buttonColor: Colors.red,
                              buttonTextColor: themeColor2,
                              buttonText: getTranslated(context, "Cancel"),
                              buttonFontFamily: 'sfdm',
                              buttonOnTap: () {
                                Navigator.pop(context);
                              }),
                        ),
                      ],
                    ),
                  ),
                  //btnCancelOnPress: (){}
                )..show();
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Image.asset(
                  'lib/assets/icons/myPets_addImage.png',
                  scale: 3.4,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3),
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                          color: indicatorIndex == index
                              ? Color(0xFF2C3E50)
                              : Color(0x602C3E50),
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  );
                }),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget rendertabs(var cHeight, var cWidth) {
    return Container(
        height: cHeight * 0.14,
        width: cWidth,
        //color: Colors.red,
        margin: EdgeInsets.only(left: 16),
        child: ListView.builder(
            itemCount: tabInfo['tabs'].length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, index) {
              return InkWell(
                onTap: () {
                  onTabPressed(index);
                },
                child: Container(
                  //color: Colors.red,
                  padding: EdgeInsets.only(right: 12),
                  margin: _selectedIndex == index
                      ? EdgeInsets.only(bottom: 0)
                      : EdgeInsets.only(bottom: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: cHeight * 0.09,
                        width: cHeight * 0.155,
                        decoration: BoxDecoration(
                            color: _selectedIndex == index
                                ? Color(0xFF00AEEF)
                                : Color(0xFFF0F5FC),
                            borderRadius: BorderRadius.circular(20)),
                        child: Image.asset(tabInfo['tabs'][index]['icon'],
                            scale: 3.2,
                            color: _selectedIndex == index
                                ? Colors.white
                                : Color(0xFF646060)),
                      ),
                      _selectedIndex == index
                          ? Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: VariableText(
                                text: getTranslated(context,
                                    tabInfo['tabs'][index]['name'].toString()),
                                fontsize: 12,
                                fontcolor: Color(0xFF2B3E4F),
                              ),
                            )
                          : Container()
                    ],
                  ),
                ),
              );
            }));
  }

  Widget renderPageView(var cHeight, var cWidth) {
    return TabBarView(
      controller: tabViewController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: renderTab0(cHeight, cWidth)),
        SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: renderTab1(cHeight, cWidth)),
        SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: renderTab2(cHeight, cWidth)),
        SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: renderTab3(cHeight, cWidth)),
        SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: renderTab4(cHeight, cWidth)),
        SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: renderTab5(cHeight, cWidth))
      ],
    );
  }

  Widget renderTab0(var cHeight, var cWidth) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: RectangluartextFeild(
            //cont: _nameController,
            heights: 60,
            widths: cWidth,
            maxLines: 1,
            hinttext: widget.petDetails['name'],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: RectangluartextFeildWithIcon(
            heights: 60,
            widths: cWidth,
            enable: false,
            textcolor: showpetType == null ? hinttextColor : textColor,
            //cont: _selectVaccineController,
            imageIconPath: 'lib/assets/icons/dropdownicon.png',
            hinttext:
                showpetType == null ? widget.petDetails['type'] : showpetType,
            onTap: () {
              selectPetType(cHeight, cWidth);
            },
          ),
        ),
        Padding(
          //padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          padding: EdgeInsets.only(
            left: 16,
          ),
          child: Row(
            children: List.generate(gender.length, (index) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: CustomButton(
                      buttonHeight: 60,
                      buttonBorderRadius: 4,
                      buttonFontSize: cHeight * 0.020,
                      buttonColor: genderSelected == index
                          ? themeColor1
                          : Color(0xffF5F8FA),
                      buttonTextColor: genderSelected == index
                          ? themeColor2
                          : Color(0xff2B3E4F),
                      buttonText:
                          getTranslated(context, gender[index].toString()),
                      buttonFontFamily: 'sftr',
                      buttonOnTap: () {
                        _onSelected(index);
                      }),
                ),
              );
            }),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: RectangluartextFeildWithIcon(
            heights: 60,
            widths: cWidth,
            textcolor: showBreedType == null ? hinttextColor : textColor,
            fontsize: cHeight * 0.019,
            enable: false,
            hinttext: showBreedType == null
                ? widget.petDetails['characteristic']
                : showBreedType,
            imageIconPath: "lib/assets/icons/dropdownicon.png",
            keytype: TextInputType.text,
            onTap: () {
              selectBreedType(cHeight, cWidth);
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: RectangluartextFeildWithIcon(
                  heights: 60,
                  fontsize: cHeight * 0.020,
                  cont: dateOfBirth,
                  textcolor: tempdate != null ? textColor : hinttextColor,
                  enable: false,
                  hinttext: getTranslated(context, "Birthdate"),
                  imageIconPath: "lib/assets/icons/calendericon.png",
                  keytype: TextInputType.text,
                  onTap: () {
                    _selectDate(context);
                  },
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                flex: 1,
                child: RectangluartextFeildWithIcon(
                  heights: 60,
                  fontsize: cHeight * 0.019,
                  enable: true,
                  hinttext: getTranslated(context, 'Weight'),
                  imageIconPath: "lib/assets/icons/kgicon.png",
                  keytype: TextInputType.number,
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Row(
            children: [
              Expanded(
                child: CustomButton(
                    buttonHeight: 50,
                    buttonBorderRadius: 8,
                    buttonFontSize: cHeight * 0.025,
                    buttonColor: themeColor1,
                    buttonTextColor: themeColor2,
                    buttonText: getTranslated(context, 'Save'),
                    buttonFontFamily: 'sfdm',
                    buttonOnTap: () {
                      _scrollController.animateTo(0.0,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.fastLinearToSlowEaseIn);
                      Fluttertoast.showToast(
                          msg: "Saved",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 3,
                          backgroundColor: Color(0xFF00AEEf),
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }),
              ),
            ],
          ),
        ),
        //SizedBox(height: cWidth*0.04,),
      ],
    );
  }

  void selectBreedType(double height, double width) {
    showModalBottomSheet(
        isScrollControlled: true,
        //transitionAnimationController: controller,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return DraggableScrollableSheet(
              initialChildSize: 0.70, //set this as you want
              maxChildSize: 0.70, //set this as you want
              minChildSize: 0.70, //set this as you want

              builder: (context, scrollController) {
                return SearchBreed(
                  height: height,
                  width: width,
                  onselected: (temp) {
                    Navigator.of(context).pop();
                    setState(() {
                      showBreedType = temp;
                    });
                  },
                );
                //whatever you're returning, does not have to be a Container
              });
        });
  }

  void selectPetType(double height, double width) {
    showModalBottomSheet(
        isScrollControlled: true,
        //transitionAnimationController: controller,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return DraggableScrollableSheet(
              initialChildSize: 0.70,
              //set this as you want
              maxChildSize: 0.70,
              //set this as you want
              minChildSize: 0.70,
              //set this as you want
              expand: false,
              builder: (context, scrollController) {
                return selectPetTypeClass(
                  height: height,
                  width: width,
                  onSelect: (temp) {
                    Navigator.of(context).pop();
                    setState(() {
                      showpetType = temp;
                    });
                  },
                );
                //whatever you're returning, does not have to be a Container
              });
        });
  }

  void select_Country(double height, double width) {
    showModalBottomSheet(
        isScrollControlled: true,
        //transitionAnimationController: controller,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return DraggableScrollableSheet(
              initialChildSize: 0.70,
              //set this as you want
              maxChildSize: 0.70,
              //set this as you want
              minChildSize: 0.70,
              //set this as you want
              expand: false,
              builder: (context, scrollController) {
                return selectCountryTypeClass(
                  height: height,
                  width: width,
                  onSelect: (temp) {
                    Navigator.of(context).pop();
                    setState(() {
                      selectCountry = temp;
                    });
                  },
                );
                //whatever you're returning, does not have to be a Container
              });
        });
  }

  Widget renderTab1(var cHeight, var cWidth) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: RectangluartextFeild(
            //cont: _nameController,
            heights: 60,
            widths: cWidth,

            maxLines: 1,
            hinttext: getTranslated(context, "Full Name"),
            keytype: TextInputType.text,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: RectangluartextFeild(
            //cont: _nameController,
            heights: 60,
            widths: cWidth,

            maxLines: 1,
            keytype: TextInputType.number,
            hinttext: getTranslated(context, "Registration Number"),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: RectangluartextFeildWithIcon(
            heights: 60,
            widths: cWidth,
            enable: false,
            textcolor: showpetType == null ? hinttextColor : textColor,

            //cont: _selectVaccineController,
            imageIconPath: 'lib/assets/icons/dropdownicon.png',
            hinttext: selectCountry == null
                ? getTranslated(context, "Country")
                : selectCountry,
            onTap: () {
              select_Country(cHeight, cWidth);
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: RectangluartextFeild(
            //cont: _nameController,
            heights: 60,
            widths: cWidth,

            maxLines: 1,
            hinttext: getTranslated(context, "Passport Number"),
            keytype: TextInputType.number,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: RectangluartextFeildWithIcon(
            heights: 60,
            fontsize: cHeight * 0.020,
            cont: dateOfBirth,
            widths: cWidth,
            textcolor: tempdate != null ? textColor : hinttextColor,
            enable: false,
            hinttext: getTranslated(context, "Passport Expiry Date"),
            imageIconPath: "lib/assets/icons/calendericon.png",
            keytype: TextInputType.text,
            onTap: () {
              _selectDate(context);
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: RectangluartextFeild(
            //cont: _nameController,
            heights: 60,
            widths: cWidth,

            maxLines: 1,
            hinttext: getTranslated(context, "Microchip Number"),
            keytype: TextInputType.number,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: RectangluartextFeild(
            //cont: _nameController,
            heights: 60,
            widths: cWidth,

            maxLines: 1,
            hinttext: getTranslated(context, "Microchip Position"),
            keytype: TextInputType.text,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: CustomButton(
                    buttonHeight: 50,
                    buttonBorderRadius: 8,
                    buttonFontSize: cHeight * 0.025,
                    buttonColor: themeColor1,
                    buttonTextColor: themeColor2,
                    buttonText: getTranslated(context, "Save"),
                    buttonFontFamily: 'sfdm',
                    buttonOnTap: () {
                      _scrollController.animateTo(0.0,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.fastLinearToSlowEaseIn);
                      Fluttertoast.showToast(
                          msg: "Saved",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 3,
                          backgroundColor: Color(0xFF00AEEf),
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget renderTab2(var cHeight, var cWidth) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: RectangluartextFeild(
            //cont: _nameController,
            heights: 60,
            widths: cWidth,

            maxLines: 1,
            hinttext: getTranslated(context, "Company Name"),
            keytype: TextInputType.text,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: RectangluartextFeild(
            //cont: _nameController,
            heights: 60,
            widths: cWidth,
            maxLines: 1,
            hinttext: getTranslated(context, "Registration Number"),
            keytype: TextInputType.number,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: RectangluartextFeild(
            //cont: _nameController,
            heights: 60,
            widths: cWidth,
            maxLines: 1,
            hinttext: getTranslated(context, "Policy Number"),
            keytype: TextInputType.number,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: RectangluartextFeildWithIcon(
            heights: 60,
            fontsize: cHeight * 0.020,
            cont: dateOfBirth,
            widths: cWidth,
            textcolor: tempdate != null ? textColor : hinttextColor,
            enable: false,
            hinttext: getTranslated(context, "Expiry Date"),
            imageIconPath: "lib/assets/icons/calendericon.png",
            keytype: TextInputType.text,
            onTap: () {
              _selectDate(context);
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Container(
            height: cHeight * 0.16,
            width: cWidth,
            decoration: BoxDecoration(
              color: Color(0xffF5F8FA),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 8.0, top: 8, bottom: 8, left: 20),
              child: TextFormField(
                style: TextStyle(
                    fontSize: 17, fontFamily: 'sftr', color: textColor),

                // onChanged: onChanged,
                //   controller: cont,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Number';
                  } else {
                    return null;
                  }
                },

                decoration: InputDecoration(
                  fillColor: Color(0xffF5F8FA),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: getTranslated(context, "Note"),
                  hintStyle: TextStyle(
                      fontSize: 17, fontFamily: 'sftr', color: hinttextColor),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: CustomButton(
                    buttonHeight: 50,
                    buttonBorderRadius: 8,
                    buttonFontSize: cHeight * 0.025,
                    buttonColor: themeColor1,
                    buttonTextColor: themeColor2,
                    buttonText: getTranslated(context, "Save"),
                    buttonFontFamily: 'sfdm',
                    buttonOnTap: () {
                      _scrollController.animateTo(0.0,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.fastLinearToSlowEaseIn);
                      Fluttertoast.showToast(
                          msg: "Saved",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 3,
                          backgroundColor: Color(0xFF00AEEf),
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget renderTab3(var cHeight, var cWidth) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              VariableText(
                text: getTranslated(context, "Aggressive"),
                fontsize: 17,
                fontcolor: textColor,
                fontFamily: 'sftr',
              ),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                itemSize: 25,
                direction: Axis.horizontal,
                allowHalfRating: true,
                unratedColor: Color(0xffF8F7F7),
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Image.asset(
                  "lib/assets/icons/staricon.png",
                  color: Color(0xffF47920),
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              VariableText(
                text: getTranslated(context, "Noisy"),
                fontsize: 17,
                fontcolor: textColor,
                fontFamily: 'sftr',
              ),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                itemSize: 25,
                direction: Axis.horizontal,
                allowHalfRating: true,
                unratedColor: Color(0xffF8F7F7),
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Container(
                  height: 5,
                  width: 5,
                  child: Image.asset(
                    "lib/assets/icons/staricon.png",
                    scale: 10.5,
                    color: Color(0xffF47920),
                    height: 5,
                  ),
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              VariableText(
                text: getTranslated(context, "Scared"),
                fontsize: 17,
                fontcolor: textColor,
                fontFamily: 'sftr',
              ),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                itemSize: 25,
                direction: Axis.horizontal,
                allowHalfRating: true,
                unratedColor: Color(0xffF8F7F7),
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Container(
                  height: 5,
                  width: 5,
                  child: Image.asset(
                    "lib/assets/icons/staricon.png",
                    scale: 10.5,
                    color: Color(0xffF47920),
                    height: 5,
                  ),
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              VariableText(
                text: getTranslated(context, "Shy"),
                fontsize: 17,
                fontcolor: textColor,
                fontFamily: 'sftr',
              ),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                itemSize: 25,
                direction: Axis.horizontal,
                allowHalfRating: true,
                unratedColor: Color(0xffF8F7F7),
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Container(
                  height: 5,
                  width: 5,
                  child: Image.asset(
                    "lib/assets/icons/staricon.png",
                    scale: 10.5,
                    color: Color(0xffF47920),
                    height: 5,
                  ),
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              VariableText(
                text: getTranslated(context, "Social"),
                fontsize: 17,
                fontcolor: textColor,
                fontFamily: 'sftr',
              ),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                itemSize: 25,
                direction: Axis.horizontal,
                allowHalfRating: true,
                unratedColor: Color(0xffF8F7F7),
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Container(
                  height: 5,
                  width: 5,
                  child: Image.asset(
                    "lib/assets/icons/staricon.png",
                    scale: 10.5,
                    color: Color(0xffF47920),
                    height: 5,
                  ),
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: CustomButton(
                    buttonHeight: 50,
                    buttonBorderRadius: 8,
                    buttonFontSize: cHeight * 0.025,
                    buttonColor: themeColor1,
                    buttonTextColor: themeColor2,
                    buttonText: getTranslated(context, "Save"),
                    buttonFontFamily: 'sfdm',
                    buttonOnTap: () {
                      _scrollController.animateTo(0.0,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.fastLinearToSlowEaseIn);
                      Fluttertoast.showToast(
                          msg: "Saved",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 3,
                          backgroundColor: Color(0xFF00AEEf),
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget renderTab4(var cHeight, var cWidth) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: RectangluartextFeild(
            //cont: _nameController,
            heights: 60,
            widths: cWidth,

            maxLines: 1,
            hinttext: getTranslated(context, "Previous Owner Name"),
            keytype: TextInputType.text,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: RectangluartextFeild(
            //cont: _nameController,
            heights: 60,
            widths: cWidth,
            maxLines: 1,
            hinttext: getTranslated(context, "Previous Owner Telephone"),
            keytype: TextInputType.number,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: RectangluartextFeild(
            //cont: _nameController,
            heights: 60,
            widths: cWidth,

            maxLines: 1,
            hinttext: getTranslated(context, "Vet Clinic Name"),
            keytype: TextInputType.text,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: RectangluartextFeild(
            //cont: _nameController,
            heights: 60,
            widths: cWidth,
            maxLines: 1,
            hinttext: getTranslated(context, "Vet Clinic Telephone"),
            keytype: TextInputType.number,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: CustomButton(
                    buttonHeight: 50,
                    buttonBorderRadius: 8,
                    buttonFontSize: cHeight * 0.025,
                    buttonColor: themeColor1,
                    buttonTextColor: themeColor2,
                    buttonText: getTranslated(context, "Save"),
                    buttonFontFamily: 'sfdm',
                    buttonOnTap: () {
                      _scrollController.animateTo(0.0,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.fastLinearToSlowEaseIn);
                      Fluttertoast.showToast(
                          msg: "Saved",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 3,
                          backgroundColor: Color(0xFF00AEEf),
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget renderTab5(var cHeight, var cWidth) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VariableText(
                text: getTranslated(context, "Passport Documents"),
                fontsize: 17,
                fontcolor: textColor,
                fontFamily: 'sftr',
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                      height: cHeight * 0.14,
                      width: cWidth,
                      decoration: BoxDecoration(
                        color: Color(0xffF5F8FA),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: InkWell(
                        onTap: () {
                          AwesomeDialog(
                            context: context,
                            animType: AnimType.SCALE,
                            dialogType: DialogType.NO_HEADER,
                            body: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      VariableText(
                                        text: getTranslated(context, 'Choose Type:'),
                                        fontsize: 17,
                                        fontcolor: textColor,
                                        fontFamily: 'sftr',
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: CustomButton(
                                        buttonHeight: cHeight * 0.04,
                                        buttonWidth: cWidth * 0.50,
                                        buttonBorderRadius: 12,
                                        buttonFontSize: cHeight * 0.021,
                                        buttonColor: themeColor1,
                                        buttonTextColor: themeColor2,
                                        buttonText: getTranslated(context, "Picture"),
                                        buttonFontFamily: 'sfdm',
                                        buttonOnTap: () {
                                          Navigator.pop(context);
                                          _imgFromGalleryPass(passportCommonList);
                                        }),
                                  ),
                                  CustomButton(
                                      buttonHeight: cHeight * 0.04,
                                      buttonWidth: cWidth * 0.50,
                                      buttonBorderRadius: 12,
                                      buttonFontSize: cHeight * 0.021,
                                      buttonColor: themeColor1,
                                      buttonTextColor: themeColor2,
                                      buttonText: getTranslated(context, "Document"),
                                      buttonFontFamily: 'sfdm',
                                      buttonOnTap: () {
                                        Navigator.pop(context);
                                        _fileFromDevice(passportCommonList);
                                      }),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: CustomButton(
                                        buttonHeight: cHeight * 0.04,
                                        buttonWidth: cWidth * 0.50,
                                        buttonBorderRadius: 12,
                                        buttonFontSize: cHeight * 0.021,
                                        buttonColor: Colors.red,
                                        buttonTextColor: themeColor2,
                                        buttonText: getTranslated(context, "Cancel"),
                                        buttonFontFamily: 'sfdm',
                                        buttonOnTap: () {
                                          Navigator.pop(context);
                                        }),
                                  ),
                                ],
                              ),
                            ),
                            //btnCancelOnPress: (){}
                          )..show();
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "lib/assets/icons/cameraicon.png",
                              scale: cHeight * 0.003,
                            ),
                            SizedBox(
                              height: cHeight * 0.0055,
                            ),
                            VariableText(
                              text: getTranslated(context, "Add Media"),
                              fontsize: cHeight * 0.015,
                              fontFamily: 'sftr',
                              fontcolor: Color(
                                0x6c3C3C43,
                              ),
                            ),
                          ],
                        ),
                      )),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VariableText(
                text: getTranslated(context, "Medical Book"),
                fontsize: 17,
                fontcolor: textColor,
                fontFamily: 'sftr',
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: cHeight * 0.14,
                  width: cWidth,
                  decoration: BoxDecoration(
                    color: Color(0xffF5F8FA),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: InkWell(
                    onTap: () {
                      //_imgFromGalleryPass(passportImages);
                      //_fileFromDevice(pickedFile);
                      AwesomeDialog(
                        context: context,
                        animType: AnimType.SCALE,
                        dialogType: DialogType.NO_HEADER,
                        body: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  VariableText(
                                    text: getTranslated(context, 'Choose Type:'),
                                    fontsize: 17,
                                    fontcolor: textColor,
                                    fontFamily: 'sftr',
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: CustomButton(
                                    buttonHeight: cHeight * 0.04,
                                    buttonWidth: cWidth * 0.50,
                                    buttonBorderRadius: 12,
                                    buttonFontSize: cHeight * 0.021,
                                    buttonColor: themeColor1,
                                    buttonTextColor: themeColor2,
                                    buttonText: getTranslated(context, "Picture"),
                                    buttonFontFamily: 'sfdm',
                                    buttonOnTap: () {
                                      Navigator.pop(context);
                                      _imgFromGalleryPass(medicalCommonList);
                                    }),
                              ),
                              CustomButton(
                                  buttonHeight: cHeight * 0.04,
                                  buttonWidth: cWidth * 0.50,
                                  buttonBorderRadius: 12,
                                  buttonFontSize: cHeight * 0.021,
                                  buttonColor: themeColor1,
                                  buttonTextColor: themeColor2,
                                  buttonText: getTranslated(context, "Document"),
                                  buttonFontFamily: 'sfdm',
                                  buttonOnTap: () {
                                    Navigator.pop(context);
                                    _fileFromDevice(medicalCommonList);
                                  }),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: CustomButton(
                                    buttonHeight: cHeight * 0.04,
                                    buttonWidth: cWidth * 0.50,
                                    buttonBorderRadius: 12,
                                    buttonFontSize: cHeight * 0.021,
                                    buttonColor: Colors.red,
                                    buttonTextColor: themeColor2,
                                    buttonText: getTranslated(context, "Cancel"),
                                    buttonFontFamily: 'sfdm',
                                    buttonOnTap: () {
                                      Navigator.pop(context);
                                    }),
                              ),
                            ],
                          ),
                        ),
                        //btnCancelOnPress: (){}
                      )..show();
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "lib/assets/icons/cameraicon.png",
                          scale: cHeight * 0.003,
                        ),
                        SizedBox(
                          height: cHeight * 0.0055,
                        ),
                        VariableText(
                          text: getTranslated(context, "Add Media"),
                          fontsize: cHeight * 0.015,
                          fontFamily: 'sftr',
                          fontcolor: Color(
                            0x6c3C3C43,
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
        //SizedBox(height: cWidth*0.05,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: CustomButton(
                    buttonHeight: 50,
                    buttonBorderRadius: 8,
                    buttonFontSize: cHeight * 0.025,
                    buttonColor: themeColor1,
                    buttonTextColor: themeColor2,
                    buttonText: getTranslated(context, "Save"),
                    buttonFontFamily: 'sfdm',
                    buttonOnTap: () {
                      _scrollController.animateTo(0.0,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.fastLinearToSlowEaseIn);
                      Fluttertoast.showToast(
                          msg: "Saved",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 3,
                          backgroundColor: Color(0xFF00AEEf),
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ImageDialog extends StatelessWidget {
  var imagePath;
  var height;
  var width;

  ImageDialog({this.imagePath, this.height, this.width});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Wrap(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: height * 0.57,
              //width: height * 0.35,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: ExactAssetImage(imagePath.toString()),
                      fit: BoxFit.fitHeight)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: height * 0.05,
              width: width * 0.80,
              color: Colors.redAccent,
              child: Center(
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class selectPetTypeClass extends StatefulWidget {
  final double height, width;

  Function onSelect;
  selectPetTypeClass({this.height, this.width, this.onSelect});

  @override
  _selectPetTypeClassState createState() => _selectPetTypeClassState();
}

class _selectPetTypeClassState extends State<selectPetTypeClass> {
  int defaultindex = -1;
  String selectedPetType;

  List<Map<String, dynamic>> pets = [
    {"name": "Camel", "image": "lib/assets/icons/camelicon.png"},
    {"name": "CAT", "image": "lib/assets/icons/caticon.png"},
    {"name": "DOG", "image": "lib/assets/icons/dogicon.png"},
    {"name": "RABBIT", "image": "lib/assets/icons/rabbiticon.png"},
    {"name": "HORSE", "image": "lib/assets/icons/horseicon.png"},
    {"name": "BIRD", "image": "lib/assets/icons/parroticon.png"},
    {"name": "Camel", "image": "lib/assets/icons/camelicon.png"},
    {"name": "CAT", "image": "lib/assets/icons/caticon.png"},
    {"name": "DOG", "image": "lib/assets/icons/dogicon.png"},
    {"name": "RABBIT", "image": "lib/assets/icons/rabbiticon.png"},
    {"name": "HORSE", "image": "lib/assets/icons/horseicon.png"},
    {"name": "BIRD", "image": "lib/assets/icons/parroticon.png"},
  ];
  final TextEditingController _controller = new TextEditingController();
  List<dynamic> _list;
  bool _isSearching;
  List<dynamic> searchresult = new List();
  bool startsearching;
  @override
  void initState() {
    super.initState();
    startsearching = false;
    _isSearching = false;
    values();
  }

  void values() {
    _list = List();
    _list.add(["BIRD", "lib/assets/icons/parroticon.png"]);
    _list.add(["Camel", "lib/assets/icons/camelicon.png"]);
    _list.add(["CAT", "lib/assets/icons/caticon.png"]);
    _list.add(["DOG", "lib/assets/icons/dogicon.png"]);
    _list.add(["RABBIT", "lib/assets/icons/rabbiticon.png"]);
    _list.add(["HORSE", "lib/assets/icons/horseicon.png"]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(widget.height * 0.05),
            topRight: Radius.circular(widget.height * 0.05)),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: widget.height * 0.03,
            ),
            VariableText(
              text: "Select A Type",
              fontsize: widget.height * 0.028,
              fontcolor: Color(0xff2B3E4F),
              fontFamily: 'sfdr',
            ),
            SizedBox(
              height: widget.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: RectangluartextFeildWithStartIcon(
                      heights: widget.height * 0.07,
                      fontsize: widget.height * 0.019,
                      hinttext: "Search",
                      imageIconPath: "lib/assets/icons/searchIcon.png",
                      keytype: TextInputType.text,
                      cont: _controller,
                      onChanged: searchOperation,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: widget.height * 0.02,
            ),
            Container(
              height: widget.height * 0.44,
              //color: Colors.red,
              child: searchresult.length != 0 || _controller.text.isNotEmpty
                  ? new ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: searchresult.length,
                      itemBuilder: (BuildContext context, int index) {
                        return new InkWell(
                          onTap: () {
                            setState(() {
                              defaultindex = index;
                              selectedPetType = searchresult[defaultindex][0];
                            });
                            print("selected type" + selectedPetType);
                          },
                          child: Container(
                            color: defaultindex == index
                                ? themeColor1
                                : themeColor2,
                            child: ListTile(
                              title: VariableText(
                                text: searchresult[index][0],
                                fontsize: widget.height * 0.017,
                                fontcolor: defaultindex == index
                                    ? themeColor2
                                    : Color(0xff2B3E4F),
                                weight: FontWeight.normal,
                                fontFamily: 'sftr',
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : ListView.builder(
                      physics: NeverScrollableScrollPhysics(),

                      ///
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: pets.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              defaultindex = index;
                              selectedPetType = pets[defaultindex]['name'];
                            });
                            print("selected type" + selectedPetType);
                          },
                          child: Container(
                            color: defaultindex == index
                                ? themeColor1
                                : themeColor2,
                            child: ListTile(
                              title: VariableText(
                                text: pets[index]['name'],
                                fontsize: widget.height * 0.017,
                                fontcolor: defaultindex == index
                                    ? themeColor2
                                    : Color(0xff2B3E4F),
                                weight: FontWeight.normal,
                                fontFamily: 'sftr',
                              ),
                            ),
                          ),
                        );
                      }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      buttonHeight: widget.height * 0.06,
                      buttonBorderRadius: 8,
                      buttonFontSize: widget.height * 0.025,
                      buttonColor: themeColor1,
                      buttonTextColor: themeColor2,
                      buttonText: "Select",
                      buttonFontFamily: 'sfdm',
                      buttonOnTap: () => widget.onSelect(selectedPetType),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: widget.width * 0.07,
            ),
          ],
        ),
      ),
    );
  }

  void searchOperation(String searchText) {
    setState(() {
      startsearching = true;
    });

    searchresult.clear();
    if (_isSearching != null) {
      for (int i = 0; i < _list.length; i++) {
        String data = _list[i][0];
        print("data " + data);
        if (data.toLowerCase().contains(searchText.toLowerCase())) {
          searchresult.addAll([_list[i]]);

          setState(() {});
        }
      }
    }
  }
}

class SearchBreed extends StatefulWidget {
  final double height, width;
  final bool landscapOrientation;
  Function onselected;
  SearchBreed(
      {this.height, this.width, this.landscapOrientation, this.onselected});

  @override
  _SearchBreedState createState() => _SearchBreedState();
}

class _SearchBreedState extends State<SearchBreed> {
  List<Map<String, dynamic>> breedType = [
    {
      "name": "Terry Alvarado",
    },
    {
      "name": "Carmen Marshall",
    },
    {
      "name": "Steve Wells",
    },
    {
      "name": "Dennis Lynch",
    },
    {
      "name": "Richard Reyes",
    },
    {
      "name": "Sara Mccoy",
    },
  ];
  int defaultindex = -1;
  String selectedBreedType;
  final TextEditingController _controller = new TextEditingController();
  List<dynamic> _list;
  bool _isSearching;
  List<dynamic> searchresult = new List();
  bool startsearching;
  @override
  void initState() {
    super.initState();
    startsearching = false;
    _isSearching = false;
    values();
  }

  void values() {
    _list = List();
    _list.add(["Terry Alvarado"]);
    _list.add(["Carmen Marshall"]);
    _list.add([
      "Steve Wells",
    ]);
    _list.add([
      "Dennis Lynch",
    ]);
    _list.add([
      "Richard Reyes",
    ]);
    _list.add([
      "Sara Mccoy",
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(widget.height * 0.05),
            topRight: Radius.circular(widget.height * 0.05)),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: widget.height * 0.02,
            ),
            VariableText(
              text: getTranslated(context, "Select Breed"),
              fontsize: widget.height * 0.028,
              fontcolor: Color(0xff2B3E4F),
              fontFamily: 'sfdr',
            ),
            SizedBox(
              height: widget.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: RectangluartextFeildWithStartIcon(
                      heights: widget.height * 0.07,
                      fontsize: widget.height * 0.019,
                      hinttext: getTranslated(context, "Search"),
                      imageIconPath: "lib/assets/icons/searchIcon.png",
                      keytype: TextInputType.text,
                      onChanged: searchOperation,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: widget.height * 0.02,
            ),
            Container(
              height: widget.height * 0.44,
              //color: Colors.red,
              child: searchresult.length != 0 || _controller.text.isNotEmpty
                  ? new ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: searchresult.length,
                      itemBuilder: (BuildContext context, int index) {
                        return new InkWell(
                          onTap: () {
                            setState(() {
                              defaultindex = index;
                              selectedBreedType = searchresult[defaultindex][0];
                            });
                            print("selected type" + selectedBreedType);
                          },
                          child: Container(
                            color: defaultindex == index
                                ? themeColor1
                                : themeColor2,
                            child: ListTile(
                              title: Padding(
                                padding:
                                    EdgeInsets.only(left: widget.height * 0.02),
                                child: VariableText(
                                  text: searchresult[index][0],
                                  fontsize: widget.height * 0.017,
                                  fontcolor: defaultindex == index
                                      ? themeColor2
                                      : Color(0xff2B3E4F),
                                  weight: FontWeight.normal,
                                  fontFamily: 'sftr',
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : ListView.builder(
                      // controller: scrollController,
                      physics: NeverScrollableScrollPhysics(),

                      ///
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: breedType.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              defaultindex = index;
                              selectedBreedType =
                                  breedType[defaultindex]['name'];
                            });
                          },
                          //print("selected type"+selectedPetType);

                          child: Container(
                            color: defaultindex == index
                                ? themeColor1
                                : themeColor2,
                            child: ListTile(
                              title: Padding(
                                padding:
                                    EdgeInsets.only(left: widget.height * 0.02),
                                child: VariableText(
                                  text: breedType[index]['name'],
                                  fontsize: widget.height * 0.017,
                                  fontcolor: defaultindex == index
                                      ? themeColor2
                                      : Color(0xff2B3E4F),
                                  weight: FontWeight.normal,
                                  fontFamily: 'sftr',
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: CustomButton(
                        buttonHeight: widget.height * 0.06,
                        buttonBorderRadius: 8,
                        buttonFontSize: widget.height * 0.025,
                        buttonColor: themeColor1,
                        buttonTextColor: themeColor2,
                        buttonText: getTranslated(context, "Select"),
                        buttonFontFamily: 'sfdm',
                        buttonOnTap: () {
                          widget.onselected(selectedBreedType);
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void searchOperation(String searchText) {
    searchresult.clear();
    if (_isSearching != null) {
      for (int i = 0; i < _list.length; i++) {
        String data = _list[i][0];
        print("data " + data);
        if (data.toLowerCase().contains(searchText.toLowerCase())) {
          searchresult.addAll([_list[i]]);

          setState(() {});
        }
      }
    }
  }
}

class selectCountryTypeClass extends StatefulWidget {
  final double height, width;

  Function onSelect;
  selectCountryTypeClass({this.height, this.width, this.onSelect});

  @override
  _selectCountryTypeClassState createState() => _selectCountryTypeClassState();
}

class _selectCountryTypeClassState extends State<selectCountryTypeClass> {
  int defaultindex = -1;
  String selectedcityType;

  List<Map<String, dynamic>> citiesJson = [
    {
      "image": "lib/assets/icons/egypt.png",
      "code": "EGPYT",
    },
    {
      "image": "lib/assets/icons/united-arab-emirates.png",
      "code": "United-Arab-Emirates",
    },
    {
      "image": "lib/assets/icons/egypt.png",
      "code": "EGPYT",
    },
    {
      "image": "lib/assets/icons/united-arab-emirates.png",
      "code": "United-Arab-Emirates",
    },
    {
      "image": "lib/assets/icons/egypt.png",
      "code": "EGPYT",
    },
    {
      "image": "lib/assets/icons/united-arab-emirates.png",
      "code": "United-Arab-Emirates",
    },
    {
      "image": "lib/assets/icons/egypt.png",
      "code": "EGPYT",
    },
    {
      "image": "lib/assets/icons/united-arab-emirates.png",
      "code": "United-Arab-Emirates",
    },
    {
      "image": "lib/assets/icons/egypt.png",
      "code": "EGPYT",
    },
    {
      "image": "lib/assets/icons/united-arab-emirates.png",
      "code": "United-Arab-Emirates",
    },
    {
      "image": "lib/assets/icons/egypt.png",
      "code": "EGPYT",
    },
    {
      "image": "lib/assets/icons/united-arab-emirates.png",
      "code": "United-Arab-Emirates",
    }
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(widget.height * 0.05),
            topRight: Radius.circular(widget.height * 0.05)),
      ),
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: widget.height * 0.03,
            ),
            VariableText(
              text: getTranslated(context, "Select A Country"),
              fontsize: widget.height * 0.028,
              fontcolor: Color(0xff2B3E4F),
              fontFamily: 'sfdr',
            ),
            SizedBox(
              height: widget.height * 0.02,
            ),
            Container(
              height: widget.height * 0.54,
              child: ListView.builder(
                  //physics: NeverScrollableScrollPhysics(), ///
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: citiesJson.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          defaultindex = index;
                          selectedcityType = citiesJson[defaultindex]['code'];
                        });
                        print("selected type" + selectedcityType);
                      },
                      child: Container(
                        color:
                            defaultindex == index ? themeColor1 : themeColor2,
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: widget.height * 0.02,
                            backgroundImage:
                                AssetImage(citiesJson[index]['image']),
                            //  AssetImage("lib/assets/icons/changeorientation.png"),
                            backgroundColor: Color(0xffEAF0F9),
                          ),
                          title: VariableText(
                            text: citiesJson[index]['code'],
                            fontsize: widget.height * 0.017,
                            fontcolor: defaultindex == index
                                ? themeColor2
                                : Color(0xff2B3E4F),
                            weight: FontWeight.normal,
                            fontFamily: 'sftr',
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      buttonHeight: widget.height * 0.06,
                      buttonBorderRadius: 8,
                      buttonFontSize: widget.height * 0.025,
                      buttonColor: themeColor1,
                      buttonTextColor: themeColor2,
                      buttonText: getTranslated(context, "Select"),
                      buttonFontFamily: 'sfdm',
                      buttonOnTap: () => widget.onSelect(selectedcityType),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FullScreenPage extends StatefulWidget {
  FullScreenPage({
    this.child,
    this.dark,
    this.onDelete
  });

  final Image child;
  final bool dark;
  final Function onDelete;

  @override
  _FullScreenPageState createState() => _FullScreenPageState();
}

class _FullScreenPageState extends State<FullScreenPage> {
  @override
  void initState() {
    var brightness = widget.dark ? Brightness.light : Brightness.dark;
    var color = widget.dark ? Colors.black12 : Colors.white70;

    /*SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: color,
      statusBarColor: color,
      statusBarBrightness: brightness,
      statusBarIconBrightness: brightness,
      systemNavigationBarDividerColor: color,
      systemNavigationBarIconBrightness: brightness,
    ));*/
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        // Restore your settings here...
        ));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: widget.dark ? Colors.black : Colors.white,
        body: Stack(
          children: [
            Stack(
              children: [
                AnimatedPositioned(
                  duration: Duration(milliseconds: 333),
                  curve: Curves.fastOutSlowIn,
                  top: 0,
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: InteractiveViewer(
                    panEnabled: true,
                    minScale: 0.5,
                    maxScale: 4,
                    child: widget.child,
                  ),
                ),
              ],
            ),
            SafeArea(
              child: Align(
                alignment: Alignment.topLeft,
                child: MaterialButton(
                  padding: const EdgeInsets.all(15),
                  elevation: 0,
                  child:
                      currLang == 'ar' ?
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(math.pi),

                    child: Icon(
                      Icons.arrow_back,
                      color: widget.dark ? Colors.white : Colors.black,
                      size: 25,
                    ),
                  ) :
                      Icon(
                        Icons.arrow_back,
                        color: widget.dark ? Colors.white : Colors.black,
                        size: 25,
                      ),
                  color: widget.dark ? Colors.black12 : Colors.white70,
                  highlightElevation: 0,
                  minWidth: double.minPositive,
                  height: double.minPositive,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ),
            SafeArea(
              child: Align(
                alignment: Alignment.topRight,
                child: MaterialButton(
                  padding: const EdgeInsets.all(15),
                  elevation: 0,
                  child: Icon(
                    Icons.delete,
                    color: widget.dark ? Colors.white : Colors.black,
                    size: 25,
                  ),
                  color: widget.dark ? Colors.black12 : Colors.white70,
                  highlightElevation: 0,
                  minWidth: double.minPositive,
                  height: double.minPositive,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  onPressed: (){
                    widget.onDelete();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
