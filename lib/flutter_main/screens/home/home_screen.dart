import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petzola/flutter_main/common/res/dimen_const.dart';
import 'package:petzola/flutter_main/common/widgets/app_bar/petzola_app_bar_view.dart';
import 'package:petzola/flutter_main/screens/home/my_clicics/my_clinics_slide_view.dart';
import 'package:petzola/flutter_main/screens/home/my_pet_slider/my_pet_slide_view.dart';
import 'package:petzola/flutter_main/screens/home/services/services_slider_view.dart';
import 'package:petzola/flutter_main/screens/home/up_comming_slider/up_comming_slide_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    print("Home Build Called");
    return Scaffold(
      appBar: petZolaAppBarView(context),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(Dimen.inner_boundary_field_space),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              UpComingSlideView(),
              MyPetSlideView(),
              MyClinicsSlideView(),
              ServicesSliderView(),
            ],
          ),
        ),
      ),
    );
  }
}
