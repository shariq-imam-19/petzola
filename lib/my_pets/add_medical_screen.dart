import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:petzola/common/commons.dart';
import 'package:petzola/common/common_z.dart';
import 'package:petzola/common/global_variables.dart';
import 'package:petzola/localization/language_constants.dart';
import 'dart:math' as math;

class AddMedical extends StatefulWidget {
  var petDetails;
  var cHeight;
  var cWidth;

  AddMedical({this.petDetails, this.cHeight, this.cWidth});

  @override
  _AddMedicalState createState() => _AddMedicalState();
}

class _AddMedicalState extends State<AddMedical> {
  TextEditingController _selectMedicalTypeController = new TextEditingController();
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  DateTime selectedDate;

  bool showAdditional = true;

  String selectedMedicalTypeName;

  List<String> medicalTypes = [
    'Number Resuilt',
    'Genetic Tests',
    'Medical Condition ',
    'Allergies',
    'Lap Result',

  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    switch (MediaQuery.of(context).orientation) {
      case Orientation.landscape:
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: renderAppbar(),
            body: SingleChildScrollView(
                child: renderBody(size.width, size.width)),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: InkWell(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: size.width * 0.06,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: VariableText(
                          text: getTranslated(context, 'Save Medical'),
                          fontsize: 18,
                          fontcolor: Colors.white,
                          fontFamily: 'sftr')),
                ),
              ),
            )
        );
      case Orientation.portrait:
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: renderAppbar(),
          body: SingleChildScrollView(
              child: renderBody(size.height, size.width)
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: InkWell(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Container(
                height: size.width * 0.13 /*0.07*/,
                width: size.width,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: VariableText(
                        text: getTranslated(context, 'Save Medical'),
                        fontsize: 20,
                        fontcolor: Colors.white,
                        fontFamily: 'sfdm')),
              ),
            ),
          ),
        );
    }
  }

  Widget renderBody(double height, double width) {
    return Column(
      children: [
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: InkWell(
            onTap: () {
              selectVaccines(height, width);
            },
            child: RectangluartextFeildWithIcon(
              heights: 60,
              widths: width,
              enable: false,
              cont: _selectMedicalTypeController,
              imageIconPath: 'lib/assets/icons/dropdownicon.png',
              hinttext: selectedMedicalTypeName == null ? getTranslated(context, 'Type') : selectedMedicalTypeName,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: RectangluartextFeild(
            heights: 60,
            enable: false,
            widths: width,
            maxLines: 1,
            hinttext: getTranslated(context, 'Title'),
            keytype:TextInputType.text ,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: InkWell(
            onTap: () {
              _selectDate(context);
            },
            child: RectangluartextFeildWithIcon(
              heights: 60,
              widths: width,
              enable: false,
              imageIconPath: 'lib/assets/icons/myPets_tab3.png',
              hinttext: selectedDate != null
                  ? dateFormat.format(selectedDate)
                  : getTranslated(context, 'Date'),
            ),
          ),
        ),

        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: VariableText(
                text: getTranslated(context, 'Additional Information'),
                fontcolor: Color(0xFF2B3E4F),
                fontsize: 20,
                fontFamily: 'sftr',
              ),
            ),
            InkWell(
                onTap: (){
                  if(showAdditional == true){
                    setState(() {
                      showAdditional = false;
                    });
                  }else{
                    setState(() {
                      showAdditional = true;
                    });
                  }
                },
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Color(0xFFF8F9FA),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: showAdditional == true ? Image.asset('lib/assets/icons/vaccination_minus.png', scale: 3.2):
                      Icon(Icons.add, size: 24,),
                    )
                )
            )
          ],
        ),
        showAdditional ?
        DelayedDisplay(
          slidingCurve: Curves.fastLinearToSlowEaseIn,
          delay: Duration(milliseconds: 100),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: RectangluartextFeild(
                  heights: height * 0.14,
                  widths: width,
                  maxLines: 4,
                  hinttext: getTranslated(context, 'Note'),
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Container(
                    height: height * 0.23,
                    width: width,
                    decoration: BoxDecoration(
                        color: Color(0xFFF5F8FA),
                        border: Border.all(color: Color(0x60E8E8E8)),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'lib/assets/icons/vaccination_camera.png',
                          scale: 2.5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: VariableText(
                            text: getTranslated(context, 'Add Media'),
                            fontcolor: Color(0x603C3C43),
                            fontsize: 11,
                            fontFamily: 'sftr',
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ): Container(),

      ],
    );
  }

  selectVaccines(double height, double width) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return DraggableScrollableSheet(
              initialChildSize: MediaQuery.of(context).orientation == Orientation.portrait ? 0.60 : 0.80, //set this as you want
              maxChildSize: 0.85, //set this as you want
              minChildSize: 0.35, //set this as you want
              expand: false,
              builder: (context, scrollController) {
                return SelectMedicalSheet(
                  medicalType: medicalTypes,
                  cHeight: height * 0.80,
                  cWidth: width,
                  onSelect: (String name) {
                    Navigator.of(context).pop();
                    setState(() {
                      selectedMedicalTypeName = name;
                    });
                  },
                );
                //whatever you're returning, does not have to be a Container
              });
        });
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Widget renderAppbar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      titleSpacing: 0,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'lib/assets/icons/myPets_tab4.png',
            scale: 3.5,
          ),
          VariableText(
            text: widget.petDetails['name'],
            fontcolor: Color(0xFF2C3E50),
            fontsize: 17,
            fontFamily: 'sftsb',
          ),
        ],
      ),
      leading:
          currLang == 'ar' ?
      Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(math.pi),
        child: IconButton(
          icon: Image.asset(
            'lib/assets/icons/appbar_back.png',
            scale: 2.5,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ) :
          IconButton(
            icon: Image.asset(
              'lib/assets/icons/appbar_back.png',
              scale: 2.5,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
      actions: [
        InkWell(
          onTap: () {},
          child: SizedBox(
            width: 25,
            //margin: EdgeInsets.all(11),
            //padding: EdgeInsets.all(9),
            child: Image.asset(
              "lib/assets/icons/notification2x.png",
              scale: 2.0,
            ),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        InkWell(
          onTap: () {},
          child: SizedBox(
            width: 25,
            //margin: EdgeInsets.all(11),
            //padding: EdgeInsets.all(9),
            child: Image.asset(
              "lib/assets/icons/chat2x.png",
              scale: 2.0,
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
