import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "/Users/kwe/flutter-projects/AnimeMemeGenerator/anime_meme_generator/assets/ab39ec-Obito-uchiha-ten-tails-jinchuriki-wallpaper-hd-1920x1440.jpg",
            ),
          ),
        ),
        child: const Center(
          child: SizedBox(
            height: 100,
            width: 100,
            child: CircularProgressIndicator(
              color:
                  //  Color(0xff805ff8),
                  Color(0xff0c0231),
            ),
          ),
        ),
      ),
    );
  }
}
