import'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petzola/common/commons.dart';

import 'package:petzola/common/commons.dart';
import 'package:petzola/common/common_z.dart';
import 'package:petzola/common/style.dart';
import 'package:petzola/localization/language_constants.dart';
import 'package:petzola/screens/notification/notification_screen.dart';
import 'package:petzola/screens/offers/book_offer_screen.dart';



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

  ]};

  Map<String, dynamic> findVets = {'vets': [
    {
      "name": "General Consultation",
      "image": "lib/assets/images/myVet_1.png"
    },
    {
      "name": "Vaccination",
      "image": "lib/assets/images/myVet_2.png"
    }
  ]};

  Map<String, dynamic> specialOffers = {'offers': [
    {
      "title": "30% Offers",
      "detail": "Check For Deals For Today",
      "image": "lib/assets/images/home_bandAid.png"
    },
    {
      "title": "15% Offers",
      "detail": "Check For Deals For Today",
      "image": "lib/assets/images/home_bandAid.png"
    },
    {
      "title": "20% Offers",
      "detail": "Check For Deals For Today",
      "image": "lib/assets/images/home_bandAid.png"
    },
    {
      "title": "8% Offers",
      "detail": "Check For Deals For Today",
      "image": "lib/assets/images/home_bandAid.png"
    },
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
              HomeSliderSpecialOffer(offers: specialOffers['offers'], title: "Special Offers", subTitle: '(1/7)',
                  cWidth: size.width, cHeight: size.width * 0.24,
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>BookOfferScreen()));
              },),
              SizedBox(height: 15),
              HomeUpcomingAppointments(title: "Upcoming Schedule",
                  subTitle: 'Clarke Kent',
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
                  cWidth: size.width, cHeight: size.width * 0.40),
              SizedBox(height: 70,)
            ],
          ),
        );
      case Orientation.portrait:
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 18),
              HomeSliderSpecialOffer(offers: specialOffers['offers'], title: 'Special Offers', subTitle: '(1/7)',
                  cWidth: size.width, cHeight: size.height * 0.18,onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>BookOfferScreen()));
                },),
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
                  cWidth: size.width, cHeight: size.height * 0.40),
              SizedBox(height: 90,),

            ],
          ),
        );

    }
  }
}
