import 'package:flutter/material.dart';
import 'package:testing_new_things/version_3_24/widgets/carousel.dart';

class Version3e24 extends StatelessWidget {
  const Version3e24({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        bottom: false,
        child: CarouselViewExample(),
      ),
    );
  }
}
