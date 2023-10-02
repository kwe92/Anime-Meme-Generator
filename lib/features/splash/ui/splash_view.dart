import 'dart:math';

import 'package:anime_meme_generator/features/shared/utilities/images.dart';
import 'package:flutter/material.dart';

// TODO: Rotate between a few pictures when loading the app

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final imgIndex = Random().nextInt(2);

    final imageList = <AssetImage>[
      const AssetImage(Images.loading0),
      const AssetImage(Images.loading1),
    ];

    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: imageList[imgIndex],
          ),
        ),
        child: const Center(
          child: SizedBox(
            height: 100,
            width: 100,
            child: CircularProgressIndicator(
              color: Color(0xff0c0231),
            ),
          ),
        ),
      ),
    );
  }
}
