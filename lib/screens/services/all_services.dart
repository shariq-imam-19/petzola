import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petzola/common/common_z.dart';
import 'package:petzola/common/commons.dart';
import 'package:petzola/localization/language_constants.dart';
import 'package:petzola/screens/services/select_service_screen.dart';

class AllServices extends StatefulWidget {
  List serviceList;

  AllServices({this.serviceList});

  @override
  _AllServicesState createState() => _AllServicesState();
}

class _AllServicesState extends State<AllServices> {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    switch (MediaQuery.of(context).orientation) {
      case Orientation.landscape:
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: CustomMenuAppBar(size: size.width,title: "My Pets",),
          ),
          body: SingleChildScrollView(
              child: Column(
            children: [
              renderSearchBar(size.width, size.width),
              renderServicesGrid(size.width, size.width)
            ],
          )),
        );
      case Orientation.portrait:
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: CustomMenuAppBar(size: size.height,title: "My Pets",),
          ),//renderAppbar(),
          body: SingleChildScrollView(
              child: Column(
               children: [
              renderSearchBar(size.height, size.width),
              DelayedDisplay(
                  slidingCurve: Curves.fastLinearToSlowEaseIn,
                  delay: Duration(milliseconds: 100),
                  child: renderServicesGrid(size.height, size.width))
            ],
          )),
        );
    }
  }

  Widget renderAppbar(){
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      titleSpacing: 0,
      centerTitle: true,
      leadingWidth: 65,
      title: VariableText(text: getTranslated(context, 'My Pets'), fontcolor: Color(0xFF2C3E50), fontsize: 17, fontFamily: 'sftsb',),
      leading: Container(
        margin: EdgeInsets.only(left: 8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xFFEAF0F9),
                borderRadius: BorderRadius.circular(60)
            ),
            child: IconButton(icon: Image.asset('lib/assets/icons/appbar_back.png', scale: 3.2,),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
      ),
      actions: [
        InkWell(
          onTap: (){},
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
        SizedBox(width: 16,),
      ],
    );
  }

  Widget renderSearchBar(var height, var width){
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: height * 0.03),
      child: TextFieldWithStartIcon(
        heights: height * 0.07,
        widths: width,
        fontsize: height * 0.017,
        hinttext: getTranslated(context, "Service Name"),
        imageIconPath: "lib/assets/icons/searchIcon.png",
        keytype: TextInputType.text,
      ),
    );
  }

  Widget renderServicesGrid(var height, var width){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: height * 0.03),
      child: Wrap(
        children: List.generate(widget.serviceList.length, (index){
          return Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 20, left: 5, right: 5),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>SelectServiceScreen()));
                //selectSubService(context, height, width);
              },
              child: Container(
                height: height * 0.17,
                width: width * 0.28,
                //color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        //height: height * 0.15,
                        width:  width * 0.28,
                        margin: EdgeInsets.symmetric(horizontal: 3),
                        decoration: BoxDecoration(
                            color: Color(0x5000AEEF),
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.asset(
                          widget.serviceList[index]['image'],
                          scale: 2.8,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 6),
                      child: VariableText(
                        text: widget.serviceList[index]['name'],
                        fontsize: height * 0.015,
                        fontcolor: Color(0xFF2C3E50),
                      ),
                    ),
                  ],
                )
                ),
            ),
            );

        }),
      )
    );
  }

  selectSubService(BuildContext context, double height,double width){
    showModalBottomSheet<dynamic>(
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        context: context,
        builder: (BuildContext context) {
          return SubServiceSheet(cHeight: height, cWidth: width, onNext: (){Navigator.of(context).pop();selectPetType(context, height, width);});
    });
  }

  selectPetType(BuildContext context, double height,double width){
    showModalBottomSheet<dynamic>(
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        context: context,
        builder: (BuildContext context) {
          return PetTypeSheet(height: height, width: width, onNext: (){Navigator.of(context).pop();selectConsolationType(context, height, width);});
        });
  }
  selectConsolationType(BuildContext context, double height,double width){
    showModalBottomSheet<dynamic>(
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        context: context,
        builder: (BuildContext context) {
          return ConsolationTypeSheet(height: height, width: width, onNext: (){Navigator.of(context).pop();});
        });
  }
}
