import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:petzola/common/commons.dart';
import 'package:petzola/common/common_z.dart';

class AddMedicalLabResult extends StatefulWidget {




  @override
  _AddMedicalLabResultState createState() => _AddMedicalLabResultState();
}

class _AddMedicalLabResultState extends State<AddMedicalLabResult> {
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  DateTime selectedDate;




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
                          text: 'Save Lab Result',
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
                        text: 'Save Lab Result',
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

            },
            child: RectangluartextFeildWithIcon(
              heights: 60,
              widths: width,
              enable: false,
              imageIconPath: 'lib/assets/icons/dropdownicon.png',
              hinttext: 'Test Name',
            ),
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
                  : 'Date',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: InkWell(
            onTap: () {

            },
            child: RectangluartextFeildWithIcon(
              heights: 60,
              widths: width,
              enable: false,
              imageIconPath: 'lib/assets/icons/dropdownicon.png',
              hinttext: 'Result',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: RectangluartextFeild(
            heights: height * 0.14,
            widths: width,
            maxLines: 4,
            hinttext: 'Note',
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
                      text: 'Add Media',
                      fontcolor: Color(0x603C3C43),
                      fontsize: 11,
                      fontFamily: 'sftr',
                    ),
                  ),
                ],
              ),
            )),



        SizedBox(height: 10),



      ],
    );
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
      title:      VariableText(
        text: "My Pets",
        fontcolor: Color(0xFF2C3E50),
        fontsize: 17,
        fontFamily: 'sftsb',
      ),
      leading: IconButton(
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
