import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petzola/common/commons.dart';

import 'package:petzola/common/commons.dart';
import 'package:petzola/common/common_z.dart';
import 'package:petzola/common/style.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Map<String, dynamic> services = {'services': [
    {
      "name": "Grooming",
      "image": "lib/assets/images/service_grooming.png"
    },
    {
      "name": "Day-Care",
      "image": "lib/assets/images/service_daycare.png"
    },
    {
      "name": "Pet Taxi",
      "image": "lib/assets/images/service_pettaxi.png"
    },
    {
      "name": "Training",
      "image": "lib/assets/images/service_training.png"
    },
    {
      "name": "Dental",
      "image": "lib/assets/images/service_dental.png"
    },
    {
      "name": "Training",
      "image": "lib/assets/images/service_training.png"
    }
  ]};

  Map<String, dynamic> findVets = {'vets': [
    {
      "name": "General\nConsultation",
      "image": "lib/assets/images/myVet_1.png"
    },
    {
      "name": "Vaccination",
      "image": "lib/assets/images/myVet_2.png"
    }
  ]};

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    switch (MediaQuery.of(context).orientation) {
      case Orientation.landscape:
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 18),
              HomeSliderSpecialOffer(title: "Special Offers", subTitle: '(1/7)',
                  cWidth: size.width, cHeight: size.width * 0.27),
              SizedBox(height: 15),
              HomeUpcomingAppointments(title: "Upcoming Schedule",
                  subTitle: '',
                  cWidth: size.width,
                  cHeight: size.width),
              SizedBox(height: 18),
              HomeSliderService(serviceList: services['services'],
                  title: "Pick Your Service",
                  subTitle: 'See All',
                  cWidth: size.width,
                  cHeight: size.width * 0.30),
              SizedBox(height: 18),
              HomeSliderMyPets(title: "My Pets",
                  subTitle: '',
                  cWidth: size.width,
                  cHeight: size.height * 0.70),
              SizedBox(height: 18),
              HomeFindVet(myVets:findVets['vets'], title: "Let’s Find Your Vet", subTitle: 'Explore',
                  cWidth: size.width, cHeight: size.width * 0.36),
            ],
          ),
        );
      case Orientation.portrait:
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 18),
              HomeSliderSpecialOffer(title: "Special Offers", subTitle: '(1/7)',
                  cWidth: size.width, cHeight: size.height * 0.27),
              SizedBox(height: 15),
              HomeUpcomingAppointments(title: "Upcoming Schedule",
                  subTitle: '',
                  cWidth: size.width,
                  cHeight: size.height),
              SizedBox(height: 5),
              HomeSliderService(serviceList: services['services'],
                  title: "Pick Your Service",
                  subTitle: 'See All',
                  cWidth: size.width,
                  cHeight: size.height * 0.30),
              SizedBox(height: 5),
              HomeSliderMyPets(title: "My Pets",
                  subTitle: '',
                  cWidth: size.width,
                  cHeight: size.height * 0.30),
              SizedBox(height: 15),
              HomeFindVet(myVets: findVets['vets'], title: "Let’s Find Your Vet", subTitle: 'Explore',
                  cWidth: size.width, cHeight: size.height * 0.36),
            ],
          ),
        );

    }
  }
}
