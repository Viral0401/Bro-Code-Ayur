import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'carousel_card.dart';

class SLiderCarousel extends StatelessWidget {
  const SLiderCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 2.0,
        enlargeCenterPage: true,
      ),
      items: const [
        CarouselCard(
          headText: 'Looking For Your Desire',
          subheadText: 'Specialist Doctor?',
          NamedText: 'Dr Asma Khan',
          specialist: "Heart Specialist",
          cliniclist: "Good Health Clinic",
          asset: 'assets/images/Asma_Khan.png',
        ),
        CarouselCard(
          headText: 'Looking For Your Desire',
          subheadText: 'Specialist Doctor?',
          NamedText: 'Dr Asma Khan',
          specialist: "Heart Specialist",
          cliniclist: "Good Health Clinic",
          asset: 'assets/images/Asma_Khan.png',
        ),
        CarouselCard(
          headText: 'Looking For Your Desire',
          subheadText: 'Specialist Doctor?',
          NamedText: 'Dr Asma Khan',
          specialist: "Heart Specialist",
          cliniclist: "Good Health Clinic",
          asset: 'assets/images/Asma_Khan.png',
        ),
      ],
    );
  }
}
